import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final cron = Cron();
void showpopup() {
  cron.schedule(Schedule.parse('*/10 * * * * *'), () async {
    // var i = DateTime.now().toString();
    // print(i);

    Get.dialog(AlertDialog(
      title: const Text('Alert'),
      content: const Text('This box will appear in every 10 seconds'),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('okay'))
      ],
    ));
  });
}
