import 'package:flutter/material.dart';
import 'package:menta/src/utils/colors.dart';
import 'package:menta/src/utils/size.dart';

Padding buildTextField(
    {bool isObscure,
    TextEditingController textEditingController,
    String hintText,
    int focus_num,
    List<FocusNode> focus_nodes,
    Icon prefix_icon}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20.0),
    child: Container(
      width: AppSize.width * 0.8,
      child: TextFormField(
        focusNode: focus_nodes[focus_num],
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: focus_nodes[focus_num].hasFocus ? "" : hintText,
          hintStyle: TextStyle(
            color: Colors.grey[350],
            fontWeight: FontWeight.w600,
          ),
          prefixIcon: prefix_icon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200], width: 2.0)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 2.0)
          ),
        ),
        style: TextStyle(
          color: AppColors.grey_font,
          fontWeight: FontWeight.w600,
          fontSize: 20.0
        ),
        obscureText: isObscure,
        controller: textEditingController,
      ),
    ),
  );
}
