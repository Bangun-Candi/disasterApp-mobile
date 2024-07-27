import 'dart:convert';

import 'package:flutter_package/flutter_package.dart';
import 'package:get/get.dart';
import 'package:merchant_app/pages/onboarding/signup/model/idcard_model.dart';

class OcrKtpPageController extends GetxController {
  IdCardModel? idCardModel;

  getScanData(List<String> data) {
    idCardModel = IdCardModel(
      birthPlace: data[4].toString(),
      birthdate: data[5].toString(),
      gender: data[6].toString(),
      bloodGroup: data[7].toString(),
      address: data[8].toString(),
      rtrw: data[9].toString(),
      nik: data[11].toString(),
    );

    LogUtility.writeLog("data parse : ${jsonEncode(idCardModel)}");
  }
}
