import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:get/get.dart';
import 'package:merchant_app/core/global_component/icons_app_component.dart';
import 'package:merchant_app/core/utils/cconstant.dart';
import 'package:merchant_app/core/utils/vimage_constant.dart';
import 'package:merchant_app/pages/splashscreen/controller/splashscreen_controller.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(SplashscreenController());
    return BaseWidgetContainer(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            VImageConstant.splashScreenTopBg,
          ),
        ),
        SizedBox(
          height: Cconstant.getFullHeight(context),
          width: Cconstant.getFullWidth(context),
          child: const Center(
            child: IconAppComponent(),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            VImageConstant.splashScreenBottomBg,
          ),
        ),
      ],
    ));
  }
}
