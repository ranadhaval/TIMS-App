import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tims/pages/Login/Login_Page.dart';
import 'package:tims/util/constant.dart';
import 'package:tims/util/strings.dart';
import '../pages/Training_Matrix_Screen/Training_Matrix.dart';
import '../theme/app_theme.dart';
import '../util/resources.dart';

Widget myScaffold1(
  double mediaHight,
  double mediaWidth,
  context,
  double gradientHiget,
  double textsize,
  double textsize1,
  double textsize2,
  double textsize3,
  int index,
  Color backColor,
  Color bordercolor,
  String text1,
  String text2,
  String image,
  double radius,
  double size1,
  size2,
  bool landscap,
) {
  return Scaffold(
    body: Container(
      height: mediaHight,
      width: mediaWidth,
      decoration: BoxDecoration(
        color: backColor,
      ),
      child: landscap
          ? SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: gradientHiget,
                    width: mediaWidth,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(gradientImage),
                            fit: BoxFit.fill)),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(Constant.PEDDING_38),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () {
                                Get.offAll(const Login());
                              },
                              child: Text(
                                Strings.skip,
                                style: TextStyle(
                                    color: AppTheme.colorWhite,
                                    fontSize: textsize,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ),
                  ),
                  index == 0
                      ? column(
                          Constant.skipPage1CircleTopLeft.w,
                          Constant.skipPage1CircleTopLeft.w,
                          textsize1,
                          textsize2,
                          textsize3,
                          context)
                      : col2(context, text1, text2, bordercolor, image, radius,
                          size1, size2),
                ],
              ),
            )
          : Stack(
              children: [
                Container(
                  height: gradientHiget,
                  width: mediaWidth,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(gradientImage), fit: BoxFit.fill)),
                ),
                Padding(
                  padding: const EdgeInsets.all(Constant.PEDDING_EIGHT),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(Constant.PEDDING_38),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () {
                                Get.offAll(const Login());
                              },
                              child: Text(
                                Strings.skip,
                                style: TextStyle(
                                    color: AppTheme.colorWhite,
                                    fontSize: textsize,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    index == 0
                        ? column(
                            Constant.skipPage1CircleTopLeft.w,
                            Constant.skipPage1CircleTopLeft.w,
                            textsize1,
                            textsize2,
                            textsize3,
                            context)
                        : col2(context, text1, text2, bordercolor, image,
                            radius, size1, size2)
                  ],
                )
              ],
            ),
    ),
  );
}

// for index 123
Column col2(context, String text1, String text2, Color bordercolor,
    String image, double radius, double size1, size2) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      circle2(bordercolor, image, radius),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          text1,
          style: TextStyle(
              fontSize: size1,
              color: AppTheme.colorWhite,
              fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Text(
          textAlign: TextAlign.center,
          text2,
          style: TextStyle(
            height: 1.5,
            fontSize: size2,
            color: AppTheme.colorWhite,
          ),
        ),
      ),
      const SizedBox(
        height: 50,
      ),
    ],
  );
}

// for index1

Column column(
    double top, double left, double textsize1, textsize2, textsize3, context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      circle(top, left),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          Strings.skip1Text,
          style: TextStyle(
              fontSize: textsize1,
              color: AppTheme.colorWhite,
              fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Text(
          textAlign: TextAlign.center,
          Strings.skip1Text2,
          style: TextStyle(
            height: 1.5,
            fontSize: textsize2,
            color: AppTheme.colorWhite,
          ),
        ),
      ),
      const SizedBox(
        height: Constant.sizedBox3,
      ),
      h(Strings.skip1Text3, context, textsize3),
      const SizedBox(
        height: Constant.sizedBox4,
      ),
      h(Strings.skip1Text4, context, textsize3),
      h(Strings.skip1Text5, context, textsize3),
      h(Strings.skip1Text6, context, textsize3),
      h(Strings.skip1Text7, context, textsize3),
      h(Strings.skip1Text8, context, textsize3),
      h(Strings.skip1Text9, context, textsize3),
      const SizedBox(
        height: Constant.sizedBox4,
      ),
    ],
  );
}

// text

Widget h(String m, BuildContext context, double textsize) {
  return Padding(
    padding: const EdgeInsets.only(left: 35, right: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          m,
          textAlign: TextAlign.center,
          style: TextStyle(
            height: 1.5,
            fontSize: textsize,
            color: AppTheme.colorWhite,
          ),
        ),
        const SizedBox(
          height: Constant.sizedBox4,
        ),
      ],
    ),
  );
}

// circle 1

Widget circle(double hight, double width) {
  return Card(
    elevation: 5,
    color: AppTheme.colorWhite,
    shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(120),
        borderSide: BorderSide(color: AppTheme.skip1CircleBorder, width: 3)),
    child: Container(
      padding: const EdgeInsets.all(18),
      height: hight,
      width: width,
      decoration: BoxDecoration(
        color: AppTheme.colorWhite,
        borderRadius: BorderRadius.circular(120),
      ),
      child: const Image(
        image: AssetImage(appIcon),
      ),
    ),
  );
}

// circle 2

Widget circle2(Color bordercolor, String Image, double radius) {
  return Align(
    alignment: Alignment.center,
    child: Card(
      elevation: 5,
      color: AppTheme.colorWhite,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1000),
          borderSide: BorderSide(color: bordercolor, width: 3)),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(Image),
      ),
    ),
  );
}
