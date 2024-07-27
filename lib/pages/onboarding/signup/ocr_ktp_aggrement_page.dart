import 'package:flutter/material.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:get/get.dart';
import 'package:merchant_app/core/global_component/default_widget_container.dart';
import 'package:merchant_app/core/global_component/vcustom_button.dart';
import 'package:merchant_app/core/utils/cconstant.dart';
import 'package:merchant_app/core/utils/vimage_constant.dart';
import 'package:merchant_app/pages/onboarding/signup/controller/ocr_ktp_aggrement_page_controller.dart';

class OcrKtpAggrementPage extends StatelessWidget {
  const OcrKtpAggrementPage({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(OcrKtpAggrementPageController());
    return DefaultWidgetContainer(
      titleAppBar: "Validate KTP Aggrement",
      body: Stack(
        children: [
          Column(
            children: [
              Image.asset(
                VImageConstant.ktpIllustration,
              ),
              const SizedBox(
                height: 40,
              ),
              const CText(
                textAlign: TextAlign.justify,
                text:
                    "Before we continue your onboarding, we ask permission to validate the ID card(KTP) you have. The captured data is only used to validate Dukcapil, not used for anything that endangers your personal data.",
                fontSize: 15,
              )
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: Cconstant.getFullHeight(context) * 0.06),
              child: VcustomButton(
                titleButton: "Next",
                onPressed: () {
                  _controller.onOcrPage();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
