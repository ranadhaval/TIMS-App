import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tims/pages/Login/Login_Page.dart';
import 'package:tims/theme/app_theme.dart';
import 'package:tims/util/constant.dart';
import 'package:tims/util/resources.dart';
import '../../util/strings.dart';
import '../../widgets/tutorial_widget.dart';


// ignore: camel_case_types
class onBoardingPage extends StatefulWidget {
  const onBoardingPage({super.key});

  @override
  State<onBoardingPage> createState() => onBoardingPageState();
}

// ignore: camel_case_types
class onBoardingPageState extends State<onBoardingPage> {
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  GetStorage getStorage = GetStorage();
  bool lastPage = true;
  int index_ = 0;

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, dtype) {
      return orientation == Orientation.landscape
          ? scaff(13.w, 35.w, 12.w, 5.w, 8.w, 0.7.w)
          : scaff(5.h, 25.w, 15.w, 1.8.h, 3.h, 0.2.h);
    });
  }

  PageController pageController = PageController();

  Widget scaff(double nextHight, double nextwidth, double padding,
      double fontsize, double iconsize, double borderwidth) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return Sizer(builder: (context, orientation, dtype) {
      bool landscap = orientation == Orientation.landscape;
      return Scaffold(
        body: Stack(children: [
          Container(
            alignment: Alignment.center,
            child: Stack(
              children: [
                landscap
                    ? PageView(
                        onPageChanged: (index) {
                          setState(() {
                            index_ = index;

                            if (index >= 3 && index != 0) {
                              lastPage = true;
                            } else {
                              lastPage = false;
                            }
                          });
                        },
                        controller: pageController,
                        children: [
                          myScaffold1(
                            sizeHeight,
                            sizeWidth,
                            context,
                            Constant.gradientHiget.w,
                            Constant.tutorialPageTextsize.sp,
                            Constant.tutorialPageTextsize2.sp,
                            Constant.skipPage1TextSize1.sp,
                            Constant.skipPage1TextSize2.sp,
                            0,
                            AppTheme.skip1BodyColor,
                            AppTheme.skip1BorderColor,
                            "",
                            "",
                            "",
                            0,
                            0,
                            0,
                            landscap,
                          ),
                          myScaffold1(
                              sizeHeight,
                              sizeWidth,
                              context,
                              Constant.gradientHiget.w,
                              Constant.tutorialPageTextsize.sp,
                              Constant.tutorialPageTextsize2.sp,
                              Constant.skipPageTextSize1.sp,
                              Constant.skipPageTextSize2.sp,
                              1,
                              AppTheme.skip2BodyColor,
                              AppTheme.skip2BorderColor,
                              Strings.skip1Text,
                              Strings.skip1Text2,
                              skip_1,
                              Constant.pagecircleradius.w,
                              Constant.skipPageTextSize3.sp,
                              Constant.skipPageTextSize4.w,
                              landscap),
                          myScaffold1(
                              sizeHeight,
                              sizeWidth,
                              context,
                              Constant.gradientHiget.w,
                              Constant.tutorialPageTextsize.sp,
                              Constant.tutorialPageTextsize2.sp,
                              Constant.skipPageTextSize1.sp,
                              Constant.skipPageTextSize2.sp,
                              2,
                              AppTheme.skip3BodyColor,
                              AppTheme.skip3BorderColor,
                              Strings.skip2Text,
                              Strings.skip2Text2,
                              skip_3,
                              Constant.pagecircleradius.w,
                              Constant.skipPageTextSize3.sp,
                              Constant.skipPageTextSize4.w,
                              landscap),
                          myScaffold1(
                              sizeHeight,
                              sizeWidth,
                              context,
                              Constant.gradientHiget.w,
                              Constant.tutorialPageTextsize.sp,
                              Constant.tutorialPageTextsize2.sp,
                              Constant.skipPageTextSize1.sp,
                              Constant.skipPageTextSize2.sp,
                              3,
                              AppTheme.skip4BodyColor,
                              AppTheme.skip4BorderColor,
                              Strings.skip3Text,
                              Strings.skip3Text2,
                              skip_2,
                              Constant.pagecircleradius.w,
                              Constant.skipPageTextSize3.sp,
                              Constant.skipPageTextSize4.w,
                              landscap)
                        ],
                      )
                    : PageView(
                        // physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: (index) {
                          setState(() {
                            index_ = index;

                            if (index >= 3 && index != 0) {
                              lastPage = true;
                            } else {
                              lastPage = false;
                            }
                          });
                        },
                        controller: pageController,
                        children: [
                          myScaffold1(
                            sizeHeight,
                            sizeWidth,
                            context,
                            Constant.potraitgradientHiget.w,
                            Constant.potraittutorialPageTextsize.sp,
                            Constant.potraittutorialPageTextsize2.sp,
                            Constant.potraitskipPage1TextSize1.sp,
                            Constant.potraitskipPage1TextSize2.sp,
                            0,
                            AppTheme.skip1BodyColor,
                            AppTheme.skip1BorderColor,
                            "",
                            "",
                            "",
                            0,
                            0,
                            0,
                            false,
                          ),
                          myScaffold1(
                              sizeHeight,
                              sizeWidth,
                              context,
                              Constant.potraitgradientHiget.w,
                              Constant.potraittutorialPageTextsize.sp,
                              Constant.potraittutorialPageTextsize2.sp,
                              Constant.potraitskipPageTextSize1.sp,
                              Constant.potraitskipPageTextSize2.sp,
                              1,
                              AppTheme.skip2BodyColor,
                              AppTheme.skip2BorderColor,
                              Strings.skip1Text,
                              Strings.skip1Text2,
                              skip_1,
                              Constant.potraitpagecircleradius.h,
                              Constant.potraitskipPageTextSize3.sp,
                              Constant.potraitskipPageTextSize4.sp,
                              false),
                          myScaffold1(
                              sizeHeight,
                              sizeWidth,
                              context,
                              Constant.potraitgradientHiget.w,
                              Constant.potraittutorialPageTextsize.sp,
                              Constant.potraittutorialPageTextsize2.sp,
                              Constant.potraitskipPageTextSize1.sp,
                              Constant.potraitskipPageTextSize2.sp,
                              1,
                              AppTheme.skip3BodyColor,
                              AppTheme.skip3BorderColor,
                              Strings.skip2Text,
                              Strings.skip2Text2,
                              skip_3,
                              Constant.potraitpagecircleradius.h,
                              Constant.potraitskipPageTextSize3.sp,
                              Constant.potraitskipPageTextSize4.sp,
                              false),
                          myScaffold1(
                              sizeHeight,
                              sizeWidth,
                              context,
                              Constant.potraitgradientHiget.w,
                              Constant.potraittutorialPageTextsize.sp,
                              Constant.potraittutorialPageTextsize2.sp,
                              Constant.potraitskipPageTextSize1.sp,
                              Constant.potraitskipPageTextSize2.sp,
                              1,
                              AppTheme.skip4BodyColor,
                              AppTheme.skip4BorderColor,
                              Strings.skip3Text,
                              Strings.skip3Text2,
                              skip_2,
                              Constant.potraitpagecircleradius.h,
                              Constant.potraitskipPageTextSize3.sp,
                              Constant.potraitskipPageTextSize4.sp,
                              false),
                        ],
                      ),
                Padding(
                  padding: const EdgeInsets.all(Constant.PEDDING_EIGHT),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.all(Constant.PEDDING_TWENTY),
                      child: SmoothPageIndicator(
                        effect: ScrollingDotsEffect(
                            spacing: sizeWidth * Constant.spacing,
                            dotHeight: sizeWidth * Constant.dotheight,
                            dotWidth: sizeWidth * Constant.dotwidth,
                            radius: sizeWidth * Constant.dottedradius,
                            dotColor: Colors.white54,
                            activeDotColor: AppTheme.colorWhite),
                        controller: pageController,
                        count: 4,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment:
                landscap ? Alignment.bottomRight : Alignment.bottomCenter,
            child: Container(
                margin: EdgeInsets.all(padding),
                height: nextHight,
                width: nextwidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Constant.RADIUS_30),
                    border: Border.all(
                        color: AppTheme.colorWhite, width: borderwidth)),
                child: InkWell(
                    onTap: () {
                      if (index_ >= 3) {
                        getStorage.write('FirstUser', false);
                        Get.offAll(Login());
                      } else {
                        pageController.nextPage(
                            duration: const Duration(microseconds: 200),
                            curve: Curves.easeIn);
                      }
                    },
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          index_ >= 3
                              ? Text(
                                  Strings.finish,
                                  style: TextStyle(
                                      color: AppTheme.colorWhite,
                                      fontSize: fontsize,
                                      fontWeight: FontWeight.bold),
                                )
                              : Text(
                                  Strings.next,
                                  style: TextStyle(
                                      color: AppTheme.colorWhite,
                                      fontSize: fontsize,
                                      fontWeight: FontWeight.bold),
                                ),
                          Icon(
                            Icons.navigate_next_rounded,
                            color: AppTheme.colorWhite,
                            size: iconsize,
                          )
                        ],
                      ),
                    ))),
          ),
        ]),
      );
    });
  }
}
