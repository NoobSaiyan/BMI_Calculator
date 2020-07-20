import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'round_icon_button.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';
import 'gender_content.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 169;
  int weight = 69;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('BMI CALCULATOR'),
//      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20.0),
          Expanded(
            child: Row(children: [
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? activeCardBackground
                      : inactiveCardBackground,
                  cardChild: GenderContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? activeCardBackground
                      : inactiveCardBackground,
                  cardChild: GenderContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: labelStyle,
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: numberStyle,
                      ),
                      Text(
                        ' cm',
                        style: labelStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0)),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          activeColor: Color(0xFFEB1555),
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }))
                ],
              ),
              colour: activeCardBackground,
            ),
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: labelStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: numberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              }),
                          SizedBox(
                            width: 20.0,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              })
                        ],
                      )
                    ],
                  ),
                  colour: activeCardBackground,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: labelStyle,
                      ),
                      Text(
                        age.toString(),
                        style: numberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              }),
                          SizedBox(
                            width: 20.0,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              })
                        ],
                      )
                    ],
                  ),
                  colour: activeCardBackground,
                ),
              ),
            ]),
          ),
          BottomButton(
            label: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    information: calc.getInformation(),
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
