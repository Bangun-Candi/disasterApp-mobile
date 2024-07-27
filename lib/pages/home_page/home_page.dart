import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:get/get.dart';
import 'package:merchant_app/core/global_component/default_widget_container.dart';
import 'package:merchant_app/core/global_component/vcustom_button.dart';
import 'package:merchant_app/core/utils/cconstant.dart';
import 'package:merchant_app/core/utils/vcolor_utils.dart';
import 'package:merchant_app/core/utils/vimage_constant.dart';
import 'package:merchant_app/pages/home_page/controller/home_page_controller.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(HomePageController());
    return DefaultWidgetContainer(
      createCustomBody: true,
      body: Stack(
        children: [
          OSMFlutter(
            controller: _controller.mapController,
            osmOption: const OSMOption(
              userTrackingOption: UserTrackingOption(
                enableTracking: true,
                unFollowUser: false,
              ),
              zoomOption: ZoomOption(
                initZoom: 15,
                minZoomLevel: 3,
                maxZoomLevel: 19,
                stepZoom: 1.0,
              ),
            ),
          ),
          SlidingUpPanel(
            minHeight: Cconstant.getFullHeight(context) * 0.47,
            maxHeight: Cconstant.getFullHeight(context) * 0.47,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            panelBuilder: () {
              return SizedBox();
            },
            color: VColorUtils.secondaryColors,
            header: Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: Cconstant.getFullHeight(context) * 0.03,
              ),
              child: Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: const Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Icon(
                        Icons.location_pin,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const CText(
                    text: "Location Name",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          SlidingUpPanel(
            minHeight: Cconstant.getFullHeight(context) * 0.39,
            maxHeight: Cconstant.getFullHeight(context) * 0.39,
            panelBuilder: () {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  children: [
                    Container(
                      height: Cconstant.getFullHeight(context) * 0.20,
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: VColorUtils.secondaryColors, // Border color
                            width: 3, // Border width
                          ),
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              // const Icon(Icons.circle_notifications_sharp),
                              Image.asset(
                                VImageConstant.dangerIcon,
                                width: 17,
                                height: 17,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: CText(
                                    text: 'Danger',
                                    textColor: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: VColorUtils.secondaryColors,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.message),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: CText(
                                    text: 'Earthquake',
                                    textColor: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      right: 0,
                      child: VcustomButton(
                        onPressed: () {},
                        titleButton: "Send Rescue",
                      ),
                    )
                  ],
                ),
              );
            },
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          ),
        ],
      ),
    );
  }
}
