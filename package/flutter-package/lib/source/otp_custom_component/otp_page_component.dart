import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:flutter_package/source/otp_custom_component/otp_component.dart';

class OtpPageComponent extends StatelessWidget {
  const OtpPageComponent(
      {super.key,
      this.isLoading,
      required this.enableConfirmButton,
      required this.onConfirmPressed,
      this.confirmButtonLabel,
      required this.onResendCodePressed,
      this.onCodeTyping,
      this.onGetCode,
      this.titleMessage,
      this.resendCodeMessage,
      this.resendCodeButtonMessage});

  final bool? isLoading;
  final bool enableConfirmButton;
  final VoidCallback onConfirmPressed;
  final VoidCallback onResendCodePressed;
  final String? confirmButtonLabel;
  final Function(String)? onCodeTyping;
  final Function(String)? onGetCode;

  final String? titleMessage;
  final String? resendCodeMessage;
  final String? resendCodeButtonMessage;

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: ConstantUtils.getFullHeight(context) * 0.14,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 16,
                ),
                CText(
                  text: titleMessage ?? 'Masukkan kode verifikasi',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 16,
                ),
                OtpComponent(
                  onCodeChanged: onCodeTyping,
                  onSubmit: onGetCode,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CText(
                      text: resendCodeMessage ?? "Tidak dapat kode? ",
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    InkWell(
                      onTap: onResendCodePressed,
                      child: CText(
                        text: resendCodeButtonMessage ?? "Kirim Ulang",
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, bottom: 51),
              child: CustomButton(
                enableButton: enableConfirmButton,
                onPressed: onConfirmPressed,
                titleButton: confirmButtonLabel ?? 'Verification',
              ),
            ),
          ),
          isLoading ?? false ? const DefaultScreenLoading() : const SizedBox(),
        ],
      ),
    );
  }
}
