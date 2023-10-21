import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tims/routes/app_routes.dart';
import 'package:tims/theme/app_theme.dart';
import 'package:tims/util/constant.dart';
import 'package:tims/util/resources.dart';
import 'package:tims/util/strings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tims/widgets/PopUp/popup_controller.dart';

class CustomPopup extends StatelessWidget {
  Function() onSubmitTap;

  CustomPopup({super.key, required this.onSubmitTap});
  late double height;
  late double width;
  final popupController = Get.put(PopupController());
  @override
  Widget build(BuildContext context) {
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
          init: popupController,
          builder: (controller) {
            return Center(
              child: SingleChildScrollView(
                child:
                 Dialog(
                  backgroundColor: const Color(0xffffffff),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(Constant.LISTTILE_BORDER_RADIUS),
                  ),
                  child: SizedBox(
                    height: Constant.POPUP_HEIGHT.h,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.all(Constant.VERY_SMALL_PADDING.sp),
                          height: Constant.POPUP_TITLE_HEIGHT.h,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                            AppTheme.popupTitleStart,
                            AppTheme.popupTitleEnd
                          ])),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                padlockSvg,
                                matchTextDirection: true,
                                height: Constant.PADLOCK_HW.h,
                                width: Constant.PADLOCK_HW.h,
                              ),
                              SizedBox(
                                width: Constant.OPTION_FIXED_SPACE.w,
                              ),
                              Text(
                                Strings.pwverification,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AppTheme.PoupUpTitleSize.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: Constant.popupCLOSEICONSize.sp,
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Constant.popupFixSize.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(Constant.NORMALPADDING),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Strings.eApproval,
                                style: TextStyle(
                                    fontSize:
                                        Constant.TRAININGLEADINGTEXTSIZE.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: width * .45,
                                height: Constant.popupinputSize.h,
                                child: TextField(
                                  controller: controller.popupcontroller,
                                  onTapOutside: (event) {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  cursorColor: Colors.black,
                                  maxLines: 1,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      filled: true,
                                      fillColor: AppTheme.popupInputColor,
                                      enabledBorder: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Constant.popupFixSize.h,
                          child: controller.issuccess.value
                              ? null
                              : Text(
                                  'error',
                                  style: TextStyle(fontSize: 20),
                                ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(Constant.NORMALPADDING),
                          child: InkWell(
                            onTap: () {
                              controller.callpopupApi();
                              //onSubmitTap;
                            },
                            child: Container(
                              width: double.infinity,
                              height: Constant.POPUP_BTN_HEIGHT.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Constant.BTM_BTN_RADIUS_MOBILE),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        AppTheme.colorSNBtnstart,
                                        AppTheme.colorSNBtnrend
                                      ])),
                              child: Center(
                                child: Text(
                                  Strings.submitupper,
                                  style: TextStyle(
                                      color: AppTheme.colorWhite
                                          .withOpacity(Constant.TEXTOPACITY),
                                      fontSize: Constant.BTMCARD_TEXT.sp),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
    });
  }
}
