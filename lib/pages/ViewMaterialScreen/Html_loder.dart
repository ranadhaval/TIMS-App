import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:tims/widgets/timer_bar.dart';

import 'package:webview_flutter/webview_flutter.dart';

import '../../routes/app_routes.dart';
import '../../theme/app_theme.dart';

import '../../util/constant.dart';
import '../../util/hex_code.dart';
import '../../util/resources.dart';
import '../../util/strings.dart';
import '../../widgets/bottom_card.dart';
import '../Training_Matrix_Screen/Training_Matrix.dart';

class HtmlLoder extends StatefulWidget {
  const HtmlLoder({super.key});

  @override
  State<HtmlLoder> createState() => _HtmlLoderState();
}

class _HtmlLoderState extends State<HtmlLoder> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://www.google.com/'),
      );
  }

  late double height;
  late double width;

  @override
  Widget build(BuildContext context) {
    double mediaHight = MediaQuery.of(context).size.height;
    double mediaWidth = MediaQuery.of(context).size.width;
    return Sizer(builder: (context, orientation, dtype) {
      double mediahight = MediaQuery.of(context).size.height;
      double mediawidth = MediaQuery.of(context).size.width;
      bool landscap = orientation == Orientation.landscape;
      bool isPortrait = orientation == Orientation.portrait;

      if (isPortrait) {
        height = 100.h;
        width = 100.w;
      } else {
        height = 100.w;
        width = 100.h;
      }
      return Stack(children: [
        SingleChildScrollView(
          child: Container(
            width: mediawidth,
            decoration: BoxDecoration(
              color: AppTheme.AppbarColor,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: landscap
                        ? mediawidth / Constant.ladscapappbarHight
                        : mediahight / Constant.potraitappbarHight,
                    width: mediawidth,
                    child: const Image(
                      image: AssetImage(gradientImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: landscap
                      ? mediawidth - (mediawidth / Constant.ladscapappbarHight)
                      : mediahight - (mediahight / Constant.potraitappbarHight),
                  width: mediawidth,
                  color: AppTheme.colorWhite,
                )
              ],
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TimerBar(),
              )
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text('View Material'),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                height: 10,
                color: HexColor('#d0d3da'),
              ),
              Expanded(
                  child: WebViewWidget(
                controller: controller,
              )),
              BottomCardWithOneButton(
                onTap: () {
                  Get.back();
                  Get.offAll(const MatrixScreen());
                },
                title: Strings.finish,
                Width: width,
                height: height,
                isTablet: isTablet,
                isBlue: false,
              )
            ],
          ),
        )
      ]);
    });
  }
}

Widget timer() {
  return Container(
    height: Constant.TIMERBAR_HEIGHT.sp,
    width: Constant.TIMERBAR_WIDTH.sp,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Constant.TIMERBAR_HEIGHT.sp),
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [AppTheme.colorTimerBarend, AppTheme.colorTimerBarstart])),
    child: Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 0),
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
            '00:00:00',
            style: TextStyle(
                color: Colors.white,
                fontSize: Constant.TRAININGLEADINGTEXTSIZE.sp),
          ),
        ],
      ),
    )),
  );
}
              // Expanded(
              //     child: WebViewWidget(
              //   controller: controller,
              // ))