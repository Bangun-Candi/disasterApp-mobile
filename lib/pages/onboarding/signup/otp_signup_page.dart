import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant_app/core/global_component/votp_component.dart';
import 'package:merchant_app/pages/onboarding/signup/controller/otp_signup_page_controller.dart';

class OtpSignupPage extends StatelessWidget {
  const OtpSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(OtpSignupPageController());
    return Obx(
      () => VOtpComponent(
        email: "ramadhani@gmail.com",
        onResendCode: () {
          _controller.resendCode();
        },
        onSubmitCode: (verifyCode) {
          _controller.submitOTPcode(verifyCode);
        },
        isLoadingProcess: _controller.isLoading.value,
      ),
    );
  }
}
