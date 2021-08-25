import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:bmi/widget/ReusableCard.dart';
import 'package:bmi/widget/IconElement.dart';
import 'package:bmi/widget/RoundIconButton.dart';
import 'package:bmi/widget/CalculateButton.dart';
import 'package:bmi/enum/global.dart' as GLOBAL;
import 'package:bmi/page/result.dart';
import 'package:bmi/service/ai.dart';

enum BlockType { TOP_LEFT, TOP_RIGHT, MIDDLE, BOTTOM_LEFT, BOTTOM_RIGHT }

class BmiPage extends StatefulWidget {
  @override
  _BmiPageState createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  BlockType block = BlockType.TOP_LEFT;
  int height = 180;
  int weight = 0;
  int age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onTouch: () {
                      setState(() {
                        block = BlockType.TOP_LEFT;
                      });
                    },
                    color: block == BlockType.TOP_LEFT
                        ? GLOBAL.ACTIVE_REUSABLE_CARD_COLOR
                        : GLOBAL.INACTIVE_REUSABLE_CARD_COLOR,
                    cardChild: IconElement(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTouch: () {
                      setState(() {
                        block = BlockType.TOP_RIGHT;
                      });
                    },
                    color: block == BlockType.TOP_RIGHT
                        ? GLOBAL.ACTIVE_REUSABLE_CARD_COLOR
                        : GLOBAL.INACTIVE_REUSABLE_CARD_COLOR,
                    cardChild: IconElement(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              onTouch: () {
                setState(() {
                  block = BlockType.MIDDLE;
                });
              },
              color: block == BlockType.MIDDLE
                  ? GLOBAL.ACTIVE_REUSABLE_CARD_COLOR
                  : GLOBAL.INACTIVE_REUSABLE_CARD_COLOR,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: GLOBAL.LABEL_STYLE,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'cm',
                        style: GLOBAL.LABEL_STYLE,
                      )
                    ],
                  ),
                  SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: GLOBAL.BOTTOM_CONTAINER_COLOR,
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double current) {
                          setState(() {
                            height = current.round();
                          });
                        },
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onTouch: () {
                      setState(() {
                        block = BlockType.BOTTOM_LEFT;
                      });
                    },
                    color: block == BlockType.BOTTOM_LEFT
                        ? GLOBAL.ACTIVE_REUSABLE_CARD_COLOR
                        : GLOBAL.INACTIVE_REUSABLE_CARD_COLOR,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: GLOBAL.LABEL_STYLE,
                        ),
                        Text(
                          weight.toString(),
                          style: GLOBAL.LABEL_STYLE,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // FloatingActionButton(
                            //   backgroundColor: Color(0xFF4C4F5),
                            //   child: Icon(Icons.add, color: Colors.white),
                            //   onPressed: () {},
                            // ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTouch: () {
                      setState(() {
                        block = BlockType.BOTTOM_RIGHT;
                      });
                    },
                    color: block == BlockType.BOTTOM_RIGHT
                        ? GLOBAL.ACTIVE_REUSABLE_CARD_COLOR
                        : GLOBAL.INACTIVE_REUSABLE_CARD_COLOR,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: GLOBAL.LABEL_STYLE),
                        Text(age.toString(), style: GLOBAL.LABEL_STYLE),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CalculateButton(
            title: "CALCULATOR",
            onTap: () {
              AI ai = AI(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Result(
                    bmi: ai.result(),
                    result: ai.predict(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
