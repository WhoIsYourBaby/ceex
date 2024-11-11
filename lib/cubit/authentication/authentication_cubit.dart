import 'package:ceex_flutter/model/authentication/kyc_authentication_information_model.dart';
import 'package:ceex_flutter/model/publish/countries_model.dart';
import 'package:ceex_flutter/repository/user_repository.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oktoast/oktoast.dart';

part 'authentication_state.dart';
part 'authentication_cubit.freezed.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final ImagePicker picker = ImagePicker();

  AuthenticationCubit()
      : super(const AuthenticationState.initial(
            kycInfoList: [],
            requestSuccess: false,
            nationality: "",
            shortName: ""));

  // 获取用户认证信息
  void getVerifyInfo() {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final resp = repo.verifyInfo();
    resp.then((value) {
      emit(state.copyWith(
          name: "${value.data.firstName}${value.data.secondName}",
          number: value.data.cardNo));
      getUserKycLevel();
    });
  }

  // 获取用户KYC级别信息
  void getUserKycLevel() {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final resp = repo.userKycLevel();
    resp.then((value) {
      emit(state.copyWith(kycInfoList: value.data));
      dismissAllToast();
    });
  }

  // 实名认证上传图片
  void upLoadImageLoad({
    required XFile xFile,
    required PicType picType,
  }) async {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "upload_image_file": await MultipartFile.fromFile(xFile.path), // 二次验证码
    });
    final resp = repo.verifyUploadImage(formData);
    resp.then((value) {
      if (picType == PicType.font) {
        emit(state.copyWith(
            fontImagePath: xFile.path, fontImageUrl: value.data.url));
      } else if (picType == PicType.rear) {
        emit(state.copyWith(
            rearImagePath: xFile.path, rearImageUrl: value.data.url));
      }
      dismissAllToast();
    });
  }

  // kyc基础认证
  kycBasicverify() {
    final repo = GetIt.I.get<UserRepository>();
    final FormData formData;
    if ((state.shortName ?? "").isEmpty) {
      showMsg("请选择地址");
      return;
    }
    if (state.shortName == "CN") {
      if ((state.name ?? "").isEmpty) {
        showMsg("请填写名字");
        return;
      }
      if ((state.documentCode ?? "").isEmpty) {
        showMsg("请填写身份证号");
        return;
      }
      formData = FormData.fromMap({
        "country_code": state.shortName,
        "name": state.name,
        "card_type": 1,
        "card_no": state.documentCode,
      });
    } else {
      if ((state.name ?? "").isEmpty) {
        showMsg("请填写姓氏");
        return;
      }
      if ((state.surName ?? "").isEmpty) {
        showMsg("请填写名字");
        return;
      }
      if ((state.documentType ?? 0) == 0) {
        showMsg("请选择证件类型");
        return;
      }
      if ((state.documentCode ?? "").isEmpty) {
        showMsg("请填写证件号");
        return;
      }
      formData = FormData.fromMap({
        "country_code": state.shortName,
        "first_name": state.name,
        "second_name": state.surName,
        "card_type": state.documentType,
        "card_no": state.documentCode,
      });
    }
    showLoading();
    final resp = repo.kycBasicVerify(formData);
    resp.then((value) {
      emit(state.copyWith(requestSuccess: true));
      dismissAllToast();
    });
  }

  ///{"faceCompare":false,"sdkPrepareInfo":
  ///{"appId":"","version":"","nonce":"","sign":"","orderNo":"","license":"","userId":"","faceId":""}}
  //用户证件照KYC认证
  void kycPhotoVerify() {
    if (state.fontImageUrl == null || state.rearImageUrl == null) {
      showMsg("请上传完整图片信息");
      return;
    }
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "card_front_url": state.fontImageUrl,
      "card_hand_url": state.rearImageUrl,
    });
    final resp = repo.kycPhotoVerify(formData);
    resp.then((value) {
      emit(state.copyWith(requestSuccess: true));
      dismissAllToast();
    });
  }

  // 获取相册照片
  pickImageGallery({
    required PicType picType,
  }) async {
    await picker.pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        upLoadImageLoad(xFile: value, picType: picType);
      } else {
        retrieveLostData(value);
      }
    });
  }

  // 拍照
  pickImageCamera({
    required PicType picType,
  }) async {
    await picker.pickImage(source: ImageSource.camera).then((value) {
      if (value != null) {
        upLoadImageLoad(xFile: value, picType: picType);
      } else {
        retrieveLostData(value);
      }
    });
  }

  //判断照片是否丢失
  Future<void> retrieveLostData(value) async {
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    final List<XFile>? files = response.files;
    if (files != null) {
      // _handleLostFiles(files);
    } else {
      // _handleError(response.exception);
    }
    return;
  }

  // 更新国籍
  upDataNationality(
      CountriesModel countriesModel, TextEditingController controller) {
    emit(state.copyWith(
        nationality: countriesModel.countryName,
        shortName: countriesModel.shortName));
    controller.text = countriesModel.countryName ?? "";
  }

  // 更新name
  upDataName(String name) {
    emit(state.copyWith(
      name: name,
    ));
  }

  // 更新surName
  upDataSurName(String surName) {
    emit(state.copyWith(
      surName: surName,
    ));
  }

  // 更新surName
  upDataDocumentCode(String documentCode) {
    emit(state.copyWith(
      documentCode: documentCode,
    ));
  }

  // 更新证件类型
  upDocumentType(int type, TextEditingController controller) {
    emit(state.copyWith(
      documentType: type,
    ));
    switch (type) {
      case 1:
        controller.text = "身份证";
        break;
      case 2:
        controller.text = "驾照";
        break;
      case 3:
        controller.text = "护照";
        break;
      case 5:
        controller.text = "其它";
        break;
      default:
    }
  }
}
