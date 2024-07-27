import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant_app/core/global_component/vcamera_component.dart';
import 'package:merchant_app/pages/onboarding/signup/controller/ocr_ktp_page_controller.dart';

class OcrKtpPage extends StatelessWidget {
  const OcrKtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(OcrKtpPageController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: VCameraComponent(
        getDataScan: (getScanResult) {
          _controller.getScanData(getScanResult);
        },
      ),
    );
  }
}
