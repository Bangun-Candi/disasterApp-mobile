import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:get/get.dart';
import 'package:merchant_app/core/helpers/notification_helpers.dart';
import 'package:merchant_app/main.dart';
import 'package:merchant_app/pages/home_page/home_page.dart';

class MainHomePageController extends GetxController {
  RxInt selectedWidget = 0.obs;

  BuildContext context;

  MainHomePageController({required this.context});

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void onInit() async {
    // Request permissions for iOS
    _firebaseMessaging.requestPermission();

    // Get the token for the device
    _firebaseMessaging.getToken().then((String? token) {
      assert(token != null);
      print("FCM Token: $token");
      // Save the token to your database for future use
    });

    // Handle incoming messages when the app is in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        // _showNotification(message.notification!, context);
        NotificationHelpers().showNotification(
            flutterLocalNotificationsPlugin,
            message.notification?.title ?? "",
            message.notification?.body ?? "");
      }
    });

    // Handle background and terminated state messages
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    super.onInit();
  }

  void _showNotification(RemoteNotification notification, context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(notification.title ?? ''),
          content: Text(notification.body ?? ''),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  List<Widget> widgetOptions = <Widget>[
    const HomePage(),
  ];

  selectWidget(int index) {
    selectedWidget.value = index;
  }
}
