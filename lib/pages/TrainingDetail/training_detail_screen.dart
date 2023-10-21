import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:tims/pages/TrainingDetail/training_controller.dart';
import 'package:tims/routes/app_routes.dart';

import 'package:tims/theme/app_theme.dart';
import 'package:tims/util/constant.dart';
import 'package:tims/util/hex_code.dart';
import 'package:tims/util/resources.dart';
import 'package:tims/util/strings.dart';
import 'package:tims/widgets/basic_background.dart';

class TrainingDetail extends StatefulWidget {
  const TrainingDetail({super.key});

  @override
  State<TrainingDetail> createState() => _TrainingDetailState();
}

class _TrainingDetailState extends State<TrainingDetail> {
  late double height;
  late double width;
  @override
  Widget build(BuildContext context) {
    bool isTablet = SizerUtil.deviceType == DeviceType.tablet;
    final trainingcontroller = Get.put(TrainingController());
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
        init: trainingcontroller,
        builder: (controller) {
          return Stack(children: [
            BasicBackground(
              height: Constant.TRAINING_BG_HEIGHT.h,
            ),
            Scaffold(
              extendBody: true,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                toolbarHeight: isTablet ? height * .1 : null,
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: isTablet
                            ? Constant.TAB_CA_RADIUS.h
                            : Constant.MOB_CA_RADIUS.h,
                        backgroundColor: AppTheme.colorWhite,
                        child: Text(
                          'S',
                          style: TextStyle(
                              fontSize: Constant.CA_FONT.sp,
                              color: AppTheme.caFontColor),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: Constant.MEDIUM_PADDING),
                        child: Text(
                          '302DE35',
                          style: TextStyle(
                              color: AppTheme.colorWhite,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(Constant.SOP_PADDING.h),
                        child: Text(
                          'SOP',
                          style: TextStyle(
                            color: AppTheme.colorWhite,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.VIEWMATERIAL);
                            },
                            child: Container(
                              height: Constant.trainingbuttonHeight.h,
                              width: Constant.trainingbuttonwidth.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border:
                                      Border.all(color: AppTheme.colorWhite)),
                              child: Padding(
                                padding: const EdgeInsets.all(
                                    Constant.trainingbuttonPadding),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      training,
                                      scale: isTablet
                                          ? Constant.CONTTRAIMGESCALETAB
                                          : Constant.CONTTRAIMGESCALEMOB,
                                    ),
                                    Text(
                                      Strings.conttra,
                                      style: TextStyle(
                                          color: AppTheme.colorWhite,
                                          fontSize: Constant
                                              .trainingbuttonTextSize.sp),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.EVALUATION);
                            },
                            child: Container(
                              height: Constant.trainingbuttonHeight.h,
                              width: Constant.trainingbuttonwidth.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border:
                                      Border.all(color: AppTheme.colorWhite)),
                              child: Padding(
                                padding: const EdgeInsets.all(
                                    Constant.trainingbuttonPadding),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      evaluation,
                                      scale: isTablet
                                          ? Constant.CONTTRAIMGESCALETAB
                                          : Constant.CONTTRAIMGESCALEMOB,
                                    ),
                                    Text(
                                      Strings.evaluationUpper,
                                      style: TextStyle(
                                          color: AppTheme.colorWhite,
                                          fontSize: Constant
                                              .trainingbuttonTextSize.sp),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: height * .02, bottom: 4.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  Strings.version,
                                  style: TextStyle(
                                    color: AppTheme.colorWhite
                                        .withOpacity(Constant.TEXTOPACITY),
                                    fontSize: AppTheme.verySmall.sp,
                                  ),
                                ),
                                SizedBox(
                                    height: Constant.TOO_MUCH_SMALL_PADDING.h),
                                Text(
                                  '4.0',
                                  style: TextStyle(
                                      color: AppTheme.colorWhite,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  Strings.time,
                                  style: TextStyle(
                                    color: AppTheme.colorWhite
                                        .withOpacity(Constant.TEXTOPACITY),
                                    fontSize: AppTheme.verySmall.sp,
                                  ),
                                ),
                                SizedBox(
                                    height: Constant.TOO_MUCH_SMALL_PADDING.h),
                                Text(
                                  '00:00:30',
                                  style: TextStyle(
                                      color: AppTheme.colorWhite,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  Strings.publish,
                                  style: TextStyle(
                                    color: AppTheme.colorWhite
                                        .withOpacity(Constant.TEXTOPACITY),
                                    fontSize: AppTheme.verySmall.sp,
                                  ),
                                ),
                                SizedBox(
                                    height: Constant.TOO_MUCH_SMALL_PADDING.h),
                                Text(
                                  'Yes',
                                  style: TextStyle(
                                      color: AppTheme.colorWhite,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  Strings.document,
                                  style: TextStyle(
                                    color: AppTheme.colorWhite
                                        .withOpacity(Constant.TEXTOPACITY),
                                    fontSize: AppTheme.verySmall.sp,
                                  ),
                                ),
                                SizedBox(
                                    height: Constant.TOO_MUCH_SMALL_PADDING.h),
                                Text(
                                  '2',
                                  style: TextStyle(
                                      color: AppTheme.colorWhite,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width * .85,
                        child: Card(
                          elevation: Constant.CARD_ELEVATION,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: Constant.TOO_MUCH_SMALL_PADDING.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      Strings.training,
                                      style: TextStyle(
                                        fontSize: AppTheme.verySmall.sp,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            Constant.TOO_MUCH_SMALL_PADDING.h),
                                    SvgPicture.asset(
                                      hourglass,
                                      height: 2.h,
                                      width: 2.h,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      Strings.content,
                                      style: TextStyle(
                                        fontSize: AppTheme.verySmall.sp,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            Constant.TOO_MUCH_SMALL_PADDING.h),
                                    Text(
                                      'N/A',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: AppTheme.NASize.sp),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      Strings.evaluation,
                                      style: TextStyle(
                                        fontSize: AppTheme.verySmall.sp,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            Constant.TOO_MUCH_SMALL_PADDING.h),
                                    Icon(
                                      Icons.close_sharp,
                                      color: Colors.red,
                                      size: Constant.CLOSEICONSize.sp,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(Constant.NORMALPADDING),
                        child: SizedBox(
                            width: width * .95,
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: Constant.CARD_ELEVATION,
                              child: Padding(
                                padding: const EdgeInsets.all(
                                    Constant.NORMALPADDING),
                                child: Column(
                                  children: [
                                    for (int i = 0; i < 6; i++) ...[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(Constant
                                                        .LISTTILE_BORDER_RADIUS),
                                                color: HexColor(Constant
                                                        .TRAININGLeadingColorbg[
                                                    i % 3])),
                                            height: Constant.TRAININGLEADING.h,
                                            width: Constant.TRAININGLEADING.h,
                                            child: Icon(
                                              Icons.done,
                                              size: Constant.QUE_MARK_ICON_SIZE,
                                              color: HexColor(Constant
                                                  .TRAININGLeadingColor[i % 3]),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: Constant.OPTION_FIXED_SPACE,
                                          ),
                                          Text(
                                            Strings.userScreenCardStrings[i],
                                            style: TextStyle(
                                                fontSize: Constant
                                                    .TRAININGLEADINGTEXTSIZE.sp,
                                                color: AppTheme.colorDarkGray),
                                          ),
                                          const SizedBox(
                                            width: Constant.OPTION_FIXED_SPACE,
                                          ),
                                          Expanded(
                                            child: Text(
                                              controller.trailcard[i],
                                              style: TextStyle(
                                                  fontSize: Constant
                                                      .TRAININGTRAILINGTEXTSIZE
                                                      .sp,
                                                  color: AppTheme.colorGray),
                                              textAlign: TextAlign.end,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: Constant.TRAININGpadding.h,
                                      )
                                    ]
                                  ],
                                ),
                              ),
                            )),
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(Constant.NORMALPADDING),
                          child: Text(
                            'Description',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                          width: width * .95,
                          child: Card(
                            elevation: Constant.CARD_ELEVATION,
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(Constant.NORMALPADDING),
                              child: Text(
                                'Long Long text for description.........................................................................\n',
                                style: TextStyle(color: AppTheme.colorDarkGray),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: Constant.TOO_MUCH_SMALL_PADDING.h,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]);
        },
      );
    });
  }
}
