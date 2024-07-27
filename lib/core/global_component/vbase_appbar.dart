import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:get/get.dart';
import 'package:merchant_app/core/utils/vcolor_utils.dart';

/// ITS ON RESEARCH PROGRESS
class VbaseAppbar {
  static appBar(context, String? title, {bool? showBackButton = true}) {
    return BaseAppBar.baseAppBar(context,
        centerTitle: true,
        title: CText(
          text: title ?? "",
          fontSize: 18,
        ),
        elevation: 0.0,
        backgroundColor: VColorUtils.backgroundColors,
        leadingWidth: 15,
        leading: showBackButton ?? false
            ? InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: VColorUtils.backgroundColors,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: VColorUtils.textGreyColors,
                        blurRadius: 45,
                        // offset: const Offset(15, 10),
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 15,
                    ),
                  ),
                ),
              )
            : null);
  }
}
