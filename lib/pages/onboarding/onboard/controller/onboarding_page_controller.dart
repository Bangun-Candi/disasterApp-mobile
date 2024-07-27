import 'package:get/get.dart';
import 'package:merchant_app/pages/onboarding/signup/signup_page.dart';

class OnboardingPageController extends GetxController {
  gotoSignup() {
    Get.to(() => const SignupPage());
  }

  gotoLogin() {}
}
