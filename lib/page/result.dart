import 'package:flutter/material.dart';
import 'package:bmi/enum/global.dart' as GLOBAL;
import 'package:bmi/widget/ReusableCard.dart';
import 'package:bmi/widget/CalculateButton.dart';

class Result extends StatelessWidget {
  Result({required this.bmi, required this.result});

  final String bmi;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI RESULT'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result', style: GLOBAL.LABEL_STYLE),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: GLOBAL.INACTIVE_REUSABLE_CARD_COLOR,
              onTouch: () {},
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    result,
                    style: GLOBAL.RESULT_STYLE,
                  ),
                  Text(
                    bmi,
                    style: GLOBAL.BMI_RESULT_STYLE,
                  ),
                  Text(
                    'Your BMI',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 55.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          CalculateButton(
            title: "RE-CALCULATOR",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
