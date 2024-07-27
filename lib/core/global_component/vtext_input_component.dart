import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:merchant_app/core/utils/vcolor_utils.dart';

class VtextInputComponent extends StatelessWidget {
  const VtextInputComponent({
    super.key,
    required this.textController,
    this.preffixIcon,
    this.labelInput,
    this.isError,
    this.errorMsg,
    this.onTyping,
    this.keyboardType = TextInputType.text,
    this.prefixText,
    this.suffixIcon,
    this.focusNode,
    this.obsecureText,
  });

  final TextEditingController textController;
  final Widget? preffixIcon;
  final Widget? suffixIcon;
  final String? prefixText;
  final String? labelInput;
  final String? errorMsg;
  final bool? isError;
  final bool? obsecureText;
  final Function(String)? onTyping;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: VColorUtils.textGreyColors.withOpacity(0.5),
            blurRadius: 45,
            // offset: const Offset(15, 10),
          ),
        ],
      ),
      child: CTextInput(
        focusNode: focusNode,
        isError: isError,
        errorMsg: errorMsg,
        cursorColors: VColorUtils.primaryColors,
        preffixIcon: preffixIcon,
        prefixText: prefixText,
        textController: textController,
        borderRadius: 10,
        borderWidth: 0.5,
        height: 17,
        enableBorderColors: VColorUtils.borderColors.withOpacity(0.25),
        focusBorderColors: VColorUtils.borderColors.withOpacity(0.25),
        inputBackgroundColors: Colors.white,
        labelInput: labelInput ?? "label",
        floatingLabelBehavior: FloatingLabelBehavior.never,
        onTyping: onTyping,
        keyboardType: keyboardType,
        suffixIcon: suffixIcon,
        obscureText: obsecureText,
      ),
    );
  }
}
