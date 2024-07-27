import 'package:flutter_package/flutter_package.dart';
import 'package:get/get.dart';
import 'package:merchant_app/pages/onboarding/signup/ocr_ktp_page.dart';
import 'package:permission_handler/permission_handler.dart';

class OcrKtpAggrementPageController extends GetxController {
  onOcrPage() {
    // Get.to(const OcrKtpPage());
    getCameraStatus();
  }

  getCameraStatus() async {
    await Permission.camera.onGrantedCallback(
      () {
        Get.to(() => const OcrKtpPage());
        LogUtility.writeLog("Granted");
      },
    ).onDeniedCallback(
      () {
        LogUtility.writeLog("Denided");
      },
    ).request();
  }
}
