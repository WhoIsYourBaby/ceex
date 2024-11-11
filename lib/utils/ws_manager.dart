import 'dart:async';

import 'package:ceex_flutter/model/model.dart';
import 'package:ceex_flutter/model/websocket/ws_model.dart';
import 'package:ceex_flutter/utils/config.dart';
import 'package:ceex_flutter/utils/ext.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as WsStatus;
/**
{
    event = sub;
    markets = "";
    params =     {
        binary = 1;
        realtimeInterval = 24h;
    };
    symbol = "301.BTCUSDT,301.ETHUSDT,301.LTCUSDT,301.SOLUSDT,301.ARBUSDT,301.LINKUSDT";
    topic = realtimes;
}

{"id":"1","topic":"topN","event":"sub","params":{"binary":true,"org":"6066","realtimeInterval":"24h","type":1,"limit":"15"}}
 */

class WsManager {
  WebSocketChannel? _wsChannel;
  StreamSubscription? _wsSubscription;
  WsManager._() {
    Timer.periodic(const Duration(seconds: 6), heartbeatSchedule);
  }

  static final WsManager _shared = WsManager._();

  static WsManager get shared => _shared;

  int _id = 1;
  int get id => _id;

  bool _hasPing = false;

  final Map<int, WsRequestAdapter> _subIdMap = {};

  Future<void> openConnect() async {
    if (_wsChannel != null && _wsChannel?.closeCode == null) {
      return;
    }
    final wsUrl = Uri.parse(kWsBaseUrl);
    _wsChannel = WebSocketChannel.connect(wsUrl);
    await _wsChannel?.ready;

    _wsSubscription = _wsChannel?.stream.listen(
      (event) {
        if (event is String) {
          final jsonStr = event as String;
          final jsonObj = jsonStr.toJSON();
          final dyId = jsonObj["id"];
          final ping = jsonObj["ping"];
          final pong = jsonObj["pong"];
          if (ping != null) {
            sendPingPong("pong");
          } else if (pong != null) {
            _hasPing = false;
          } else {
            if (dyId == null) {
              print(jsonObj);
              return;
            }
            final respId = (jsonObj["id"] is String)
                ? (int.tryParse(jsonObj["id"]) ?? 0)
                : (jsonObj["id"] as int);
            dynamic topic = jsonObj["topic"];
            // print("Topic--->" + topic);
            final originReq = _subIdMap[respId];
            if (originReq != null) {
              originReq.responseCallback(jsonObj);
            }
          }
        }
      },
      onError: (err) {
        print(err.toString());
      },
      onDone: () {
        print("done");
      },
    );
  }

  /// 返回订阅id，查见cancelById
  int subscribe(WsRequestAdapter req) {
    _id++;
    final reqCopy = req.copyWithId(_id);
    _subIdMap[_id] = reqCopy;
    final jsonStr = reqCopy.model.toJson().toJSONString();
    print("开始订阅--->" + jsonStr);
    _wsChannel?.sink.add(jsonStr);
    return _id;
  }

  /// 根据id取消订阅
  WsRequestAdapter? cancelById(int id) {
    final oldReq = _subIdMap.remove(id);
    if (oldReq != null) {
      final jsonStr = oldReq.model.cancel().toJson().toJSONString();
      print("取消订阅--->" + jsonStr);
      _wsChannel?.sink.add(jsonStr);
    }
    return oldReq;
  }

  heartbeatSchedule(Timer timer) {
    if (_hasPing) {
      // 表明超过duration没有收到pong消息
      // 表明网络超时
      _wsChannel?.sink.close();
      _wsChannel = null;
      _wsSubscription?.cancel();
      _wsSubscription = null;
      openConnect();
    } else {
      sendPingPong("ping");
    }
  }

  /// [key]: ping/pong
  sendPingPong(String key) {
    // NSDictionary *pong = @{@"pong":[NSString stringWithFormat:@"%@", ping]};
    final pong = {
      key: DateTime.now().millisecondsSinceEpoch.toString(),
    };
    _wsChannel?.sink.add(pong.toJSONString());
  }
}

class WsRequestAdapter {
  final WsRequestModel model;
  final void Function(Map<String, dynamic> result) responseCallback;

  final void Function(WsError error) errorCallback;

  /// 订阅失败的错误
  WsError? error;

  WsRequestAdapter({
    required this.model,
    required this.responseCallback,
    required this.errorCallback,
    this.error,
  });

  WsRequestAdapter copyWithId(int id) {
    final model = this.model.copyWith(
          id: id.toString(),
        );
    return WsRequestAdapter(
      model: model,
      responseCallback: responseCallback,
      errorCallback: errorCallback,
      error: error,
    );
  }
}

class WsError extends Error {
  final int code;
  final String message;
  WsError({
    required this.code,
    required this.message,
  });
}

mixin WsResponseMixin {
  final Set<int> subscriptionIds = Set<int>();
  void onWebsocketResponse(Map<String, dynamic> json);

  void onWebsocketError(WsError error);

  void subscribe();

  addSubscriptionId(int id) {
    subscriptionIds.add(id);
  }

  cancelById(int id) {
    if (subscriptionIds.contains(id)) {
      WsManager.shared.cancelById(id);
      subscriptionIds.remove(id);
    }
  }

  cancelSubscriptions() {
    final tmpIds = {...subscriptionIds};
    tmpIds.forEach(cancelById);
  }
}
