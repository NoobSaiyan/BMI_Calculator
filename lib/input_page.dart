import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'gender_content.dart';

const activeCardBackground = Color(0xFF1D1E33);
const inactiveCardBackground = Color(0xFF111328);
const accentColor = Color(0xFFEB1555);
enum Gender {
  male,
  female
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(children: [
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male ? activeCardBackground : inactiveCardBackground,
                  cardChild: GenderContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                ),
              ),
              Expanded(

                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female ? activeCardBackground : inactiveCardBackground,
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
              colour: activeCardBackground,
            ),
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                child: ReusableCard(
                  colour: activeCardBackground,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: activeCardBackground,
                ),
              ),
            ]),
          ),
          Container(
            color: accentColor,
            height: 70.0,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
