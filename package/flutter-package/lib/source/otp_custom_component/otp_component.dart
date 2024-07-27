import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:flutter_package/source/ctext_component.dart';
import 'package:flutter_package/utils/ccolor_utils.dart';
// import 'package:get/get.dart';
// import 'package:keyboard_actions/keyboard_actions.dart';

class OtpComponent extends StatelessWidget {
  const OtpComponent({
    super.key,
    this.onCodeChanged,
    this.onSubmit,
    this.fieldNumber,
    this.fieldRadius,
    this.fieldWidth,
    this.fieldHeight,
    this.borderColors,
    this.cursorColors,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.margin,
    this.focusNode,
    this.focusNodeButtonColors,
  });
  final Function(String)? onCodeChanged;
  final Function(String verificationCode)? onSubmit;
  final int? fieldNumber;
  final double? fieldRadius;
  final double? fieldWidth;
  final double? fieldHeight;
  final Color? borderColors;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? cursorColors;
  final EdgeInsetsGeometry? margin;
  final FocusNode? focusNode;
  final Color? focusNodeButtonColors;

  // KeyboardActionsConfig _buildConfig(BuildContext context) {
  //   return KeyboardActionsConfig(
  //     keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
  //     keyboardBarColor: Colors.grey[200],
  //     nextFocus: false,
  //     actions: [
  //       KeyboardActionsItem(
  //         focusNode: focusNode ?? FocusNode(),
  //         toolbarButtons: [
  //           (node) {
  //             return InkWell(
  //               onTap: () {
  //                 node.unfocus();
  //               },
  //               child: Container(
  //                 margin: const EdgeInsets.only(right: 10),
  //                 decoration: BoxDecoration(
  //                   color: CColorUtils.backgroundColors,
  //                   borderRadius: BorderRadius.circular(8),
  //                 ),
  //                 padding: const EdgeInsets.only(
  //                     right: 14, left: 15, top: 8, bottom: 8),
  //                 child: CText(
  //                   text: "done".tr.toUpperCase(),
  //                   textColor: focusNodeButtonColors,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //             );
  //           }
  //         ],
  //       ),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      keyboardType: TextInputType.number,
      cursorColor: cursorColors,
      numberOfFields: fieldNumber ?? 4,
      showFieldAsBox: true,
      onCodeChanged: onCodeChanged,
      onSubmit: onSubmit,
      borderColor: borderColors ?? CColorUtils.primaryColors,
      enabledBorderColor: enabledBorderColor ?? CColorUtils.borderColors,
      focusedBorderColor: focusedBorderColor ?? CColorUtils.borderColors,
      borderRadius: BorderRadius.all(
        Radius.circular(fieldRadius ?? 6),
      ),
      fieldWidth: fieldWidth ?? 48,
      fieldHeight: fieldHeight ?? 48,
      contentPadding: const EdgeInsets.symmetric(),
      margin: margin ?? const EdgeInsets.only(right: 8.0),
    );
  }
}
