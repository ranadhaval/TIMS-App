import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tims/widgets/timer_controller.dart';
import 'package:tims/theme/app_theme.dart';
import 'package:tims/util/constant.dart';

class TimerBar extends StatelessWidget {
  // TimerBar({super.key, required this.controller});
  // TimerController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constant.TIMERBAR_HEIGHT.h,
      width: Constant.TIMERBAR_WIDTH.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constant.TIMERBAR_HEIGHT.h),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                AppTheme.colorTimerBarend,
                AppTheme.colorTimerBarstart
              ])),
      child: Center(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: .2.h, horizontal: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.schedule,
              color: Colors.white,
              size: Constant.QUE_MARK_ICON_SIZE.sp,
            ),
            Text(
              // controller.time.value,
              "00:00:00",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Constant.TRAININGLEADINGTEXTSIZE.sp),
            ),
          ],
        ),
      )),
    );
  }
}
