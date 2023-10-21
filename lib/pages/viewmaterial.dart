import 'package:get/get.dart';

import 'package:get/get_core/src/get_main.dart';

import 'package:sizer/sizer.dart';
import 'package:tims/pages/ViewMaterialScreen/ExpansionTiel.dart';
import 'package:tims/routes/app_routes.dart';
import 'package:tims/theme/app_theme.dart';
import 'package:tims/util/constant.dart';
import 'package:tims/util/hex_code.dart';

import 'package:flutter/material.dart';
import 'package:tims/util/strings.dart';
import 'package:tims/widgets/PopUp/custom_popup.dart';
import 'package:tims/widgets/bottom_card.dart';

import '../routes/app_routes.dart';
import '../util/resources.dart';

import '../util/strings.dart';
import '../widgets/bottom_card.dart';
import '../widgets/overlapped_carousel.dart';
import 'ViewMaterialScreen/WidgetsForView.dart';

class ViewMaterial extends StatefulWidget {
  const ViewMaterial({super.key});

  @override
  State<ViewMaterial> createState() => _ViewMaterialState();
}

class _ViewMaterialState extends State<ViewMaterial> {
  late double height;
  late double width;
  int newf = 3;
  @override
  Widget build(BuildContext context) {
    bool isTablet = SizerUtil.deviceType == DeviceType.tablet;
    // final evaluationcontroller = Get.put(EvaluationController());

    return OrientationBuilder(builder: (context, orientation) {
      bool isPortrait = orientation == Orientation.portrait;
      double mediahight = MediaQuery.of(context).size.height;
      double mediawidth = MediaQuery.of(context).size.width;
      bool landscap = orientation == Orientation.landscape;

      if (isPortrait) {
        height = 100.h;
        width = 100.w;
      } else {
        height = 100.w;
        width = 100.h;
      }
      return Stack(children: [
        Container(
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
              Expanded(
                  child: Container(
                color: HexColor("#e2e6e8"),
              ))
            ],
          ),
        ),

        // BasicBackground(),
        Scaffold(
          extendBody: true,
          backgroundColor: AppTheme.colorTransparent,
          appBar: AppBar(
            title: Text('View Material'),
            backgroundColor: AppTheme.colorTransparent,
            elevation: 0,
            toolbarHeight: isTablet ? height * .1 : null,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: isPortrait ? mediahight / 3.2 : 70.w,
                    width: isPortrait ? 80.w : 90.w,
                    child: Center(
                      child: OverlappedCarousel(
                        widgets: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(
                                    colors: [
                                      AppTheme.overlapstartColor,
                                      AppTheme.overlapendColor
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Default',
                                  style: TextStyle(
                                      color: AppTheme.colorWhite,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CircleAvatar(
                                  backgroundColor: AppTheme.colorWhite,
                                  child: Text("(1)"),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(
                                    colors: [
                                      AppTheme.overlapstartColor,
                                      AppTheme.overlapendColor
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Content',
                                  style: TextStyle(
                                      color: AppTheme.colorWhite,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CircleAvatar(
                                  backgroundColor: AppTheme.colorWhite,
                                  child: Text("(2)"),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(
                                    colors: [
                                      AppTheme.overlapstartColor,
                                      AppTheme.overlapendColor
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Sop',
                                  style: TextStyle(
                                      color: AppTheme.colorWhite,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CircleAvatar(
                                  backgroundColor: AppTheme.colorWhite,
                                  child: Text("(3)"),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(
                                    colors: [
                                      AppTheme.overlapstartColor,
                                      AppTheme.overlapendColor
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'All',
                                  style: TextStyle(
                                      color: AppTheme.colorWhite,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(
                                    colors: [
                                      AppTheme.overlapstartColor,
                                      AppTheme.overlapendColor
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Changes ',
                                  style: TextStyle(
                                      color: AppTheme.colorWhite,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CircleAvatar(
                                  backgroundColor: AppTheme.colorWhite,
                                  child: Text("(4)"),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(
                                    colors: [
                                      AppTheme.overlapstartColor,
                                      AppTheme.overlapendColor
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Filled Attechment ',
                                  style: TextStyle(
                                      color: AppTheme.colorWhite,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CircleAvatar(
                                  backgroundColor: AppTheme.colorWhite,
                                  child: Text("(5)"),
                                )
                              ],
                            ),
                          )
                        ], //List of widgets
                        currentIndex: 3,
                        onClicked: (index) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("You clicked at $index"),
                            ),
                          );
                        },
                        onChanged: (index) {
                          setState(() {
                            newf = index.toInt();
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    child: Builder(builder: (context) {
                      switch (newf) {
                        case 0:
                          return bodyOfExpansionTile(context, pdfIcon, () {
                            Get.to(PdfView());
                          }, "1A00AB001_3.0.pdf");
                        case 1:
                          return bodyOfExpansionTile(context, pdfIcon, () {
                            Get.to(PdfView());
                          }, "1A00AB001_3.0.pdf");

                        case 3:
                          return y();
                        case 2:
                          return bodyOfExpansionTile(context, pdfIcon, () {
                            Get.to(PdfView());
                          }, "1A00AB001_3.0.pdf");
                        case 4:
                          return bodyOfExpansionTile(context, pdfIcon, () {
                            Get.to(PdfView());
                          }, "1A00AB001_3.0.pdf");
                        case 5:
                          return bodyOfExpansionTile(context, pdfIcon, () {
                            Get.to(PdfView());
                          }, "1A00AB001_3.0.pdf");
                        default:
                          return SizedBox(
                            height: 0,
                          );
                      }
                    }),
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
                    // callPopupApi();
                    Get.toNamed(AppRoutes.DASHBOARD);
                  },
                ));
              },
              title: Strings.finishtraining,
              Width: width,
              height: height,
              isTablet: isTablet,
              isBlue: false,
            )),
      ]);
    });
  }

  Widget y() {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Container(
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).size.height / 2.2,
        child: ListView.builder(
            // physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: ExpansionTile1(
                      context, title[index % title.length], index + 1),
                ),
              );
            }),
      ),
    );
  }

  List<String> title = [
    "Default",
    "Content",
    "SOP",
    "Changes",
    "Filled Attachments"
  ];
}
