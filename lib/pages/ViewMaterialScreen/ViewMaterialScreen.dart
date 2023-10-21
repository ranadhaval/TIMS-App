import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tims/Controller/MatrixController.dart';

import 'package:tims/util/hex_code.dart';

import '../../theme/app_theme.dart';
import '../../util/constant.dart';
import '../../util/resources.dart';

class ViewMaterialScreen extends StatefulWidget {
  const ViewMaterialScreen({super.key});

  @override
  State<ViewMaterialScreen> createState() => _ViewMaterialScreenState();
}

class _ViewMaterialScreenState extends State<ViewMaterialScreen> {
  int index_ = 0;
  PageController pageController = PageController();
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  final controller = Get.put(MatrixController());

  @override
  Widget build(BuildContext context) {
    double mediaHight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;

// do letter

    return GetBuilder<MatrixController>(builder: (controller) {
      return controller.mYlist.isEmpty
          ? Scaffold(
              backgroundColor: AppTheme.loginPagePrimaryColor,
              // body: const Center(
              //   child: ProgressBar(
              //     isLoader: true,
              //   ),
              // ),
            )
          : Stack(
              children: [
                Container(
                  width: sizeWidth,
                  decoration: BoxDecoration(
                    color: AppTheme.AppbarColor,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: mediaHight / 5.5,
                          width: sizeWidth,
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
                Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                      title: Text("View Material"),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    body: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                            child: PageView(
                          controller: pageController,
                          onPageChanged: (index) {
                            setState(() {
                              index_ = index;
                            });
                          },
                          children: [
                            xZero("All Section"),
                            x(controller.mYlist[0].data[0].sectionName),
                            x(controller.mYlist[0].data[1].sectionName),
                          ],
                        )),
                      ],
                    )),
              ],
            );
    });
  }

  Widget x(String sectionname) {
    double mediaHight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: mediaHight / 5,
          width: sizeWidth / 1.7,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                AppTheme.gradientColor.withOpacity(0.7),
                AppTheme.gradientColor2.withOpacity(0.7),
                AppTheme.gradientColor3.withOpacity(0.7),
              ]),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              sectionname,
              style: const TextStyle(color: AppTheme.colorWhite),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: SmoothPageIndicator(
              effect: ScrollingDotsEffect(
                  spacing: sizeWidth * Constant.spacing,
                  dotHeight: sizeWidth * Constant.dotheight,
                  dotWidth: sizeWidth * Constant.dotwidth,
                  radius: sizeWidth * Constant.dottedradius,
                  dotColor: Colors.white54,
                  activeDotColor: AppTheme.colorWhite),
              controller: pageController,
              count: controller.mYlist[0].data.length + 1,
            ),
          ),
        ),
        y()
      ],
    );
  }

  Widget xZero(String sectionname) {
    double mediaHight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: mediaHight / 5,
          width: sizeWidth / 1.7,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                AppTheme.gradientColor.withOpacity(0.7),
                AppTheme.gradientColor2.withOpacity(0.7),
                AppTheme.gradientColor3.withOpacity(0.7),
              ]),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              sectionname,
              style: const TextStyle(color: AppTheme.colorWhite),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: SmoothPageIndicator(
              effect: ScrollingDotsEffect(
                  spacing: sizeWidth * Constant.spacing,
                  dotHeight: sizeWidth * Constant.dotheight,
                  dotWidth: sizeWidth * Constant.dotwidth,
                  radius: sizeWidth * Constant.dottedradius,
                  dotColor: Colors.white54,
                  activeDotColor: AppTheme.colorWhite),
              controller: pageController,
              count: controller.mYlist[0].data.length + 1,
            ),
          ),
        ),
        y()
      ],
    );
  }

  Widget y() {
    return Expanded(
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Container(
          color: Colors.transparent,
          height: 250,
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      // child: ExpansionTile1(
                      //     context, title[index % title.length], index + 1),
                      ),
                );
              }),
        ),
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
