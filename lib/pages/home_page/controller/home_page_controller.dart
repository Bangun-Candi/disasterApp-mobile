import 'dart:convert';

import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:get/get.dart';
import 'package:merchant_app/core/services/model/base_response_model.dart';
import 'package:merchant_app/repositories/home_page_repo/home_page_repository.dart';
import 'package:merchant_app/repositories/home_page_repo/request/get_my_location_request.dart';
import 'package:merchant_app/repositories/home_page_repo/view_data_model/get_my_location_DM.dart';

class HomePageController extends GetxController {
  // late MapController mapController;

  RxBool isLoading = false.obs;
  Rx<GetMyLocationDM> myLocationData = GetMyLocationDM().obs;

  getMylocationData(double latitude, double longitude) async {
    isLoading.value = true;
    // GeoPoint? userLocation = await mapController.myLocation();

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
}
