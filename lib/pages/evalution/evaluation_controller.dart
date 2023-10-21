import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tims/pages/evalution/EvaluationModel.dart';
import 'package:tims/pages/evalution/evalution.dart';
import 'package:tims/pages/evalution/question_class.dart';
import 'package:tims/widgets/timer_controller.dart';

class EvaluationController extends TimerController {
  final isSelected = false.obs;
  var specificindex = 5000.obs;
  var progressvalue = 0.0.obs;
  var islastque = false.obs;
  final time1 = '00:00:00'.obs;
  late EvaluationModel evList;
  var loaded = false.obs;
  var currentQueIndex = 0.obs;

  @override
  void onInit() {
    getEvaluationFromJsonFile().then((value) {
      evList = value;
      restartTimer(int.parse(evList.data!.trainingTotalTimeId!));
      update();
      loaded.value = !evList.isBlank!;
      update();
    });
    super.onInit();
  }

  void nextQue() {
    currentQueIndex.value++;
    specificindex.value = 5000;
    progressvalue.value =
        (currentQueIndex.value / evList.data!.totalQuestion!.toDouble()) *
            100.toDouble();
    update();
  }

  bool islLast(int index) {
    if (index == evList.data!.totalQuestion! - 1) {
      return true;
    } else {
      return false;
    }
  }

  Future<EvaluationModel> getEvaluationFromJsonFile() async {
    final response = await rootBundle.loadString('assets/data/evaluation.json');
    var data = jsonDecode(response);
    if (response.isNotEmpty) {
      return EvaluationModel.fromJson(data);
    } else {
      throw Exception();
    }
  }

  List<Question> quelist = [
    Question(
      total: 2,
      question: '''<html lang="en">
            <body>Question 1</body>
           </html>''',
      options: ['option 1', 'option 2'],
      correctOptionNum: 1,
    ),
    Question(
      total: 2,
      question: ''' <!DOCTYPE html>
<html>
<body>

<h2>Question 2</h2>

<p>This is image question 1</p>

<img src="https://thumbs.dreamstime.com/b/sun-rays-mountain-landscape-5721010.jpg"  width="250" height="250">

</body>
</html>''',
      options: [
        'option 1',
        'option 2',
        'option 3',
        'option 4',
        'option 5',
      ],
      correctOptionNum: 4,
    )
  ];



}
