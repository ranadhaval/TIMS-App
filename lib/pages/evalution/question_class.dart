class Question {
  dynamic question;
  List<String> options;
  int correctOptionNum;
  int total;

  Question(
      {required this.question,
      required this.options,
      required this.correctOptionNum,
      required this.total});
}
