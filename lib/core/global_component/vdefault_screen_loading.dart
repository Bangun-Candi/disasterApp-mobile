import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:merchant_app/core/utils/vcolor_utils.dart';

class VdefaultScreenLoading extends StatelessWidget {
  const VdefaultScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultScreenLoading(
      indicatorColor: VColorUtils.secondaryColors,
    );
  }
}
