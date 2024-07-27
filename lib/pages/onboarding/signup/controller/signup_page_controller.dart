import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:merchant_app/pages/onboarding/signup/otp_signup_page.dart';

class SignupPageController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  FocusNode focusNode = FocusNode();

  RxBool isLoadingVerification = false.obs;

  // email
  RxBool loadingEmail = false.obs;
  RxBool emailError = false.obs;
  RxString emailErrorMessage = "".obs;
  Timer? _debounceEmail;

  // phone number
  RxBool loadingPhoneNumber = false.obs;
  RxBool phoneNumberError = false.obs;
  RxString phoneNumberErrorMessage = "".obs;
  Timer? _debouncePhoneNumber;

  RxBool enableButton = false.obs;

  String preffixPhoneNumber = "62";

  verificationFullName() {
    validateButton();
  }

  verificationSignup() async {
    isLoadingVerification.value = true;

    await Future.delayed(const Duration(milliseconds: 600));

    Get.to(() => const OtpSignupPage());

    isLoadingVerification.value = false;
  }

  validateEmail() async {
    if (emailController.text.isEmail) {
      emailError.value = false;
      emailErrorMessage.value = "";
      if (_debounceEmail?.isActive ?? false) _debounceEmail!.cancel();
      _debounceEmail = Timer(
        const Duration(milliseconds: 500),
        () async {
          loadingEmail.value = true;

          await Future.delayed(const Duration(milliseconds: 600));

          loadingEmail.value = false;

          validateButton();
        },
      );
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

  validatePhoneNumber() async {
    phoneNumberError.value = false;
    phoneNumberErrorMessage.value = "";

    if (_debouncePhoneNumber?.isActive ?? false) _debouncePhoneNumber!.cancel();
    _debouncePhoneNumber = Timer(
      const Duration(milliseconds: 500),
      () async {
        loadingPhoneNumber.value = true;

        await Future.delayed(const Duration(milliseconds: 600));

        loadingPhoneNumber.value = false;
        validateButton();
      },
    );

    if (phoneNumberController.text.isEmpty) {
      phoneNumberError.value = false;
      phoneNumberErrorMessage.value = "";
      validateButton();
    }
  }

  validateButton() {
    if (fullNameController.text.isNotEmpty &&
        (emailController.text.isNotEmpty && !emailError.value) &&
        (phoneNumberController.text.isNotEmpty && !phoneNumberError.value)) {
      enableButton.value = true;
    } else {
      enableButton.value = false;
    }
  }
}
