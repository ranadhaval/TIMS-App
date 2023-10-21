import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tims/pages/Result/result_controller.dart';
import 'package:tims/pages/evalution/evaluation_controller.dart';
import 'package:tims/routes/app_routes.dart';
import 'package:tims/theme/app_theme.dart';
import 'package:tims/util/constant.dart';
import 'package:tims/util/hex_code.dart';
import 'package:tims/util/resources.dart';
import 'package:tims/util/strings.dart';
import 'package:tims/widgets/basic_background.dart';
import 'package:tims/widgets/bottom_card.dart';
import 'package:sizer/sizer.dart';
import 'package:tims/widgets/progress_indicator.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late double height;
  late double width;
  @override
  Widget build(BuildContext context) {
    bool isTablet = SizerUtil.deviceType == DeviceType.tablet;
    final resultcontroller = Get.put(ResultController());
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
        init: resultcontroller,
        builder: (controller) {
          return Stack(children: [
            BasicBackground(
              height: Constant.RESULT_BG_HEIGHT.h,
            ),
            Scaffold(
              extendBody: true,
              backgroundColor: AppTheme.colorTransparent,
              appBar: AppBar(
                title: Text(
                  Strings.result,
                  style: TextStyle(fontSize: AppTheme.appBarTextSize.sp),
                ),
                backgroundColor: AppTheme.colorTransparent,
                elevation: Constant.ZERO,
                toolbarHeight: isTablet ? height * .1 : null,
              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        trophy,
                        height: isPortrait ? height * .1 : width * .1,
                      ),
                      SizedBox(
                          width: width * .95,
                          child: Card(
                            elevation: Constant.CARD_ELEVATION,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      resultScreenBG,
                                      height: height * .25,
                                      width: width * .95,
                                    ),
                                    EvaluationProgressIndicator(
                                      height: height,
                                      value: 33,
                                      rf: Constant.RESULT_RADIUS_FACTOR,
                                      endColor: AppTheme.colorProgressresultend,
                                      startColor:
                                          AppTheme.colorProgressresultStart,
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height:
                                          Constant.PINKBLUECONTAINER_HEIFGT.h,
                                      width: isPortrait
                                          ? height * .18
                                          : width * .36,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  AppTheme.pinkContainerShadow,
                                              blurRadius: Constant.BLURRADIUS,
                                            )
                                          ],
                                          borderRadius: BorderRadius.circular(
                                              Constant.LISTTILE_BORDER_RADIUS),
                                          gradient: LinearGradient(
                                              colors: [
                                                AppTheme.pinkContainerStart,
                                                AppTheme.pinkContainerEnd
                                              ],
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(
                                            Constant.NORMALPADDING),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                Strings.result,
                                                style: TextStyle(
                                                    color: AppTheme.colorWhite,
                                                    fontSize: Constant
                                                        .PINKBLUECONTAINER_TEXT_HEIFGT
                                                        .sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Text(
                                                Strings.pass,
                                                style: TextStyle(
                                                    color: AppTheme.colorWhite,
                                                    fontSize: Constant
                                                        .PINKBLUECONTAINER_TEXT_HEIFGT
                                                        .sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height:
                                          Constant.PINKBLUECONTAINER_HEIFGT.h,
                                      width: isPortrait
                                          ? height * .18
                                          : width * .36,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  AppTheme.blueContainerShadow,
                                              blurRadius: Constant.BLURRADIUS,
                                            )
                                          ],
                                          borderRadius: BorderRadius.circular(
                                              Constant.LISTTILE_BORDER_RADIUS),
                                          gradient: LinearGradient(
                                              colors: [
                                                AppTheme.blueContainerStart,
                                                AppTheme.blueContainerEnd
                                              ],
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(
                                            Constant.NORMALPADDING),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                Strings.passcritearea,
                                                style: TextStyle(
                                                    color: AppTheme.colorWhite,
                                                    fontSize: Constant
                                                        .PINKBLUECONTAINER_TEXT_HEIFGT
                                                        .sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Text(
                                                '80%',
                                                style: TextStyle(
                                                    color: AppTheme.colorWhite,
                                                    fontSize: Constant
                                                        .PINKBLUECONTAINER_TEXT_HEIFGT
                                                        .sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: Constant.TOO_SMALL_PADDING.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CIrcleCard(
                                        height: height,
                                        icon: Icon(
                                          Icons.done,
                                          color: AppTheme.resultCorrectStart,
                                          size: Constant.ICON_SIZE.sp,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            width: width * .72,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                    Strings.correctanswer),
                                                Text(
                                                  '2',
                                                  style: TextStyle(
                                                      color: AppTheme
                                                          .resultCorrectStart,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * .01,
                                          ),
                                          Container(
                                            width: width * .72,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(Constant
                                                        .LISTTILE_BORDER_RADIUS),
                                                gradient:
                                                    LinearGradient(colors: [
                                                  AppTheme.resultCorrectStart,
                                                  AppTheme.resultCorrectEnd,
                                                  AppTheme.progressbgresult,
                                                ], stops: [
                                                  .5 / 2,
                                                  .5,
                                                  .5,
                                                ])),
                                            child: const SizedBox(
                                                height: Constant.NORMALPADDING),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: Constant.TOO_SMALL_PADDING.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CIrcleCard(
                                        height: height,
                                        icon: Icon(
                                          Icons.close,
                                          color: AppTheme.resultInCorrectStart,
                                          size: Constant.ICON_SIZE.sp,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            width: width * .72,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                    Strings.incorrectanswer),
                                                Text(
                                                  '2',
                                                  style: TextStyle(
                                                      color: AppTheme
                                                          .resultInCorrectStart,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * .01,
                                          ),
                                          Container(
                                            width: width * .72,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(Constant
                                                        .LISTTILE_BORDER_RADIUS),
                                                gradient:
                                                    LinearGradient(colors: [
                                                  AppTheme.resultInCorrectStart,
                                                  AppTheme.resultInCorrectEnd,
                                                  AppTheme.progressbgresult,
                                                ], stops: [
                                                  .5 / 2,
                                                  .5,
                                                  .5,
                                                ])),
                                            child: const SizedBox(
                                                height: Constant.NORMALPADDING),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: Constant.TOO_SMALL_PADDING.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CIrcleCard(
                                        height: height,
                                        icon: Icon(
                                          Icons.remove_circle,
                                          color: AppTheme.colorTimerBarend,
                                          size: Constant.ICON_SIZE.sp,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            width: width * .72,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                    Strings.notattempted),
                                                Text(
                                                  '2',
                                                  style: TextStyle(
                                                      color: AppTheme
                                                          .colorTimerBarend,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * .01,
                                          ),
                                          Container(
                                            width: width * .72,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(Constant
                                                        .LISTTILE_BORDER_RADIUS),
                                                gradient:
                                                    LinearGradient(colors: [
                                                  AppTheme.colorTimerBarend,
                                                  AppTheme.colorTimerBarstart,
                                                  AppTheme.progressbgresult,
                                                ], stops: [
                                                  .5 / 2,
                                                  .5,
                                                  .5,
                                                ])),
                                            child: const SizedBox(
                                                height: Constant.NORMALPADDING),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: Constant.TOO_SMALL_PADDING.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CIrcleCard(
                                        height: height,
                                        icon: Icon(
                                          Icons.schedule,
                                          color: HexColor('#2c4556'),
                                          size: Constant.ICON_SIZE.sp,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            width: width * .72,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(Strings.timetaken),
                                                Text(
                                                  controller.time1.value,
                                                  style: TextStyle(
                                                      color:
                                                          HexColor('#2c4556'),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * .01,
                                          ),
                                          Container(
                                            width: width * .72,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(Constant
                                                        .LISTTILE_BORDER_RADIUS),
                                                gradient:
                                                    LinearGradient(colors: [
                                                  AppTheme.resultTimeTakenStart,
                                                  AppTheme.resultTimeTakenEnd,
                                                  AppTheme.progressbgresult,
                                                ], stops: [
                                                  .5 / 4,
                                                  .5,
                                                  .5,
                                                ])),
                                            child: const SizedBox(
                                                height: Constant.NORMALPADDING),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: Constant.FIXED_XTRA_HEIGHT.h,
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: Constant.ZERO,
                child: BottomCardWithOneButton(
                  onTap: () {
                    Get.toNamed(AppRoutes.WRONGANSWER);
                  },
                  isBlue: true,
                  title: Strings.wronganswer,
                  controller: controller,
                  Width: width,
                  height: height,
                  isTablet: isTablet,
                ))
          ]);
        },
      );
    });
  }
}

class CIrcleCard extends StatelessWidget {
  const CIrcleCard({
    super.key,
    required this.height,
    required this.icon,
  });
  final double height;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Constant.CIRCLECARDHW.h,
      width: Constant.CIRCLECARDHW.h,
      child: Card(
        color: AppTheme.colorCardBg,
        shape: const CircleBorder(),
        elevation: Constant.CARD_ELEVATION,
        child: icon,
      ),
    );
  }
}
