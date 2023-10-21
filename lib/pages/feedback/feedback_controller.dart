import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tims/util/strings.dart';

class FeedbackController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var isfirstpressed = false.obs;

  List<TextEditingController> TEControllerList = [];
  List<FBAnswer> formanswer = [
    FBAnswer(
      question:
          " Trainer was energetic with well managed Voice MOdulation and body language (Not Relevant in case of Self Learning)",
      questionId: 1,
    ),
    FBAnswer(
      question:
          " The Trainer was competent, well prepared and able to answer Question properly (Not Relevant in case of Self Learning)",
      questionId: 2,
    ),
    FBAnswer(
      question:
          " Trainer created and maintained environment for learning (Not Relevant in case of Self Learning)",
      questionId: 3,
    ),
    FBAnswer(
      question: " The Content of the course was organized and easy to follow",
      questionId: 4,
    ),
    FBAnswer(
      question: " Which part of content you like most?",
      questionId: 5,
    ),
    FBAnswer(
      question:
          " Which part of training session you like most? (Not Relevant in case of Self Learning)",
      questionId: 6,
    ),
    FBAnswer(
      question: " Open feedbak for Assessment",
      questionId: 7,
    ),
    FBAnswer(
      question:
          " Open feedbak for Training Content/Traininig Session / Assessment",
      questionId: 8,
    ),
    FBAnswer(
      question:
          " What else would you like to see in any matter of training (Traininig Software / Content / Session / Assessment / Scheduling, etc) ?",
      questionId: 9,
    ),
    FBAnswer(
      question: " Any other comments ?",
      questionId: 10,
    )
  ];
  List<FBQuestion> fbList = [
    FBQuestion(
      question:
          " Trainer was energetic with well managed Voice MOdulation and body language (Not Relevant in case of Self Learning)",
      questionId: 1,
    ),
    FBQuestion(
      question:
          " The Trainer was competent, well prepared and able to answer Question properly (Not Relevant in case of Self Learning)",
      questionId: 2,
    ),
    FBQuestion(
      question:
          " Trainer created and maintained environment for learning (Not Relevant in case of Self Learning)",
      questionId: 3,
    ),
    FBQuestion(
      question: " The Content of the course was organized and easy to follow",
      questionId: 4,
    ),
    FBQuestion(
      question: " Which part of content you like most?",
      questionId: 5,
    ),
    FBQuestion(
      question:
          " Which part of training session you like most? (Not Relevant in case of Self Learning)",
      questionId: 6,
    ),
    FBQuestion(
      question: " Open feedbak for Assessment",
      questionId: 7,
    ),
    FBQuestion(
      question:
          " Open feedbak for Training Content/Traininig Session / Assessment",
      questionId: 8,
    ),
    FBQuestion(
      question:
          " What else would you like to see in any matter of training (Traininig Software / Content / Session / Assessment / Scheduling, etc) ?",
      questionId: 9,
    ),
    FBQuestion(
      question: " Any other comments ?",
      questionId: 10,
    ),
  ];

  Map<String, String?> feedbackFromRequest = {
    "trainingDetailId": "",
    "employeeId": "",
    "firstQuestionAnswer": "Strongly Agree",
    "firstQuestionComment": "",
    "secondQuestionAnswer": "Strongly Agree",
    "secondQuestionComment": "",
    "thirdQuestionAnswer": "Strongly Agree",
    "thirdQuestionComment": "",
    "fourthQuestionAnswer": "Strongly Agree",
    "fourthQuestionComment": "",
    "fifthQuestionComment": "",
    "sixthQuestionComment": "",
    "seventhQuestionComment": "",
    "eighthQuestionComment": "",
    "ninethQuestionComment": "",
    "tenthQuestionComment": "",
  };

  @override
  void onInit() {
    for (int i = 0; i < fbList.length; i++) {
      TEControllerList.add(TextEditingController());
    }
    super.onInit();
  }

  @override
  void onClose() {
    for (int i = 0; i < fbList.length; i++) {
      TEControllerList[i].dispose();
    }
    super.onClose();
  }

  void resetAnswer() {
    for (var i in formanswer) {
      i.radioAnswer = Strings.strongelyagree;
      i.remarks = 'N/A';
      update();
    }
    for (var i in TEControllerList) {
      i.clear();
    }
  }
}

class FBQuestion {
  dynamic question;
  int questionId;

  FBQuestion({
    required this.question,
    required this.questionId,
  });
}

class FBAnswer {
  dynamic question;
  int questionId;
  dynamic radioAnswer = Strings.strongelyagree;
  String? remarks;

  FBAnswer(
      {required this.question, required this.questionId, remarks, radioAnswer});

  dynamic toJson() => {
        'question': question,
        'questionId': questionId,
        'radioAnswer': radioAnswer,
        'remarks': remarks
      };
}
