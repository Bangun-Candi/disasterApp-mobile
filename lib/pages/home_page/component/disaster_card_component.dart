import 'package:flutter/material.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:merchant_app/core/utils/cconstant.dart';
import 'package:merchant_app/core/utils/vcolor_utils.dart';
import 'package:merchant_app/core/utils/vimage_constant.dart';

class DisasterCardComponent extends StatelessWidget {
  const DisasterCardComponent(
      {super.key,
      required this.disasterCode,
      required this.disasterName,
      required this.statusDisasterName,
      required this.statusDisasterCode});
  final String disasterCode;
  final String disasterName;
  final String statusDisasterName;
  final String statusDisasterCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Cconstant.getFullHeight(context) * 0.17,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          border: Border.all(
            color: VColorUtils.secondaryColors, // Border color
            width: 3, // Border width
          ),
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          getDisasterStatus(context, statusDisasterCode),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: VColorUtils.secondaryColors,
          ),
          const SizedBox(
            height: 10,
          ),
          getNameDisaster(context, disasterCode, disasterName),
        ],
      ),
    );
  }

  Widget getDisasterStatus(context, code) {
    if (code == "01") {
      return Row(
        children: [
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
                color: VColorUtils.dangerColors,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: CText(
                text: 'Danger',
                textColor: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ],
      );
    } else if (code == "02") {
      return Row(
        children: [
          Image.asset(
            VImageConstant.warningIcon,
            width: 17,
            height: 17,
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: const BoxDecoration(
                color: VColorUtils.warningColors,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: CText(
                text: 'Warning',
                textColor: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Image.asset(
            VImageConstant.safeIcon,
            width: 17,
            height: 17,
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: const BoxDecoration(
                color: VColorUtils.safeColors,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: CText(
                text: 'Safe',
                textColor: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget getNameDisaster(context, code, disasterName) {
    if (code == "001") {
      return Row(
        children: [
          const Icon(Icons.message),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: const BoxDecoration(
                color: VColorUtils.dangerColors,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CText(
                text: '$disasterName',
                textColor: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          const Icon(Icons.message),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: const BoxDecoration(
                color: VColorUtils.safeColors,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: CText(
                text: 'there are no disasters around you',
                textColor: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ],
      );
    }
  }
}
