import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merchant_app/core/helpers/notification_helpers.dart';
import 'package:merchant_app/core/utils/vcolor_utils.dart';
import 'package:merchant_app/firebase_options.dart';
import 'package:merchant_app/pages/splashscreen/splashscreen.dart';

// late List<CameraDescription> camerasPort;

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  NotificationHelpers().showNotification(flutterLocalNotificationsPlugin,
      message.notification?.title ?? "", message.notification?.body ?? "");

  // LogUtility.writeLog("Handling a background message: ${message.messageId}");
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await NotificationHelpers()
      .initNotifications(flutterLocalNotificationsPlugin);
  NotificationHelpers()
      .requestAndroidPermissions(flutterLocalNotificationsPlugin);

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // camerasPort = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: VColorUtils.backgroundColors,
        textTheme: GoogleFonts.poppinsTextTheme(),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
              VColorUtils.primaryColors,
            ),
          ),
        ),
        useMaterial3: true,
      ),
      home: const Splashscreen(),
    );
  }
}
