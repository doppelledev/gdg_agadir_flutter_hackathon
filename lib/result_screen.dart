import 'package:flutter/material.dart';

import 'constants.dart';

class ResultScreen extends StatelessWidget {
  final String bmi;
  final String status;
  final String tip;
  final Color color;

  const ResultScreen({
    @required this.bmi,
    @required this.status,
    @required this.tip,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SafeArea(
            child: Container(
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
          ),
          Text(
            'YOUR RESULT',
            textAlign: TextAlign.center,
            style: kTitleStyle,
          ),
          Container(
            height: 1.0,
            margin: EdgeInsets.symmetric(horizontal: 70.0, vertical: 20.0),
            color: kPrimaryColorFaded,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$bmi',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 80.0,
                    color: kPrimaryColor,
                  ),
                ),
                Text(
                  '$status',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35.0,
                    color: color,
                  ),
                ),
                Text(
                  '$tip',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            padding: EdgeInsets.symmetric(vertical: 20.0),
            color: kPrimaryColor,
            child: Text(
              'CALCULATE AGAIN',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
