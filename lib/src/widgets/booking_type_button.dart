import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menta/src/utils/colors.dart';
import 'package:menta/src/utils/size.dart';

class BookingTypeButton extends StatefulWidget {
  final VoidCallback changeState;
  final String btnText;
  final bool selected;

  BookingTypeButton({
    @required this.changeState,
    @required this.btnText,
    @required this.selected
  });

  @override
  State<StatefulWidget> createState() {
    return _BookingTypeButtonState();
  }
}

class _BookingTypeButtonState extends State<BookingTypeButton>{
//  double current_container_scale;
//
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        widget.changeState()
      },
      child: Container(
        padding: EdgeInsets.all(0.0),
        height: AppSize.width * 0.1,
        width: AppSize.width * 0.3,
        decoration: BoxDecoration(
          color: (widget.selected) ? AppColors.primary : AppColors.primary_reduced,
          borderRadius: BorderRadius.all(
              Radius.circular(5.0)
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(widget.btnText,
              style: TextStyle(fontWeight: FontWeight.bold, color: (widget.selected) ? Colors.white : Colors.black)),
          ],
        ),
      ),
    );
  }
}