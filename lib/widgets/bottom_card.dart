import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tims/pages/evalution/evaluation_controller.dart';
import 'package:tims/routes/app_routes.dart';
import 'package:tims/theme/app_theme.dart';
import 'package:tims/util/constant.dart';
import 'package:tims/util/strings.dart';

class BottomCardWithTwoButton extends StatelessWidget {
  BottomCardWithTwoButton(
      {super.key,
      required this.controller,
      required this.Width,
      required this.height,
      required this.isTablet,
      required this.title1,
      required this.title2,
      required this.onTap1,
      required this.onTap2});

  final double Width;
  final GetxController controller;
  final double height;
  final bool isTablet;
  final String title1;
  final String title2;
  Function() onTap1;
  Function() onTap2;

  @override
  Widget build(BuildContext context) {
    late final btnradius;
    if (isTablet) {
      btnradius = Constant.BTM_BTN_RADIUS_TABLET;
    } else {
      btnradius = Constant.BTM_BTN_RADIUS_MOBILE;
    }

    return SizedBox(
      height: Constant.BOTTOM_CARD_HEIGHT.h,
      width: Width,
      child: Material(
        type: MaterialType.transparency,
        // shadowColor: AppTheme.colorGrey,
        elevation: Constant.BTMCARD_MARGIN,
        borderRadius: BorderRadius.vertical(
            top: Radius.elliptical(
                Constant.BTMCARD_RADIUS, Constant.BTMCARD_RADIUS)),
        child: Container(
          margin: const EdgeInsets.only(top: Constant.BTMCARD_MARGIN),
          decoration: BoxDecoration(
              color: AppTheme.colorCardBg,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.colorGrey,
                  blurRadius: 8,
                )
              ],
              borderRadius: BorderRadius.vertical(
                  top: Radius.elliptical(
                      Constant.BTMCARD_RADIUS, Constant.BTMCARD_RADIUS))),
          child: GetBuilder(
            init: EvaluationController(),
            builder: (controller) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 1.2.h, bottom: 1.8.h, left: 1.2.h, right: 1.2.h),
                    child: InkWell(
                      onTap: onTap1,
                      child: Container(
                        height: Constant.BTM_BTN_HEIGHT.h,
                        width: Width * .44,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(btnradius),
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  AppTheme.colorFinishBtnstart,
                                  AppTheme.colorFinishBtnrend
                                ])),
                        child: Center(
                          child: Text(
                            title1,
                            style: TextStyle(
                              color: AppTheme.colorWhite,
                              fontSize: Constant.BTMCARD_TEXT.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 1.2.h, bottom: 1.8.h, left: 1.2.h, right: 1.2.h),
                    child: InkWell(
                      onTap: onTap2,
                      child: Container(
                        height: Constant.BTM_BTN_HEIGHT.h,
                        width: Width * .44,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(btnradius),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  AppTheme.colorSNBtnstart,
                                  AppTheme.colorSNBtnrend
                                ])),
                        child: Center(
                          child: Text(
                            title2,
                            style: TextStyle(
                              color: AppTheme.colorWhite,
                              fontSize: Constant.TRAININGLEADINGTEXTSIZE.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class BottomCardWithOneButton extends StatelessWidget {
  BottomCardWithOneButton(
      {super.key,
      this.controller,
      required this.Width,
      required this.height,
      required this.isTablet,
      required this.title,
      required this.isBlue,
      required this.onTap});

  final double Width;
  final GetxController? controller;
  final double height;
  final bool isTablet;
  final String title;
  final bool isBlue;

  Function() onTap;

  @override
  Widget build(BuildContext context) {
    late final btnradius;
    if (isTablet) {
      btnradius = Constant.BTM_BTN_RADIUS_TABLET;
    } else {
      btnradius = Constant.BTM_BTN_RADIUS_MOBILE * 2;
    }
    return SizedBox(
        height: Constant.BOTTOM_CARD_HEIGHT.h,
        width: Width,
        child: Material(
          type: MaterialType.transparency,
          elevation: Constant.BTMCARD_MARGIN,
          child: Container(
              margin: const EdgeInsets.only(top: Constant.BTMCARD_MARGIN),
              decoration: BoxDecoration(
                  color: AppTheme.colorCardBg,
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.colorGrey,
                      blurRadius: 12,
                    )
                  ],
                  borderRadius: BorderRadius.vertical(
                      top: Radius.elliptical(
                          Constant.BTMCARD_RADIUS, Constant.BTMCARD_RADIUS))),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 1.2.h, bottom: 1.8.h, left: 1.2.h, right: 1.2.h),
                child: InkWell(
                  onTap: onTap,
                  child: Container(
                    width: 90.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(btnradius / 2),
                        gradient: isBlue
                            ? LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                    AppTheme.colorSNBtnstart,
                                    AppTheme.colorSNBtnrend
                                  ])
                            : LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                    AppTheme.colorFinishBtnstart,
                                    AppTheme.colorFinishBtnrend
                                  ])),
                    child: Center(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: AppTheme.colorWhite,
                          fontSize: Constant.TRAININGLEADINGTEXTSIZE.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              )),
        ));
  }
}
