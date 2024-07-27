import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:get/get.dart';
import 'package:merchant_app/core/global_component/vcustom_button.dart';
import 'package:merchant_app/core/global_component/vdefault_screen_loading.dart';
import 'package:merchant_app/core/global_component/vtext_input_component.dart';
import 'package:merchant_app/core/utils/cconstant.dart';
import 'package:merchant_app/core/utils/vcolor_utils.dart';
import 'package:merchant_app/core/utils/vicons_utils.dart';
import 'package:merchant_app/core/utils/vimage_constant.dart';
import 'package:merchant_app/pages/onboarding/signup/controller/signup_page_controller.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(SignupPageController());
    return BaseWidgetContainer(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            VImageConstant.authBg,
          ),
          Container(
            margin: EdgeInsets.only(
              top: Cconstant.getFullHeight(context) * 0.12,
              right: 27,
              left: 27,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CText(
                  text: 'Sign up',
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: Cconstant.getFullHeight(context) * 0.11,
                ),
                const CText(
                  text: "Full Name",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  textColor: VColorUtils.textGreyColors,
                ),
                const SizedBox(
                  height: 20,
                ),
                VtextInputComponent(
                  preffixIcon: const Icon(VIconsUtils.accountIcon),
                  textController: _controller.fullNameController,
                  onTyping: (value) {
                    _controller.verificationFullName();
                  },
                  labelInput: "Full Name",
                ),
                const SizedBox(
                  height: 20,
                ),
                const CText(
                  text: "Email",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  textColor: VColorUtils.textGreyColors,
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => VtextInputComponent(
                    preffixIcon: const Icon(VIconsUtils.emailIcon),
                    textController: _controller.emailController,
                    labelInput: "Email",
                    onTyping: (email) {
                      _controller.validateEmail();
                    },
                    isError: _controller.emailError.value,
                    errorMsg: _controller.emailErrorMessage.value,
                    suffixIcon: _controller.loadingEmail.value
                        ? const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: CircularProgressIndicator(
                              color: VColorUtils.primaryColors,
                            ),
                          )
                        : const SizedBox(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CText(
                  text: "Phone Number",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  textColor: VColorUtils.textGreyColors,
                ),
                const SizedBox(
                  height: 20,
                ),
                VtextInputComponent(
                  focusNode: _controller.focusNode,
                  preffixIcon: const Icon(VIconsUtils.phoneIcon),
                  suffixIcon: Obx(
                    () => _controller.loadingPhoneNumber.value
                        ? const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: CircularProgressIndicator(
                              color: VColorUtils.primaryColors,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CText(
                                  text: "+${_controller.preffixPhoneNumber}",
                                  fontSize: 17,
                                  textColor: VColorUtils.textGreyColors,
                                ),
                              ],
                            ),
                          ),
                  ),
                  textController: _controller.phoneNumberController,
                  labelInput: "Phone Number",
                  keyboardType: TextInputType.phone,
                  onTyping: (phoneNumber) {
                    _controller.validatePhoneNumber();
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                Obx(
                  () => VcustomButton(
                    titleButton: "Sign up",
                    onPressed: () {
                      _controller.verificationSignup();
                    },
                    enableButton: _controller.enableButton.value,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CText(
                      text: "Have account? ",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      // textColor: VColorUtils.textWhiteColors,
                    ),
                    InkWell(
                      onTap: () {
                        // _controller.gotoSignup();
                      },
                      child: const CText(
                        text: "Login",
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        // textColor: VColorUtils.textWhiteColors,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Obx(
            () => _controller.isLoadingVerification.value
                ? const VdefaultScreenLoading()
                : const SizedBox(),
          )
        ],
      ),
    );
  }
}
