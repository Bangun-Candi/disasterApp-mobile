import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:merchant_app/repositories/home_page_repo/view_data_model/get_my_location_DM.dart';

class VMapComponent extends StatefulWidget {
  const VMapComponent({super.key, required this.getLatLongResult});

  final Function(double longitude, double latitude) getLatLongResult;

  @override
  State<VMapComponent> createState() => _VMapComponentState();
}

class _VMapComponentState extends State<VMapComponent> {
  late MapController? mapController;
  // GeoPoint? userLocation;
  bool _isMapControllerInitialized = false;

  @override
  void initState() {
    super.initState();
    initializeMapController();
  }

  Future<void> initializeMapController() async {
    mapController = MapController.withUserPosition(
      trackUserLocation: const UserTrackingOption(
        enableTracking: true,
        unFollowUser: false,
      ),
    );
    // mapController = MapController(
    //   initMapWithUserPosition: UserTrackingOption(
    //     enableTracking: true,
    //     unFollowUser: false,
    //   ),
    // );

    setState(() {
      _isMapControllerInitialized = true;
    });
    getUserLocation();
  }

  // initGeoPoint() async {
  //   await Future.delayed(const Duration(seconds: 5));
  //   userLocation = await mapController?.myLocation().whenComplete(
  //     () {
  //       getUserLocation();
  //     },
  //   );
  // }

  getUserLocation() async {
    await Future.delayed(const Duration(seconds: 5));
    if (mapController != null) {
      try {
        GeoPoint? userLocation = await mapController?.myLocation();

        if (userLocation != null) {
          LogUtility.writeLog(
              'User location: ${userLocation?.latitude}, ${userLocation?.longitude}');
          widget.getLatLongResult(
              userLocation!.longitude, userLocation!.latitude);
        } else {
          LogUtility.writeLog('Could not get user location');
        }
      } catch (e) {
        LogUtility.writeLog("error : $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isMapControllerInitialized) {
      return OSMFlutter(
        controller: mapController!,
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
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
