import 'package:are_you_good_bro/qna.dart';

class AssessmentQnA {
  int _questionNumber = 0;

  List<qna> _questionBank = [
    qna(
        'Have you been anxious, worried or scared lately about things in life?',
        true),
    //TODO: Create a Question Bank for Mental Assesment
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  int getQuestionLen() {
    return _questionBank.length;
  }


  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber == _questionBank.length - 1) {
      return true;
    }
    else {
      return false;
    }
  }
  void reset() {
    _questionNumber = 0;
  }
}