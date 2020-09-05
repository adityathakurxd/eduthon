import 'package:flutter/material.dart';
import 'package:are_you_good_bro/assessmentQnA.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:are_you_good_bro/result.dart';

void main() => runApp(Home());

AssessmentQnA assessmentQnA = AssessmentQnA();
ResultScore resultScore = ResultScore();

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mental Health Assessment'),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: MentalAssessment(),
          ),
        ),
      ),
    );
  }
}

//Mental Assessment test quiz
class MentalAssessment extends StatefulWidget {
  @override
  _MentalAssessmentState createState() => _MentalAssessmentState();
}


class _MentalAssessmentState extends State<MentalAssessment> {

  List<Icon> moodCheck = [];



  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = assessmentQnA.getCorrectAnswer();

    setState(() {
      if (assessmentQnA.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.info,
          title: "Thank You !",
          desc: "The Assessment is now over.",
          buttons: [
            DialogButton(
              child: Text(
                "View Results",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Result()),
                );
              },
              width: 120,
            )
          ],
        ).show();
        assessmentQnA.reset();
        moodCheck = [];

      } else {
        if (userPickedAnswer == correctAnswer) {
          moodCheck.add(Icon(
            Icons.mood,
            color: Colors.green,
          ));
          resultScore.addScore();
        } else {
          moodCheck.add(Icon(
            Icons.mood_bad,
            color: Colors.red,
          ));
        }
        assessmentQnA.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                assessmentQnA.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'Yes. I have.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'No. Not really.',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: moodCheck,
        )
      ],
    );
  }
}
