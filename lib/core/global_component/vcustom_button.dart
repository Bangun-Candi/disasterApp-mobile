import 'package:flutter/material.dart';
import 'package:flutter_package/source/custom_button.dart';
import 'package:merchant_app/core/utils/vcolor_utils.dart';

class VcustomButton extends StatelessWidget {
  const VcustomButton({
    super.key,
    required this.titleButton,
    required this.onPressed,
    this.enableButton = true,
  });

  final String titleButton;
  final VoidCallback onPressed;
  final bool? enableButton;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: onPressed,
      titleButton: titleButton,
      buttonHeight: 54,
      fontSize: 17,
      fontColor: VColorUtils.backgroundColors,
      fontWeight: FontWeight.w700,
      backgroundColors: VColorUtils.secondaryColors,
      borderRadius: 30,
      removeElevation: true,
      enableButton: enableButton,
      backgroundDisableColors: VColorUtils.primaryColors.withOpacity(0.25),
    );
  }
}
