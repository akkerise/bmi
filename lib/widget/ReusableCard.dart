import 'package:flutter/cupertino.dart';

const INACTIVE_REUSABLE_CARD_COLOR = Color(0xFF111328);

typedef VoidTouch = void Function();

class ReusableCard extends StatelessWidget {
  var color;
  var cardChild;
  VoidTouch onTouch;

  ReusableCard(
      {Key? key,
      this.color = INACTIVE_REUSABLE_CARD_COLOR,
      this.cardChild,
      required this.onTouch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onTouch();
      },
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
