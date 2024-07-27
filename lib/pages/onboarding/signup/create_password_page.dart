import 'package:flutter/material.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:flutter_package/utils/ccolor_utils.dart';
import 'package:get/get.dart';
import 'package:merchant_app/core/global_component/default_widget_container.dart';
import 'package:merchant_app/core/global_component/vcustom_button.dart';
import 'package:merchant_app/core/global_component/vtext_input_component.dart';
import 'package:merchant_app/core/utils/cconstant.dart';
import 'package:merchant_app/core/utils/vcolor_utils.dart';
import 'package:merchant_app/core/utils/vicons_utils.dart';
import 'package:merchant_app/pages/onboarding/signup/controller/create_password_page_controller.dart';

class CreatePasswordPage extends StatelessWidget {
  const CreatePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(CreatePasswordPageController());
    return Obx(
      () => DefaultWidgetContainer(
        isLoading: _controller.isLoading.value,
        titleAppBar: "Create New Password",
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: Cconstant.getFullHeight(context) * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CText(
                    text: "Let's set up your new password.",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
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
                    height: 20,
                  ),
                  Obx(
                    () => VtextInputComponent(
                      preffixIcon: const Icon(VIconsUtils.passwordIcon),
                      textController: _controller.confirmPasswordController,
                      onTyping: (value) {
                        // _controller.verificationFullName();
                      },
                      errorMsg: "Confirm Password not same as Password",
                      isError: _controller.isErrorConfirm.value,
                      suffixIcon: InkWell(
                        onTap: () {
                          _controller.hideConfirmPassword();
                        },
                        child: Icon(_controller.obsecureConfirmPassword.value
                            ? VIconsUtils.eyeIconClose
                            : VIconsUtils.eyeIconOpen),
                      ),
                      labelInput: "Confirm Password",
                      obsecureText: _controller.obsecureConfirmPassword.value,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    color: VColorUtils.primaryColors,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CText(
                    text: "Your password must be include.",
                    // fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  getPasswordCriteria(context, _controller),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                  padding: EdgeInsets.only(
                      bottom: Cconstant.getFullHeight(context) * 0.06),
                  child: Obx(
                    () => VcustomButton(
                      titleButton: "Create Password",
                      onPressed: () {
                        _controller.verificationPassword();
                      },
                      enableButton: _controller.enableButton.value,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget getPasswordCriteria(
      context, CreatePasswordPageController _controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            children: [
              Obx(
                () => CText(
                  text: 'abc',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  textColor: _controller.isLowercase.value
                      ? CColorUtils.titleTextColor
                      : CColorUtils.titleTextColor.withOpacity(0.3),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const CText(text: 'Lowercase')
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Obx(
                () => CText(
                  text: 'ABC',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  textColor: _controller.isUppercase.value
                      ? CColorUtils.titleTextColor
                      : CColorUtils.titleTextColor.withOpacity(0.3),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const CText(text: 'Uppercase')
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Obx(
                () => CText(
                  text: '123',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  textColor: _controller.isHaveNumber.value
                      ? CColorUtils.titleTextColor
                      : CColorUtils.titleTextColor.withOpacity(0.3),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const CText(text: 'Number')
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Obx(
                () => CText(
                  text: '8+',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  textColor: _controller.isValidCharacter.value
                      ? CColorUtils.titleTextColor
                      : CColorUtils.titleTextColor.withOpacity(0.3),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const CText(text: 'Character')
            ],
          ),
        )
      ],
    );
  }
}
