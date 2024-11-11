/// 首页币行情tab枚举
enum HomeTabType {
  /// 收藏
  star,

  /// 热门榜
  hot,

  /// 涨幅榜
  top,

  /// 新币榜
  newc,
}

enum WsEventType {
  sub,
  cancel,
  cancelAll,
}

extension WsEventTypeString on WsEventType {
  String get value {
    switch (this) {
      case WsEventType.sub:
        return "sub";
      case WsEventType.cancel:
        return "cancel";
      case WsEventType.cancelAll:
        return "cancel_all";
    }
  }
}

enum WsTopicType {
  realtimes,
  trade,
  depth,
  diffDepth,
  broker,
  topN,
  slowBroker,
  kline,
}

extension WsTopicTypeString on WsTopicType {
  String get value {
    switch (this) {
      case WsTopicType.realtimes:
        return "realtimes";
      case WsTopicType.trade:
        return "trade";
      case WsTopicType.depth:
        return "depth";
      case WsTopicType.diffDepth:
        return "diffDepth";
      case WsTopicType.broker:
        return "broker";
      case WsTopicType.topN:
        return "topN";
      case WsTopicType.slowBroker:
        return "slowBroker";
      case WsTopicType.kline:
        return "kline";
    }
  }
}

/// 1m, 5m, 15m, 30m, 1h, 2h, 4h, 6h, 12h, 1d, 1d+8, 1w, 1w+8, 1M, 1M+8
enum WsKlineTime {
  min1,
  min5,
  min15,
  min30,
  hour1,
  hour2,
  hour4,
  hour6,
  hour12,
  day,
  week,
  month,
}

extension WsKlineTimeExt on WsKlineTime {
  String get value {
    switch (this) {
      case WsKlineTime.min1:
        return "1m";
      case WsKlineTime.min5:
        return "5m";
      case WsKlineTime.min15:
        return "15m";
      case WsKlineTime.min30:
        return "30m";
      case WsKlineTime.hour1:
        return "1h";
      case WsKlineTime.hour2:
        return "2h";
      case WsKlineTime.hour4:
        return "4h";
      case WsKlineTime.hour6:
        return "6h";
      case WsKlineTime.hour12:
        return "12h";
      case WsKlineTime.day:
        return "1d";
      case WsKlineTime.week:
        return "1w";
      case WsKlineTime.month:
        return "1M";
    }
  }

  int get inSeconds {
    switch (this) {
      case WsKlineTime.min1:
        return 60;
      case WsKlineTime.min5:
        return 60 * 5;
      case WsKlineTime.min15:
        return 60 * 15;
      case WsKlineTime.min30:
        return 60 * 30;
      case WsKlineTime.hour1:
        return 60 * 60;
      case WsKlineTime.hour2:
        return 60 * 60 * 2;
      case WsKlineTime.hour4:
        return 60 * 60 * 4;
      case WsKlineTime.hour6:
        return 60 * 60 * 6;
      case WsKlineTime.hour12:
        return 60 * 60 * 12;
      case WsKlineTime.day:
        return 60 * 60 * 24;
      case WsKlineTime.week:
        return 60 * 60 * 24 * 7;
      case WsKlineTime.month:
        return 60 * 60 * 24 * 30;
    }
  }

  static WsKlineTime fromValue(String value) {
    final result =
        WsKlineTime.values.firstWhere((element) => element.value == value);
    return result;
  }
}
