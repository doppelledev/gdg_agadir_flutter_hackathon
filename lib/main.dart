import 'package:flutter/material.dart';
import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:study_jam/result_screen.dart';

import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

double height = 120.0;
double weight = 20.0;

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  String bmi = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              margin: EdgeInsets.only(bottom: 30.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    kPrimaryColor,
                    kPrimaryColorGraded,
                  ],
                ),
              ),
              child: Image.asset(
                'assets/logo.png',
                height: 70.0,
                width: 70.0,
              ),
            ),
            Text(
              'WEIGHT',
              textAlign: TextAlign.center,
              style: kTitleStyle,
            ),
            Text(
              'TRACKER',
              textAlign: TextAlign.center,
              style: kTitleStyle,
            ),

            Container(
              height: 1.0,
              margin: EdgeInsets.symmetric(horizontal: 70.0, vertical: 20.0),
              color: kPrimaryColorFaded,
            ),
            // Height
            MySlider(
              label: 'Height',
              unit: 'cm',
              min: 120.0,
              max: 200.0,
              start: 160.0,
              icon: FontAwesomeIcons.arrowsAltV,
            ),
            // Weight
            MySlider(
              label: 'Weight',
              unit: 'kg',
              min: 20.0,
              max: 150.0,
              start: 60,
              icon: FontAwesomeIcons.weight,
            ),
            Text('$bmi'),
            SizedBox(
              height: 100.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.0),
              child: RaisedButton(
                color: kPrimaryColor,
                child: Text(
                  'Calculate',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _calculate();
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //m /  (h / 100)²
  void _calculate() {
    double bmi = weight / (pow(height / 100, 2));

    String bmiStr = bmi.toStringAsFixed(2);
    String status = '';
    String tip = '';
    Color color;

    if (bmi < 18.5) {
      status = 'Underweight';
      tip = 'You can eat more';
      color = Colors.red;
    } else if (bmi < 25) {
      status = 'Normal';
      tip = 'Congratulatios! Your BMI is normal';
      color = Colors.green;
    } else {
      status = 'Overweight';
      tip = 'Try to exercise more';
      color = Colors.red;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
              bmi: bmiStr,
              status: status,
              tip: tip,
              color: color,
            ),
      ),
    );
  }
}

class MySlider extends StatefulWidget {
  final double max;
  final double min;
  final String label;
  final String unit;
  final double start;
  final IconData icon;

  MySlider({
    @required this.max,
    @required this.min,
    @required this.label,
    @required this.start,
    @required this.icon,
    @required this.unit,
  });

  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double value;

  @override
  void initState() {
    super.initState();
    value = widget.start;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '${value.toStringAsFixed(0)}',
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 30.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: <Widget>[
                  Icon(
                    widget.icon,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    '${widget.label}',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              Expanded(
                child: Slider(
                  onChanged: (newValue) {
                    setState(() {
                      value = newValue;
                      if (widget.label == 'Weight') {
                        weight = newValue;
                      } else if (widget.label == 'Height') {
                        height = newValue;
                      }
                    });
                  },
                  activeColor: kPrimaryColor,
                  inactiveColor: Color(0x556F8AC6),
                  value: value,
                  min: widget.min,
                  max: widget.max,
                ),
              ),
              Text(
                widget.unit,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
