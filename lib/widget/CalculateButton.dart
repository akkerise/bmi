import 'package:flutter/material.dart';
import 'package:bmi/enum/global.dart' as GLOBAL;

class CalculateButton extends StatelessWidget {
  final onTap;
  final title;

  const CalculateButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: GLOBAL.LABEL_STYLE,
          ),
        ),
        color: GLOBAL.BOTTOM_CONTAINER_COLOR,
        margin: EdgeInsets.only(top: GLOBAL.BOTTOM_CONTAINER_HEIGHT),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}
