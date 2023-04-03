import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Color InactiveColor = Color(0xFF111328);
const Color ActiveCardColor = Color(0xFF1D1E33);

// user-defined data type
enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  child: ReusableCard(
                    cardChild: Column(
                      children: [
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 80.0,
                        ),
                        Text('MALE'),
                      ],
                    ),
                    cardColor: selectedGender == Gender.male ? ActiveCardColor : InactiveColor,
                  ),
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                    print('Male was pressed');
                  },
                ),
              ),
              Expanded(
                child: GestureDetector(
                  child: ReusableCard(
                    cardChild: Column(
                      children: [
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 80.0,
                        ),
                        Text('FEMALE'),
                      ],
                    ),
                    cardColor: selectedGender == Gender.female ? ActiveCardColor : InactiveColor,
                  ),
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                    print('Female was pressed');
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: ReusableCard(
              cardChild: const Text(''),
              cardColor: ActiveCardColor,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  cardChild: const Text(''),
                  cardColor: ActiveCardColor,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: const Text(''),
                  cardColor: ActiveCardColor,
                ),
              ),
            ],
          ),
          Container(
            height: 80.0,
            color: const Color(0xFFEB1555),
            child: const Center(
              child: Text(
                'CALCULATE',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}