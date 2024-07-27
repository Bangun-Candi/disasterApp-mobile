import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:get/get.dart';
import 'package:merchant_app/core/global_component/icons_app_component.dart';
import 'package:merchant_app/core/utils/cconstant.dart';
import 'package:merchant_app/core/utils/vcolor_utils.dart';
import 'package:merchant_app/core/utils/vimage_constant.dart';
import 'package:merchant_app/pages/onboarding/onboard/controller/onboarding_page_controller.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(OnboardingPageController());
    return BaseWidgetContainer(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              VImageConstant.onboardingBg, // Your image asset here
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: Cconstant.getFullHeight(context) * 0.1,
              left: 29,
              right: 29,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CText(
                  text: "Welcome to",
                  fontSize: 27,
                  fontWeight: FontWeight.w500,
                ),
                IconAppComponent(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(
                left: 29,
                right: 29,
                bottom: Cconstant.getFullHeight(context) * 0.08,
              ),
              child: Column(
                children: [
                  CustomButton(
                    onPressed: () {},
                    titleButton: "Login",
                    fontSize: 17,
                    fontColor: VColorUtils.backgroundColors,
                    fontWeight: FontWeight.w700,
                    buttonHeight: 54,
                    backgroundColors:
                        VColorUtils.backgroundColors.withOpacity(0.4),
                    needBorder: true,
                    borderColors: VColorUtils.textWhiteColors,
                    borderRadius: 30,
                    removeElevation: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CText(
                        text: "Don't have account? ",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        textColor: VColorUtils.textWhiteColors,
                      ),
                      InkWell(
                        onTap: () {
                          _controller.gotoSignup();
                        },
                        child: const CText(
                          text: "Sign up",
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          textColor: VColorUtils.textWhiteColors,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
