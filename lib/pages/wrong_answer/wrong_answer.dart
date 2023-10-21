import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:tims/pages/wrong_answer/wrong_answer_controller.dart';
import 'package:tims/routes/app_routes.dart';
import 'package:tims/theme/app_theme.dart';
import 'package:tims/util/constant.dart';
import 'package:tims/util/hex_code.dart';
import 'package:tims/util/strings.dart';
import 'package:tims/widgets/basic_background.dart';
import 'package:tims/widgets/bottom_card.dart';
import 'package:tims/widgets/circle_gradient.dart';
import 'package:tims/widgets/PopUp/custom_popup.dart';

class WrongAnswer extends StatefulWidget {
  const WrongAnswer({super.key});

  @override
  State<WrongAnswer> createState() => _WrongAnswerState();
}

class _WrongAnswerState extends State<WrongAnswer> {
  late double height;
  late double width;
  @override
  Widget build(BuildContext context) {
    bool isTablet = SizerUtil.deviceType == DeviceType.tablet;
    final wrongAnswercontroller = Get.put(WrongAnswerController());
    return OrientationBuilder(builder: (context, orientation) {
      bool isPortrait = orientation == Orientation.portrait;
      if (isPortrait) {
        height = 100.h;
        width = 100.w;
      } else {
        height = 100.w;
        width = 100.h;
      }
      return GetBuilder(
        init: WrongAnswerController(),
        builder: (controller) {
          return Stack(children: [
            BasicBackground(),
            Scaffold(
              extendBody: true,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text(
                  Strings.wrongAswer +
                      ' (${controller.waList.length.toString()})',
                  style: TextStyle(fontSize: AppTheme.appBarTextSize.sp),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                toolbarHeight: isTablet ? height * .1 : null,
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < controller.waList.length; i++) ...[
                        SizedBox(
                          width: width * .95,
                          child: Card(
                            elevation: Constant.CARD_ELEVATION,
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(Constant.NORMALPADDING),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircleGradient(
                                        startcolor: AppTheme.colorquemarkstart,
                                        endcolor: AppTheme.colorquemarkend,
                                        widget: Icon(
                                          Icons.question_mark_sharp,
                                          color: AppTheme.colorWhite,
                                          size: Constant.QUE_MARK_ICON_SIZE.sp,
                                        ),
                                        hw: Constant.QUE_MARK_RADIUS.sp,
                                      ),
                                      const SizedBox(
                                        width: Constant.OPTION_FIXED_SPACE,
                                      ),
                                      Text(
                                        (i + 1).toString(),
                                        style: TextStyle(
                                          color: AppTheme.colorDarkGray,
                                        ),
                                      )
                                    ],
                                  ),
                                  Html(
                                    shrinkWrap: true,
                                    data: controller.waList[i].question,
                                  ),
                                  for (int j = 0;
                                      j < controller.waList[i].options.length;
                                      j++) ...[
                                    Card(
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: controller
                                                          .waList[i].correct ==
                                                      j + 1
                                                  ? AppTheme.selectedBordercolor
                                                  : (controller.waList[i]
                                                              .wrong ==
                                                          j + 1
                                                      ? AppTheme
                                                          .wrongAnswerBordercolor
                                                      : AppTheme
                                                          .colorTransparent),
                                              width: Constant
                                                  .SELECTED_OPTION_BORDER.sp),
                                          borderRadius: BorderRadius.circular(
                                              Constant.LISTTILE_BORDER_RADIUS)),
                                      elevation: Constant.CARD_ELEVATION,
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                            Constant.OPTION_CARD_PADING.sp),
                                        child: Row(
                                          children: [
                                            controller.waList[i].correct ==
                                                    j + 1
                                                ? CircleGradient(
                                                    startcolor:
                                                        HexColor('#2be181'),
                                                    endcolor:
                                                        HexColor('#239584'),
                                                    widget: Icon(
                                                      Icons.done,
                                                      color: Colors.white,
                                                      size: Constant
                                                          .OPTION_ICON_SIZE.sp,
                                                    ),
                                                    hw: Constant
                                                        .OPTION_RADIUS.sp,
                                                  )
                                                : (controller.waList[i].wrong ==
                                                        j + 1
                                                    ? CircleGradient(
                                                        startcolor: HexColor(
                                                            Constant
                                                                .startColor[1]),
                                                        endcolor: HexColor(
                                                            Constant
                                                                .endColor[1]),
                                                        widget: Icon(
                                                          Icons.close,
                                                          color: Colors.white,
                                                          size: Constant
                                                              .OPTION_ICON_SIZE
                                                              .sp,
                                                        ),
                                                        hw: Constant
                                                            .OPTION_RADIUS.sp,
                                                      )
                                                    : CircleGradient(
                                                        startcolor: HexColor(
                                                            Constant
                                                                .startColor[j]),
                                                        endcolor: HexColor(
                                                            Constant
                                                                .endColor[j]),
                                                        widget: Text(
                                                          Constant.atoz[j],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        hw: Constant
                                                            .OPTION_RADIUS.sp,
                                                      )),
                                            SizedBox(
                                              width:
                                                  Constant.OPTION_FIXED_SPACE.w,
                                            ),
                                            Text(controller
                                                .waList[i].options[j]),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: Constant.FIXEDSPACE,
                                    ),
                                  ]
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: Constant.NORMALPADDING,
                        )
                      ],
                      SizedBox(
                        height: Constant.FIXED_XTRA_HEIGHT.h,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: Constant.ZERO,
              child: BottomCardWithOneButton(
                onTap: () {
                  Get.dialog(CustomPopup(
                    onSubmitTap: () {
                      Get.toNamed(AppRoutes.FEEDBACKFORM);
                    },
                  ));
                },
                title: Strings.finishevaluation,
                controller: controller,
                Width: width,
                height: height,
                isTablet: isTablet,
                isBlue: false,
              ),
            )
          ]);
        },
      );
    });
  }
}
