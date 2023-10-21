import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tims/webservices/api_request.dart';

class WrongAnswerController extends GetxController {
  List<WrongAnswer> waList = [
    WrongAnswer(
        question: '''<html lang="en">
            <body>Question 1</body>
           </html>''',
        options: ['option 1', 'option 2', 'option 3'],
        correct: 1,
        wrong: 3),
    WrongAnswer(
        question: '''<html lang="en">
            <body>Question 2</body>
           </html>''',
        options: ['option 1', 'option 2', 'option 3'],
        correct: 2,
        wrong: 1),
    // WrongAnswer(question: '''<html lang="en">
    //         <body>Question 1</body>
    //        </html>''', wrongOption: 'option 2', correctOption: 'option 4'),
    // WrongAnswer(question: '''<html lang="en">
    //         <body>Question 2</body>
    //        </html>''', wrongOption: 'option 3', correctOption: 'option 4')
  ];
}

class WrongAnswer {
  dynamic question;
  dynamic options;
  int correct;
  int wrong;

  WrongAnswer({
    required this.question,
    required this.options,
    required this.correct,
    required this.wrong,
  });
}
