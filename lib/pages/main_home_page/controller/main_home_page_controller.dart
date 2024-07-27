import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant_app/pages/home_page/home_page.dart';

class MainHomePageController extends GetxController {
  RxInt selectedWidget = 0.obs;

  List<Widget> widgetOptions = <Widget>[
    const HomePage(),
  ];

  selectWidget(int index) {
    selectedWidget.value = index;
  }
}
