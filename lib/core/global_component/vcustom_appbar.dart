import 'package:flutter/material.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:get/get.dart';
import 'package:merchant_app/core/utils/cconstant.dart';
import 'package:merchant_app/core/utils/vcolor_utils.dart';

class VcustomAppbar extends StatelessWidget {
  const VcustomAppbar({super.key, this.titleAppBar});

  final String? titleAppBar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 27,
        right: 27,
        top: Cconstant.getFullHeight(context) * 0.07,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
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
          ),
          titleAppBar != null
              ? Expanded(
                  child: CText(
                    text: titleAppBar ?? "",
                    fontSize: 18,
                    textAlign: TextAlign.center,
                  ),
                )
              : const SizedBox(),
          SizedBox(
            width: Cconstant.getFullHeight(context) * 0.04,
          )
        ],
      ),
    );
  }
}
