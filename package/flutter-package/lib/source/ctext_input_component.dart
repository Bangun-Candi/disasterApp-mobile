import 'package:flutter/material.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:flutter_package/utils/ccolor_utils.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class CTextInput extends StatelessWidget {
  const CTextInput({
    super.key,
    required this.textController,
    this.labelInput,
    this.suffixIcon,
    this.obscureText,
    this.isError,
    this.errorMsg = "Error",
    this.onTyping,
    this.borderRadius,
    this.borderWidth,
    this.hintText,
    this.width,
    this.height,
    this.filled = true,
    this.inputBackgroundColors,
    this.enableBorderColors,
    this.errorBorderColors,
    this.focusBorderColors,
    this.floatingLabelBehavior,
    this.enableInput = true,
    this.preffixIcon,
    this.cursorColors,
    this.keyboardType,
    this.prefixText,
    this.focusNode,
    this.focusNodeButtonColors,
  });

  final TextEditingController textController;
  final String? labelInput;
  final Widget? suffixIcon;
  final Widget? preffixIcon;
  final String? prefixText;
  final bool? obscureText;
  final bool? isError;
  final String? errorMsg;
  final Function(String)? onTyping;
  final double? borderRadius;
  final double? borderWidth;
  final String? hintText;
  final double? width;
  final double? height;
  final bool? filled;
  final bool? enableInput;
  final Color? enableBorderColors;
  final Color? errorBorderColors;
  final Color? focusBorderColors;
  final Color? inputBackgroundColors;
  final Color? cursorColors;
  final Color? focusNodeButtonColors;
  final TextInputType? keyboardType;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final FocusNode? focusNode;

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: false,
      actions: [
        KeyboardActionsItem(
          focusNode: focusNode ?? FocusNode(),
          toolbarButtons: [
            (node) {
              return InkWell(
                onTap: () {
                  node.unfocus();
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: CColorUtils.backgroundColors,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.only(
                      right: 14, left: 15, top: 8, bottom: 8),
                  child: CText(
                    text: "done".tr.toUpperCase(),
                    textColor: focusNodeButtonColors,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardActions(
      disableScroll: true,
      config: _buildConfig(context),
      child: TextField(
        focusNode: focusNode,
        cursorColor: cursorColors,
        controller: textController,
        obscureText: obscureText ?? false,
        onChanged: onTyping,
        enabled: enableInput,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          fillColor: inputBackgroundColors,
          filled: filled,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
            borderSide: BorderSide(
              color: enableBorderColors ?? CColorUtils.titleTextColor,
              width: borderWidth ?? 2.0,
            ),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
          errorText: isError ?? false ? errorMsg : null,
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
            borderSide: BorderSide(
              color: errorBorderColors ?? CColorUtils.errorColor,
              width: borderWidth ?? 2.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
            borderSide: BorderSide(
              color: errorBorderColors ?? CColorUtils.errorColor,
              width: borderWidth ?? 2.0,
            ),
          ),
          suffixIcon: suffixIcon,
          prefixIcon: preffixIcon,
          prefixText: prefixText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
            borderSide: BorderSide(
              color: focusBorderColors ?? CColorUtils.titleTextColor,
              width: borderWidth ?? 2.0,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
            borderSide: BorderSide(
              color: focusBorderColors ?? CColorUtils.titleTextColor,
              width: borderWidth ?? 2.0,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
              horizontal: width ?? 16.0, vertical: height ?? 8.0),
          labelStyle: TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            color: CColorUtils.titleTextColor.withOpacity(0.3),
          ),
          floatingLabelStyle: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              color: isError ?? false
                  ? CColorUtils.errorColor
                  : CColorUtils.titleTextColor),
          label: Text(
            labelInput ?? "",
          ),
          floatingLabelBehavior: floatingLabelBehavior,
        ),
      ),
    );
  }
}
