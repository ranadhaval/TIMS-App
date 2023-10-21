class EvaluationModel {
  bool? success;
  Null? message;
  Null? errorMessage;
  int? returnCode;
  Data? data;
  String? accessToken;

  EvaluationModel(
      {this.success,
      this.message,
      this.errorMessage,
      this.returnCode,
      this.data,
      this.accessToken});

  EvaluationModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    errorMessage = json['errorMessage'];
    returnCode = json['returnCode'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['errorMessage'] = this.errorMessage;
    data['returnCode'] = this.returnCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['accessToken'] = this.accessToken;
    return data;
  }
}

class Data {
  String? traningTotalTimeId;
  int? quizTimeSaveDuration;
  String? trainingTotalTimeId;
  int? totalQuestion;
  List<QuestionList>? questionList;
  int? currentQuizId;
  int? quizDuration;
  int? startQuizWithQuestionNo;
  int? attemptedQuizTime;
  String? evaluationId;

  Data(
      {this.traningTotalTimeId,
      this.quizTimeSaveDuration,
      this.trainingTotalTimeId,
      this.totalQuestion,
      this.questionList,
      this.currentQuizId,
      this.quizDuration,
      this.startQuizWithQuestionNo,
      this.attemptedQuizTime,
      this.evaluationId});

  Data.fromJson(Map<String, dynamic> json) {
    traningTotalTimeId = json['traningTotalTimeId'];
    quizTimeSaveDuration = json['quizTimeSaveDuration'];
    trainingTotalTimeId = json['trainingTotalTimeId'];
    totalQuestion = json['totalQuestion'];
    if (json['questionList'] != null) {
      questionList = <QuestionList>[];
      json['questionList'].forEach((v) {
        questionList!.add(new QuestionList.fromJson(v));
      });
    }
    currentQuizId = json['currentQuizId'];
    quizDuration = json['quizDuration'];
    startQuizWithQuestionNo = json['startQuizWithQuestionNo'];
    attemptedQuizTime = json['attemptedQuizTime'];
    evaluationId = json['evaluationId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['traningTotalTimeId'] = this.traningTotalTimeId;
    data['quizTimeSaveDuration'] = this.quizTimeSaveDuration;
    data['trainingTotalTimeId'] = this.trainingTotalTimeId;
    data['totalQuestion'] = this.totalQuestion;
    if (this.questionList != null) {
      data['questionList'] = this.questionList!.map((v) => v.toJson()).toList();
    }
    data['currentQuizId'] = this.currentQuizId;
    data['quizDuration'] = this.quizDuration;
    data['startQuizWithQuestionNo'] = this.startQuizWithQuestionNo;
    data['attemptedQuizTime'] = this.attemptedQuizTime;
    data['evaluationId'] = this.evaluationId;
    return data;
  }
}

class QuestionList {
  String? questionId;
  int? questionNo;
  List<OptionList>? optionList;
  String? questionMark;
  String? isMultiselectionQuestion;
  String? questionText;

  QuestionList(
      {this.questionId,
      this.questionNo,
      this.optionList,
      this.questionMark,
      this.isMultiselectionQuestion,
      this.questionText});

  QuestionList.fromJson(Map<String, dynamic> json) {
    questionId = json['questionId'];
    questionNo = json['questionNo'];
    if (json['optionList'] != null) {
      optionList = <OptionList>[];
      json['optionList'].forEach((v) {
        optionList!.add(new OptionList.fromJson(v));
      });
    }
    questionMark = json['questionMark'];
    isMultiselectionQuestion = json['isMultiselectionQuestion'];
    questionText = json['questionText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questionId'] = this.questionId;
    data['questionNo'] = this.questionNo;
    if (this.optionList != null) {
      data['optionList'] = this.optionList!.map((v) => v.toJson()).toList();
    }
    data['questionMark'] = this.questionMark;
    data['isMultiselectionQuestion'] = this.isMultiselectionQuestion;
    data['questionText'] = this.questionText;
    return data;
  }
}

class OptionList {
  String? answerId;
  String? optionPrefix;
  String? answerText;

  OptionList({this.answerId, this.optionPrefix, this.answerText});

  OptionList.fromJson(Map<String, dynamic> json) {
    answerId = json['answerId'];
    optionPrefix = json['optionPrefix'];
    answerText = json['answerText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answerId'] = this.answerId;
    data['optionPrefix'] = this.optionPrefix;
    data['answerText'] = this.answerText;
    return data;
  }
}
