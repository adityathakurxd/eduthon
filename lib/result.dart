import 'package:are_you_good_bro/main.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Result extends StatelessWidget {
  double n = resultScore.getResultScore();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Assessment Result'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                resultScore.resetScore();
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularPercentIndicator(
                    radius: 150.0,
                    lineWidth: 10.0,
                    percent: n * 0.1,
                    header: Text(
                      "",
                      style: TextStyle(fontSize: 32.0),
                    ),
                    center: Icon(
                      Icons.mood,
                      size: 100.0,
                      color: Colors.blue,
                    ),
                    backgroundColor: Colors.grey,
                    progressColor: Colors.blue,
                  ),
                  SizedBox(
                    width: 200.0,
                    height: 300.0,
                  ),
                  RaisedButton(
                    child: Text('View tips to imporve'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ResultScore {
  //Class manages the score of Result
  double _resultScore = 0;
  void addScore() {
    _resultScore++;
  }

  void resetScore() {
    _resultScore = 0;
  }

  double getResultScore() {
    return _resultScore;
  }
}
