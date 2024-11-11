import 'package:ceex_flutter/model/invitation/invitation_bonus_model.dart';
import 'package:ceex_flutter/model/invitation/invitation_feeback_model.dart';
import 'package:ceex_flutter/model/invitation/invitation_info_model.dart';
import 'package:ceex_flutter/model/invitation/invitation_relation_model.dart';
import 'package:ceex_flutter/model/invitation/invitation_temp_model.dart';
import 'package:ceex_flutter/repository/user_repository.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:oktoast/oktoast.dart';
import 'package:retrofit/dio.dart';

part 'invitation_state.dart';
part 'invitation_cubit.freezed.dart';

class InvitationCubit extends Cubit<InvitationState> {
  InvitationCubit() : super(InvitationState.initial());

  void init() {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final resp = repo.invitationInfoGet();
    resp.then((value) async {
      emit(state.copyWith(infoModel: value.data));
      getBonusList();
    });
  }

  getBonusList() {
    final repo = GetIt.I.get<UserRepository>();
    final resp = repo.invitationBounsList();
    resp.then((value) {
      emit(state.copyWith(bonusModel: value.data));
      dismissAllToast();
    });
  }

  // 海报
  Future<HttpResponse<InvitationTempModel>> invitationTemplate() async {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final resp = await repo.invitationTemplateInfo();
    emit(state.copyWith(tempModel: resp.data));
    dismissAllToast();
    return resp;
  }
}
