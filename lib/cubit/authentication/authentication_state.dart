part of 'authentication_cubit.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.initial({
    String? name,// 姓名，姓
    String? number,
    String? fontImagePath,
    String? fontImageUrl,
    String? rearImagePath,
    String? rearImageUrl,
    bool? requestSuccess,// 是否认证成功
    String? nationality,// 国家 
    String? shortName,// 国家代码
    String? surName,// 第二个名字
    int? documentType ,// 证件类型
    String? documentCode ,// 证件号码
    List<KycAuthenticationInformationModel>? kycInfoList
  }) = _Initial;
}


enum PicType {
  font, // 前面的照片
  rear, // 背面的照片
}
