import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:merchant_app/pages/onboarding/onboard/onboarding_page.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    splasScreenStart();
  }

  splasScreenStart() async {
    // bool loginStatus = await getLoginStatus();
    await Future.delayed(const Duration(seconds: 1));

    Get.offAll(() => const OnboardingPage());

    // if (loginStatus) {
    //   Get.offAll(const MainHome());
    // } else {
    //   Get.offAll(const OnboardingPage());
    // }
  }
}
