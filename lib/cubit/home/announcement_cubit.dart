import 'package:bloc/bloc.dart';
import 'package:ceex_flutter/repository/basic_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ceex_flutter/model/model.dart';
import 'package:get_it/get_it.dart';

part 'announcement_state.dart';
part 'announcement_cubit.freezed.dart';

class AnnouncementCubit extends Cubit<AnnouncementState> {
  final _repo = GetIt.I.get<BasicRepository>();
  AnnouncementCubit() : super(AnnouncementState.initial());

  Future requestAnnouncement() async {
    final resp = await _repo.getAnnouncements();
    final dataList = resp.data;
    emit(state.copyWith(announcementList: dataList));
  }
}
