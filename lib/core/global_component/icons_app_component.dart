import 'package:flutter/material.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:merchant_app/core/utils/vcolor_utils.dart';

class IconAppComponent extends StatelessWidget {
  const IconAppComponent({super.key, this.fontSize});

  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CText(
          text: "Life",
          fontSize: fontSize ?? 40,
          fontWeight: FontWeight.w900,
        ),
        CText(
          text: "Beacon",
          textColor: VColorUtils.primaryColors,
          fontSize: fontSize ?? 40,
          fontWeight: FontWeight.w900,
        ),
      ],
    );
  }
}
