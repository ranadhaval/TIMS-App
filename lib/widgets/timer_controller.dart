import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerController extends GetxController with WidgetsBindingObserver {
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  Timer? timer;
  var timeTaken = 0.obs;
  final time = '00:00:00'.obs;
  int increasingSecondforpdf = 0;
  int decreasingSecond = 0;

  var pausedSeconds = 0.obs;
  static final duration = Duration(seconds: 1);

  @override
  void onClose() {
    if (timer != null) {
      timer!.cancel();
    }
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  String returnTime(int secondss) {
    int minutes = secondss ~/ 60 % 60;
    int hours = secondss ~/ 60 ~/ 60;
    int seconds = secondss % 60;
    return hours.toString().padLeft(2, "0") +
        ":" +
        minutes.toString().padLeft(2, "0") +
        ":" +
        seconds.toString().padLeft(2, "0");
  }

  void restartTimer(int second) {
    time.value = returnTime(second - 1);
    update();
    decreasingSecond = second;
    timer = Timer.periodic(duration, (Timer timer) {
      time.value = returnTime(decreasingSecond);
      decreasingSecond--;
      update();
    });
  }

  void pauseTimer() {
    if (timer!.isActive) {
      pausedSeconds.value = decreasingSecond;
      update();
      timer!.cancel();
    }
  }
}
