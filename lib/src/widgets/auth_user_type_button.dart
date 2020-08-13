import 'package:flutter/material.dart';
import 'package:menta/src/classes/user_type_data.dart';
import 'package:menta/src/utils/colors.dart';
import 'package:menta/src/utils/size.dart';
import 'package:menta/src/utils/user_type.dart';

class AuthUserTypeButton extends StatefulWidget {
  AuthUserTypeButton(
      this.current_user_type, this.user_type_data, this.changeState);

  final UserTypeData user_type_data;
  final UserType current_user_type;
  final VoidCallback changeState;

  @override
  _AuthUserTypeButtonState createState() => _AuthUserTypeButtonState();
}

class _AuthUserTypeButtonState extends State<AuthUserTypeButton> {
  double current_container_scale;

  @override
  void initState() {
    super.initState();
    current_container_scale = 0.4;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.changeState(),
      child: Container(
        padding: EdgeInsets.all(0.0),
        height: AppSize.width * current_container_scale,
        width: AppSize.width * current_container_scale,
        decoration: BoxDecoration(
          border: buttonBorder(),
          borderRadius: BorderRadius.all(
            Radius.circular(5.0)
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.user_type_data.image,
          ],
        ),
      ),
    );
  }

  Border buttonBorder() {
    return Border.all(
      color: widget.current_user_type == widget.user_type_data.user_type
          ? AppColors.primary
          : AppColors.grey_font,
      width: 3.0,
    );
  }
}
