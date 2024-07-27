import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merchant_app/core/utils/vcolor_utils.dart';
import 'package:merchant_app/pages/splashscreen/splashscreen.dart';

// late List<CameraDescription> camerasPort;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
