import 'package:get/get.dart';
import 'package:merchant_app/pages/onboarding/signup/create_password_page.dart';

class OtpSignupPageController extends GetxController {
  RxBool isLoading = false.obs;
  resendCode() {}

  submitOTPcode(String otpCode) async {
    isLoading.value = true;

    await Future.delayed(const Duration(milliseconds: 600));

    isLoading.value = false;

    Get.to(() => const CreatePasswordPage());
  }
}
