import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant_app/core/global_component/default_widget_container.dart';
import 'package:merchant_app/core/utils/vcolor_utils.dart';
import 'package:merchant_app/pages/main_home_page/controller/main_home_page_controller.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(MainHomePageController());
    return DefaultWidgetContainer(
      createCustomBody: true,
      resizeToAvoidBottomInset: false,
      body: Obx(() => _controller.widgetOptions
          .elementAt(_controller.selectedWidget.value)),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: VColorUtils.backgroundColors,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "Report History",
          ),
        ],
      ),
    );
  }
}
