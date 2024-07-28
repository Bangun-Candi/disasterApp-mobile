import 'package:flutter/material.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:get/get.dart';
import 'package:merchant_app/core/global_component/vcustom_button.dart';
import 'package:merchant_app/core/global_component/vdefault_screen_loading.dart';
import 'package:merchant_app/core/global_component/vtext_input_component.dart';
import 'package:merchant_app/core/utils/cconstant.dart';
import 'package:merchant_app/core/utils/vcolor_utils.dart';
import 'package:merchant_app/core/utils/vicons_utils.dart';
import 'package:merchant_app/core/utils/vimage_constant.dart';
import 'package:merchant_app/pages/onboarding/signin/controller/signin_page_controller.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(SigninPageController());
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
                  text: 'Sign in',
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: Cconstant.getFullHeight(context) * 0.11,
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
                  text: "Password",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  textColor: VColorUtils.textGreyColors,
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => VtextInputComponent(
                    preffixIcon: const Icon(VIconsUtils.passwordIcon),
                    textController: _controller.passwordController,
                    onTyping: (value) {
                      // _controller.verificationFullName();
                    },
                    suffixIcon: InkWell(
                      onTap: () {
                        _controller.hidePassword();
                      },
                      child: Icon(_controller.obsecurePassword.value
                          ? VIconsUtils.eyeIconClose
                          : VIconsUtils.eyeIconOpen),
                    ),
                    labelInput: "Password",
                    obsecureText: _controller.obsecurePassword.value,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Obx(
                  () => VcustomButton(
                    titleButton: "Sign in",
                    onPressed: () {
                      _controller.verificationSignin();
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
                      text: "Don't Have Account? ",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      // textColor: VColorUtils.textWhiteColors,
                    ),
                    InkWell(
                      onTap: () {
                        // _controller.gotoSignup();
                      },
                      child: const CText(
                        text: "Sign up",
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
