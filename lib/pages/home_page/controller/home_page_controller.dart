import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:get/get.dart';
import 'package:merchant_app/core/helpers/ble_helpers.dart';
import 'package:merchant_app/core/services/model/base_response_model.dart';
import 'package:merchant_app/core/utils/vimage_constant.dart';
import 'package:merchant_app/repositories/home_page_repo/home_page_repository.dart';
import 'package:merchant_app/repositories/home_page_repo/request/get_my_location_request.dart';
import 'package:merchant_app/repositories/home_page_repo/request/send_rescue_request.dart';
import 'package:merchant_app/repositories/home_page_repo/view_data_model/get_my_location_DM.dart';

class HomePageController extends GetxController {
  // late MapController mapController;

  RxBool isLoading = false.obs;
  RxBool hasbeenSend = false.obs;
  RxBool enableButton = true.obs;
  Rx<GetMyLocationDM> myLocationData = GetMyLocationDM().obs;

  double longitude = 0;
  double latitude = 0;

  final BLEHelpers _bleService = BLEHelpers();

  BuildContext context;

  HomePageController({required this.context});

  getMylocationData(double latitudeData, double longitudeData) async {
    isLoading.value = true;
    // GeoPoint? userLocation = await mapController.myLocation();

    latitude = latitudeData;
    longitude = longitudeData;

    GetMyLocationRequest param = GetMyLocationRequest();
    param.userName = "user123@gmail.com";
    param.userEmail = "User";
    param.latitudeLocation = latitude.toString();
    param.longitudeLocation = longitude.toString();

    LogUtility.writeLog("param : ${jsonEncode(param)}");

    await Future.delayed(const Duration(milliseconds: 600));

    BaseResponseModel data = await HomePageRepository().getMyLocation(param);

    myLocationData.value = data.data;

    isLoading.value = false;
  }

  sendRescueRequest() async {
    isLoading.value = true;

    SendRescueRequest param = SendRescueRequest();
    param.disasterTypeCode = myLocationData.value.disasterNameCode;
    param.latitudeLocation = latitude.toString();
    param.longitudeLocation = longitude.toString();
    param.rescuersCode = "001";
    param.statusDisaster = myLocationData.value.statusLocation;
    param.statusDisasterCode = myLocationData.value.statusDisasterCode;

    LogUtility.writeLog("param : ${jsonEncode(param)}");

    await Future.delayed(const Duration(milliseconds: 600));

    try {
      BaseResponseModel data = await HomePageRepository().sendRescue(param);
    } catch (e) {
      LogUtility.writeLog("api request failed : $e");
      _searchForBleDevice();
    }

    isLoading.value = false;

    if (!hasbeenSend.value) {
      hasbeenSend.value = true;
      enableButton.value = false;
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialogComponent(
            imageAssets: VImageConstant.checkIcon,
            description: "",
            message: "Your Rescue has been sended",
          );
        },
      );
    }

    calRescueAgain();
  }

  calRescueAgain() {
    Timer timer = Timer.periodic(
      const Duration(seconds: 10),
      (timer) {
        sendRescueRequest();
      },
    );
  }

  /// BLE HANDLE =============================================

  Future<void> _searchForBleDevice() async {
    _bleService.scanForDevices().listen((device) async {
      LogUtility.writeLog("Found device: ${device.name}");
      await _bleService.connectToDevice(device);
      await _sendRequestUsingBle();
    });
  }

  Future<void> _sendRequestUsingBle() async {
    final dataToSend = [1, 2, 3]; // Example data
    await _bleService.writeCharacteristic(dataToSend);
    _bleService.listenToCharacteristic().listen((data) {
      LogUtility.writeLog("Received data: $data");

      sendRescueRequest();
    });
  }

  /// UNTIL HERE HANDLE BLE =============================================
}
