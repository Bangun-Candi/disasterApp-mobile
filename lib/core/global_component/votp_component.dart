import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:flutter_package/source/otp_custom_component/otp_component.dart';
import 'package:merchant_app/core/global_component/vcustom_appbar.dart';
import 'package:merchant_app/core/utils/cconstant.dart';
import 'package:merchant_app/core/utils/vcolor_utils.dart';

class VOtpComponent extends StatefulWidget {
  const VOtpComponent(
      {super.key,
      this.customDescOtp,
      this.email = "xyz@gmail.com",
      required this.onResendCode,
      this.isLoadingProcess = false,
      required this.onSubmitCode});

  final String? customDescOtp;
  final String? email;
  final VoidCallback onResendCode;
  final bool isLoadingProcess;
  final Function(String) onSubmitCode;

  @override
  State<VOtpComponent> createState() => _VOtpComponentState();
}

class _VOtpComponentState extends State<VOtpComponent> {
  int _countDownTimer = 10;
  Timer? _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countDownTimer > 0) {
          _countDownTimer--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  void setTimer() {
    _countDownTimer = 11;
  }

  String getFormattedTime(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');
    return "$minutesStr:$secondsStr";
  }

  @override
  void initState() {
    // TODO: implement initState
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      body: Stack(
        children: [
          const VcustomAppbar(
            titleAppBar: "Verification",
          ),
          Container(
            margin: EdgeInsets.only(
              left: 27,
              right: 27,
              top: Cconstant.getFullHeight(context) * 0.19,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CText(
                    text: "OTP Verification",
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // RichText(
                  //   text: TextSpan(
                  //     children: [
                  //       TextSpan(
                  //         text:
                  //             "Masukan kode verifikasi yang dikirimkan melalui email",
                  //         style: TextStyle(
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.w400,
                  //           fontStyle: FontStyle.normal,
                  //           color: CColorUtils.titleTextColor,
                  //           // decoration: decoration,
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  CText(
                    text: widget.customDescOtp != null
                        ? widget.customDescOtp ?? ""
                        : "Enter the verification code sent via email ${widget.email}",
                    fontSize: 15,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  OtpComponent(
                    fieldNumber: 6,
                    fieldRadius: 10,
                    borderColors: VColorUtils.primaryColors,
                    enabledBorderColor: VColorUtils.primaryColors,
                    focusedBorderColor: VColorUtils.primaryColors,
                    cursorColors: VColorUtils.primaryColors,
                    fieldWidth: 35,
                    margin: const EdgeInsets.only(right: 15),
                    onSubmit: widget.onSubmitCode,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CText(
                        text: "Don't get a code? ",
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      _countDownTimer > 0
                          ? CText(
                              text: getFormattedTime(_countDownTimer),
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            )
                          : InkWell(
                              onTap: () {
                                setTimer();
                                startTimer();
                                widget.onResendCode();
                              },
                              child: const CText(
                                text: "Resend Code",
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                decoration: TextDecoration.underline,
                              ),
                            )
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  widget.isLoadingProcess
                      ? Container(
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(
                            color: VColorUtils.primaryColors,
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
