import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_package/source/log_utility.dart';
import 'package:merchant_app/pages/home_page/home_page.dart';
import 'package:merchant_app/repositories/home_page_repo/view_data_model/get_my_location_DM.dart';
import 'package:rxdart/rxdart.dart';

final selectNotificationSubject = BehaviorSubject<String>();

class NotificationHelpers {
  static NotificationHelpers? _instance;

  NotificationHelpers._internal() {
    _instance = this;
  }

  factory NotificationHelpers() => _instance ?? NotificationHelpers._internal();

  Future<void> initNotifications(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('splash_screen_icon');

    var initializationSettingsIOS = const DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse details) async {
      final payload = details.payload;
      if (payload != null) {
        LogUtility.writeLog('notification payload: $payload');
      }
      selectNotificationSubject.add(payload ?? 'empty payload');
    });
  }

  void requestAndroidPermissions(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestExactAlarmsPermission();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  Future<void> showNotification(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
    String titleNotif,
    String bodyNotification,
  ) async {
    try {
      var channelId = "1";
      var channelName = "channel_01";
      var channelDescription = "app channel";

      var androidPlatformChannelSpecifics = AndroidNotificationDetails(
          channelId, channelName,
          channelDescription: channelDescription,
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
          styleInformation: const DefaultStyleInformation(true, true));

      var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
      var platformChannelSpecifics = NotificationDetails(
          android: androidPlatformChannelSpecifics,
          iOS: iOSPlatformChannelSpecifics);

      var titleNotification = "<b>$titleNotif</b>";
      var titleBody = bodyNotification;
      // int randomIndex =
      //     Random().nextInt((restaurantList.restaurants ?? []).length);

      // var titleRestaurant = restaurantList.restaurants?[randomIndex].name;

      await flutterLocalNotificationsPlugin.show(
        0,
        titleNotification,
        titleBody,
        platformChannelSpecifics,
      );
    } catch (e) {
      LogUtility.writeLog("notif error : $e");
    }
  }

  void configureSelectNotificationSubject(
      String route, int index, context) async {
    selectNotificationSubject.stream.listen(
      (String payload) async {
        var data = GetMyLocationDM.fromJson(json.decode(payload));
        var notifData = data;

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      },
    );
  }
}
