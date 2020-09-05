import 'package:are_you_good_bro/qna.dart';

class AssessmentQnA {
  int _questionNumber = 0;

  List<qna> _questionBank = [
    qna(
        'I like myself for who I am.',
        true),
    qna(
        'Has your appetite increased recently?',
        true),
    qna(
        'Have you been anxious, worried or scared lately about things in life?',
  false),
    qna(
        'Do feelings of anxiety or discomfort around others bother you?',
        false),
    qna(
        'Have you been feeling confident in your capabilities?',
        true),
    qna(
        'Are you socializing with your friends as much as you usually do?',
        true),
    qna(
        'Are you having any extreme emotions or mood swings?',
        false),
    qna(
        'Do you ever feel that you’ve been affected by feelings of edginess, anxiety, or nerves?',
        false),
    qna(
        'I have a positive outlook on my life.',
        true),
    qna(
        'Have you ever experienced a terrible occurrence that has impacted you significantly?',
        false),
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