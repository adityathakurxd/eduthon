import 'package:are_you_good_bro/main.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class Result extends StatelessWidget {
  double n = resultScore.getResultScore();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Assessment Result'),
          backgroundColor: Colors.black,
          shadowColor: Colors.grey.shade900,
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
                    width: 100.0,
                    height: 200.0,
                  ),
                ButtonTheme(
                  minWidth: 200.0,
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {
                      _launchForm();
                    },
                    color: Colors.black,
                    child: Text("Contact a Therapist", style: TextStyle(color: Colors.white, fontSize: 20),),
                  ),
                ),
                  SizedBox(
                    width: 10.0,
                    height: 20.0,
                  ),
                  RaisedButton(
                    child: Text('View tips to improve'),
                    onPressed: () {
                      _launchURL();
                    },
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

_launchForm() async {
  const url = 'https://docs.google.com/forms/d/e/1FAIpQLSfEMtz7PyDXXh84x4QtQ2OLhevYyrcOh2Bh7Ub3EPGQzJPzsg/viewform?usp=sf_link';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL() async {
  const url = 'https://www.peoplefirstinfo.org.uk/health-and-well-being/mental-health/10-top-tips-for-good-mental-health/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}