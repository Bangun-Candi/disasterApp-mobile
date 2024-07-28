import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant_app/pages/main_home_page/main_home_page.dart';

class SigninPageController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // email
  RxBool loadingEmail = false.obs;
  RxBool emailError = false.obs;
  RxString emailErrorMessage = "".obs;

  RxBool obsecurePassword = true.obs;

  RxBool enableButton = false.obs;

  RxBool isLoadingVerification = false.obs;

  @override
  void onInit() async {
    super.onInit();

    passwordController.addListener(
      () {
        validateButton();
      },
    );
  }

  validateEmail() async {
    if (emailController.text.isEmail) {
      emailError.value = false;
      emailErrorMessage.value = "";
    } else {
      emailError.value = true;
      emailErrorMessage.value = "email tidak valid";
      validateButton();
    }

    if (emailController.text.isEmpty) {
      emailError.value = false;
      emailErrorMessage.value = "";
      validateButton();
    }
  }

  validateButton() {
    if ((emailController.text.isNotEmpty && !emailError.value) &&
        passwordController.text.isNotEmpty) {
      enableButton.value = true;
    } else {
      enableButton.value = false;
    }
  }

  hidePassword() {
    obsecurePassword.value = !obsecurePassword.value;
  }

  verificationSignin() async {
    isLoadingVerification.value = true;

    await Future.delayed(const Duration(milliseconds: 600));

    Get.to(() => const MainHomePage());

    isLoadingVerification.value = false;
  }
}
