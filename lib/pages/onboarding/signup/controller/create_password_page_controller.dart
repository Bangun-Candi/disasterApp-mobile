import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant_app/pages/onboarding/signup/ocr_ktp_aggrement_page.dart';

class CreatePasswordPageController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isErrorConfirm = false.obs;

  RxBool obsecurePassword = true.obs;
  RxBool obsecureConfirmPassword = true.obs;

  RxBool enableButton = false.obs;

  RxBool isLowercase = false.obs;
  RxBool isUppercase = false.obs;
  RxBool isHaveNumber = false.obs;
  RxBool isValidCharacter = false.obs;

  final RegExp lowercaseRegExp = RegExp(r'[a-z]');
  final RegExp uppercaseRegExp = RegExp(r'[A-Z]');
  final RegExp numberRegExp = RegExp(r'[0-9]');

  @override
  void onInit() async {
    super.onInit();

    passwordController.addListener(
      () {
        if (lowercaseRegExp.hasMatch(passwordController.text)) {
          isLowercase.value = true;
        } else {
          isLowercase.value = false;
        }

        if (uppercaseRegExp.hasMatch(passwordController.text)) {
          isUppercase.value = true;
        } else {
          isUppercase.value = false;
        }

        if (numberRegExp.hasMatch(passwordController.text)) {
          isHaveNumber.value = true;
        } else {
          isHaveNumber.value = false;
        }

        if (passwordController.text.length >= 8) {
          isValidCharacter.value = true;
        } else {
          isValidCharacter.value = false;
        }

        validateInput();
      },
    );

    confirmPasswordController.addListener(
      () {
        if (confirmPasswordController.text.isNotEmpty) {
          if (passwordController.text != confirmPasswordController.text) {
            isErrorConfirm.value = true;
          } else {
            isErrorConfirm.value = false;
          }
        } else {
          isErrorConfirm.value = false;
        }

        validateInput();
      },
    );
  }

  verificationPassword() async {
    isLoading.value = true;

    await Future.delayed(const Duration(milliseconds: 600));

    isLoading.value = false;

    Get.to(() => const OcrKtpAggrementPage());
  }

  hidePassword() {
    obsecurePassword.value = !obsecurePassword.value;
  }

  hideConfirmPassword() {
    obsecureConfirmPassword.value = !obsecureConfirmPassword.value;
  }

  validateInput() {
    if ((passwordController.text.isNotEmpty &&
            confirmPasswordController.text.isNotEmpty) &&
        (isLowercase.value &&
            isUppercase.value &&
            isHaveNumber.value &&
            isValidCharacter.value &&
            !isErrorConfirm.value)) {
      enableButton.value = true;
    } else {
      enableButton.value = false;
    }
  }
}
