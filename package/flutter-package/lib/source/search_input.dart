import 'package:flutter/material.dart';
import 'package:flutter_package/source/ctext_input_component.dart';
import 'package:flutter_package/utils/ccolor_utils.dart';
import 'package:flutter_package/utils/images_utils.dart';

class SearchInputComponent extends StatelessWidget {
  const SearchInputComponent({super.key, required this.searchController});

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return CTextInput(
      textController: searchController,
      borderRadius: 40,
      borderWidth: 0.5,
      width: 14,
      enableInput: false,
      height: 10,
      inputBackgroundColors: CColorUtils.backgroundColors,
      filled: true,
      focusBorderColors: CColorUtils.borderSearchColors.withOpacity(0.17),
      enableBorderColors: CColorUtils.borderSearchColors.withOpacity(0.17),
      labelInput: "label",
      hintText: "label",
      floatingLabelBehavior: FloatingLabelBehavior.never,
      suffixIcon: Image.asset(
        ImageUtils.searchIcons,
        scale: 3.5,
      ),
    );
  }
}
