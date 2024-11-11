part of 'announcement_cubit.dart';

@freezed
class AnnouncementState with _$AnnouncementState {
  const factory AnnouncementState.initial({
    List<AnnouncementModel>? announcementList,
  }) = _Initial;
}
