// Not Ready, don't use it
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_package/source/log_utility.dart';

class SessionUtilities {
  VoidCallback? endSessionCallback;
  bool showPopup;
  int timeout;
  String title;
  String message;
  SessionUtilities({
    this.endSessionCallback,
    this.showPopup = true,
    this.timeout = 300000,
    this.title = "Session Timeout",
    this.message = "Please login again",
  });

  static SessionUtilities sessionUtil = SessionUtilities();
  static Timer? _timer;
  static DateTime? timerStart;
  _executeCallback() {
    if (endSessionCallback != null) {
      LogUtility.writeLog("not null callback");
      endSessionCallback!();
    } else {
      LogUtility.writeLog("null callback");
    }
  }

  startSession({int? setTimeoutSeconds}) {
    LogUtility.writeLog("Start Session: $timeout");
    try {
      _timer?.cancel();
      _timer = Timer(
        Duration(seconds: setTimeoutSeconds ?? timeout),
        () {
          executePopup();
        },
      );
      timerStart = DateTime.now();
    } catch (e) {
      LogUtility.writeLog(e.toString());
      _timer?.cancel();
    }
  }

  executePopup() {
    if (showPopup) {
      // CustomPopupDialog().openDialog(
      //   title,
      //   message,
      //   "Ok",
      //   barrierDismissible: false,
      //   canPop: false,
      //   () {
      //     _executeCallback();
      //   },
      // );
    } else {
      _executeCallback();
    }
  }

  terminateSessionCounter() {
    _timer?.cancel();
    timerStart = null;
    LogUtility.writeLog("terminate session");
  }
}
