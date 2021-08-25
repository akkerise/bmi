import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const TEXT_STYLE = TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98));

class IconElement extends StatelessWidget {
  final IconData icon;
  String label;

  IconElement({
    this.icon = FontAwesomeIcons.keybase,
    this.label = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(height: 15.0),
        Text(
          label,
          style: TEXT_STYLE,
        )
      ],
    );
  }
}
