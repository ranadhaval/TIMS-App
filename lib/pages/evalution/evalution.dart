import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:tims/pages/evalution/evaluation_controller.dart';
import 'package:tims/routes/app_routes.dart';
import 'package:tims/theme/app_theme.dart';
import 'package:tims/util/constant.dart';
import 'package:tims/util/hex_code.dart';
import 'package:tims/util/strings.dart';
import 'package:tims/widgets/basic_background.dart';
import 'package:tims/widgets/bottom_card.dart';
import 'package:tims/widgets/circle_gradient.dart';
import 'package:tims/widgets/progress_bar.dart';
import 'package:tims/widgets/progress_indicator.dart';
import 'package:tims/widgets/timer_bar.dart';

class Evaluation extends StatefulWidget {
  const Evaluation({super.key});

  @override
  State<Evaluation> createState() => _EvaluationState();
}

class _EvaluationState extends State<Evaluation> {
  late double height;
  late double width;

  @override
  Widget build(BuildContext context) {
    bool isTablet = SizerUtil.deviceType == DeviceType.tablet;
    final evaluationcontroller = Get.put(EvaluationController());

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
        init: evaluationcontroller,
        builder: (controller) {
          return controller.loaded.value
              ? Stack(children: [
                  BasicBackground(),
                  Scaffold(
                      extendBody: true,
                      backgroundColor: AppTheme.colorTransparent,
                      appBar: AppBar(
                        title: Text(
                          Strings.evaluation,
                          style:
                              TextStyle(fontSize: AppTheme.appBarTextSize.sp),
                        ),
                        backgroundColor: AppTheme.colorTransparent,
                        elevation: Constant.ZERO,
                        toolbarHeight: isTablet ? height * .1 : null,
                      ),
                      body: SingleChildScrollView(
                        child: Center(
                          child: SizedBox(
                              width: width * .95,
                              child: Card(
                                elevation: Constant.CARD_ELEVATION,
                                child: Padding(
                                  padding: EdgeInsets.all(height * .01),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CircleGradient(
                                            startcolor:
                                                AppTheme.colorquemarkstart,
                                            endcolor: AppTheme.colorquemarkend,
                                            widget: Icon(
                                              Icons.question_mark_sharp,
                                              color: AppTheme.colorWhite,
                                              size: Constant
                                                  .QUE_MARK_ICON_SIZE.sp,
                                            ),
                                            hw: Constant.QUE_MARK_RADIUS.sp,
                                          ),
                                          const SizedBox(
                                            width: Constant.VERY_SMALL_PADDING,
                                          ),
                                          Text(
                                            '${controller.evList.data!.questionList![controller.currentQueIndex.value].questionNo}/${controller.evList.data!.totalQuestion}',
                                            style: TextStyle(
                                              color: AppTheme.colorDarkGray,
                                            ),
                                          ),
                                          const Spacer(),
                                          TimerBar(
                                              // controller: controller,
                                              ),
                                        ],
                                      ),
                                      EvaluationProgressIndicator(
                                        rf: Constant.EVA_RADIUS_FACTOR,
                                        height: height,
                                        value: controller.progressvalue.value,
                                        endColor: AppTheme.colorProgressend,
                                        startColor: AppTheme.colorProgress,
                                      ),
                                      Builder(builder: (context) {
                                        return Column(
                                          children: [
                                            Html(
                                                shrinkWrap: true,
                                                data: controller
                                                    .evList
                                                    .data!
                                                    .questionList![controller
                                                        .currentQueIndex.value]
                                                    .questionText),
                                            for (int i = 0;
                                                i <
                                                    controller
                                                        .evList
                                                        .data!
                                                        .questionList![
                                                            controller
                                                                .currentQueIndex
                                                                .value]
                                                        .optionList!
                                                        .length;
                                                i++) ...[
                                              InkWell(
                                                child: Card(
                                                  elevation:
                                                      Constant.CARD_ELEVATION,
                                                  shape: RoundedRectangleBorder(
                                                      side: controller
                                                                  .specificindex
                                                                  .value ==
                                                              i
                                                          ? BorderSide(
                                                              color: AppTheme
                                                                  .selectedBordercolor,
                                                              width: Constant
                                                                  .SELECTED_OPTION_BORDER
                                                                  .sp)
                                                          : const BorderSide(
                                                              color: Colors
                                                                  .transparent),
                                                      borderRadius: BorderRadius
                                                          .circular(Constant
                                                              .LISTTILE_BORDER_RADIUS)),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(
                                                        Constant
                                                            .OPTION_CARD_PADING
                                                            .sp),
                                                    child: Row(
                                                      children: [
                                                        CircleGradient(
                                                          startcolor: HexColor(
                                                              Constant.startColor[
                                                                  i % 4]),
                                                          endcolor: HexColor(
                                                              Constant.endColor[
                                                                  i % 4]),
                                                          widget: controller
                                                                      .specificindex
                                                                      .value ==
                                                                  i
                                                              ? Icon(
                                                                  Icons.done,
                                                                  color: Colors
                                                                      .white,
                                                                  size: Constant
                                                                      .OPTION_ICON_SIZE
                                                                      .sp,
                                                                )
                                                              : Text(
                                                                  controller
                                                                      .evList
                                                                      .data!
                                                                      .questionList![controller
                                                                          .currentQueIndex
                                                                          .value]
                                                                      .optionList![
                                                                          i]
                                                                      .optionPrefix!,
                                                                  style:
                                                                      const TextStyle(
                                                                    color: AppTheme
                                                                        .colorWhite,
                                                                  ),
                                                                ),
                                                          hw: Constant
                                                              .OPTION_RADIUS.sp,
                                                        ),
                                                        SizedBox(
                                                          width: Constant
                                                              .OPTION_FIXED_SPACE
                                                              .w,
                                                        ),
                                                        Text(
                                                          controller
                                                                  .evList
                                                                  .data!
                                                                  .questionList![
                                                                      controller
                                                                          .currentQueIndex
                                                                          .value]
                                                                  .optionList![
                                                                      i]
                                                                  .answerText ??
                                                              'nothing',
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                onTap: () {
                                                  controller
                                                      .specificindex.value = i;
                                                  controller.update();
                                                },
                                              )
                                            ],
                                            SizedBox(
                                                height: Constant
                                                    .FIXED_XTRA_HEIGHT.h)
                                          ],
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      )),
                  Positioned(
                      bottom: Constant.ZERO,
                      child:
                          (controller.islLast(controller.currentQueIndex.value)
                              ? BottomCardWithOneButton(
                                  onTap: () {
                                    Get.offNamed(
                                      AppRoutes.RESULT,
                                    );
                                    controller.timeTaken.value =
                                        1800 - controller.decreasingSecond;
                                    controller.time1.value = controller
                                        .returnTime(controller.timeTaken.value);
                                    controller.update();
                                  },
                                  title: Strings.finish,
                                  controller: controller,
                                  Width: width,
                                  height: height,
                                  isTablet: isTablet,
                                  isBlue: false,
                                )
                              : BottomCardWithTwoButton(
                                  title1: Strings.finish,
                                  title2: Strings.saveandnext,
                                  onTap1: () {
                                    Get.offNamed(
                                      AppRoutes.RESULT,
                                    );
                                    controller.timeTaken.value =
                                        1800 - controller.decreasingSecond;
                                    controller.time1.value = controller
                                        .returnTime(controller.timeTaken.value);
                                    controller.update();
                                  },
                                  onTap2: () {
                                    controller.nextQue();
                                  },
                                  controller: controller,
                                  Width: width,
                                  height: height,
                                  isTablet: isTablet,
                                ))),
                ])
              : ProgresssBar(isLoader: true);
        },
      );
    });
  }
}
