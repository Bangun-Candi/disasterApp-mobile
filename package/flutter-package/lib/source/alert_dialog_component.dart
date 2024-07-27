import 'package:flutter/material.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:flutter_package/source/custom_button.dart';
import 'package:flutter_package/utils/ccolor_utils.dart';
import 'package:flutter_package/utils/images_utils.dart';
import 'package:get/route_manager.dart';

class AlertDialogComponent extends StatelessWidget {
  const AlertDialogComponent(
      {super.key,
      this.message,
      this.imageAssets,
      this.actionOnPressed,
      this.description,
      this.withAction,
      this.customAction,
      this.actionButtonMessage});

  final String? message;
  final String? description;
  final String? actionButtonMessage;
  final String? imageAssets;
  final bool? withAction;
  final VoidCallback? actionOnPressed;
  final List<Widget>? customAction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: CColorUtils.backgroundColors,
      icon: Image.asset(
        imageAssets ?? ImageUtils.checkmarkIcons,
        width: 76,
        height: 76,
      ),
      actionsAlignment: MainAxisAlignment.center,
      title: CText(
        text: message ?? "Selamat Bergabung Fadhil!!",
        textColor: CColorUtils.titleTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      content: CText(
        text: description ??
            "Sekarang kamu sudah bisa memesan\nlapangan yang kamu inginkan",
        textAlign: TextAlign.center,
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
      actions: customAction ??
          [
            withAction ?? false
                ? CustomButton(
                    onPressed: () {
                      Get.back();

                      if (actionOnPressed != null) {
                        actionOnPressed!();
                      }
                    },
                    titleButton: actionButtonMessage ?? "Back",
                  )
                : const SizedBox(),
          ],
    );
  }
}
