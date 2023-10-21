import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:tims/pages/Login/Login_Page.dart';
import 'package:tims/pages/Login/model/response/LoginRequestResponse.dart';
import 'package:tims/pages/Training_Matrix_Screen/MatrixController.dart';

import 'package:tims/theme/app_theme.dart';
import 'package:tims/util/constant.dart';
import 'package:tims/util/resources.dart';

class MatrixScreen extends StatefulWidget {
  const MatrixScreen({super.key});

  @override
  State<MatrixScreen> createState() => MatrixScreenState();
}

class MatrixScreenState extends State<MatrixScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabcontroller;
  @override
  initState() {
    tabcontroller = TabController(length: 3, vsync: this);
    super.initState();
  }

  List<LoginRequestResponse> data = Get.arguments;

  String shortname() {
    List<String> sublist = data[0].data!.firstName.toString().split(' ');
    String sortname;
    sortname = sublist[0].characters.first.toString() +
        sublist[1].characters.first.toString();
    return sortname;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatrixListController>(builder: (matrixController) {
      return Sizer(
        builder: (context, orientation, dtype) {
          double mediahight = MediaQuery.of(context).size.height;
          double mediawidth = MediaQuery.of(context).size.width;
          bool landscap = orientation == Orientation.landscape;

          return DefaultTabController(
            length: 3,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
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
                        Container(
                          height: landscap
                              ? mediawidth -
                                  (mediawidth / Constant.ladscapappbarHight)
                              : mediahight -
                                  (mediahight / Constant.potraitappbarHight),
                          width: mediawidth,
                          color: AppTheme.colorWhite,
                        )
                      ],
                    ),
                  ),
                ),
                Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                      leading: Builder(builder: (BuildContext context) {
                        return IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: const Icon(
                            Icons.menu,
                            size: Constant.menuIconsize,
                          ),
                        );
                      }),
                      backgroundColor: AppTheme.skip1BorderColor,
                      elevation: 0,
                      title: matrixController.convert
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: Constant.listPedding,
                                  right: Constant.listPedding),
                              child: SizedBox(
                                height: landscap
                                    ? Constant.landscapsearchBarHeight.w
                                    : Constant.potraitsearchBarHeight.h,
                                width: landscap
                                    ? Constant.landscapsearchBarwidth.w
                                    : Constant.potraitsearchBarwidth.h,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: AppTheme.colorWhite)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: AppTheme.colorWhite)),
                                      label: const Text(
                                        Constant.search,
                                        style: TextStyle(color: Colors.white54),
                                      ),
                                      prefixIcon: const Icon(Icons.search,
                                          color: AppTheme.colorWhite),
                                      suffixIcon: InkWell(
                                        onTap: () {
                                          setState(() {
                                            matrixController.convert =
                                                !matrixController.convert;
                                          });
                                        },
                                        child: const Icon(
                                          Icons.close,
                                          color: AppTheme.colorWhite,
                                        ),
                                      )),
                                ),
                              ),
                            )
                          : const Text(
                              Constant.AppBarTitle,
                              style:
                                  TextStyle(fontSize: Constant.appbartextSize),
                            ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                matrixController.convert =
                                    !matrixController.convert;
                              });
                            },
                            child: matrixController.convert
                                ? const Text("")
                                : const Icon(
                                    Icons.search,
                                    size: Constant.searchIconSize,
                                  ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: InkWell(
                            onTap: () {},
                            child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: Constant.refreshRadius,
                                child: Icon(
                                  Icons.refresh,
                                  size: Constant.refereshIconSize,
                                )),
                          ),
                        )
                      ],
                    ),
                    drawer: Drawer(
                      width: landscap
                          ? mediawidth * Constant.ladscapDrawerHight
                          : mediawidth * Constant.potraitDrawerHight,
                      child: Column(
                        children: [
                          Container(
                            height: landscap
                                ? Constant.landscapdrawerWidget1height.w
                                : Constant.potraitdrawerWidget1height.h,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                  AppTheme.gradientColor,
                                  AppTheme.gradientColor2,
                                  AppTheme.gradientColor3
                                ])),
                            width: mediawidth,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: Constant.sizedBox4,
                                ),
                                CircleAvatar(
                                  radius: landscap
                                      ? Constant.landscapusercircleRadius.w
                                      : Constant.usercircleRadius.h,
                                  backgroundColor: AppTheme.colorWhite,
                                  child: Text(
                                    shortname(),
                                    style: TextStyle(
                                        color: AppTheme.colorx,
                                        fontWeight: FontWeight.bold,
                                        fontSize: landscap
                                            ? Constant.LandscapusernameSize.sp
                                            : Constant.usernameSize.sp),
                                  ),
                                ),
                                const SizedBox(
                                  height: Constant.sizedBox4,
                                ),
                                Text(
                                  "${data[0].data!.firstName}",
                                  style: TextStyle(
                                      fontSize: landscap
                                          ? Constant.landscapname.sp
                                          : Constant.potraitscapname.sp,
                                      color: AppTheme.colorWhite,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: Constant.sizedBox7,
                                ),
                                Text(
                                  data[0].data!.roleName.toString(),
                                  style: TextStyle(
                                      fontSize: landscap
                                          ? Constant.landscapRollText.sp
                                          : Constant.potraitRollText.sp,
                                      color: AppTheme.colorWhite,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            margin: const EdgeInsets.all(5),
                            child: Column(
                              children: [
                                ListTile(
                                  selected: true,
                                  selectedColor: AppTheme.tileContainerColor,
                                  selectedTileColor: AppTheme.tileContainerColor
                                      .withOpacity(0.2),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          Constant.RADIUS_30)),
                                  tileColor: AppTheme.tileColor,
                                  leading: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                      height: Constant.navbarIconHight,
                                      width: Constant.navbarIconWidth,
                                      child: SvgPicture.asset(
                                        homeNav,
                                        fit: BoxFit.contain,
                                        color: AppTheme.tileContainerColor,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    Constant.AppBarTitle,
                                    style: TextStyle(
                                        color: AppTheme.texttilecolor),
                                  ),
                                  onTap: () {
                                    Get.back();
                                    Get.offAll(const MatrixScreen());
                                  },
                                ),
                                const SizedBox(
                                  height: Constant.sizedBox5,
                                ),
                                ListTile(
                                  selected: matrixController.selected,
                                  splashColor: AppTheme.tileContainerColor,
                                  selectedColor: AppTheme.tileContainerColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          Constant.RADIUS_30)),
                                  leading: const Padding(
                                    padding:
                                        EdgeInsets.all(Constant.PEDDING_TEN),
                                    child: Icon(
                                      Icons.power_settings_new_rounded,
                                      size: 30,
                                    ),
                                  ),
                                  title: const Text(
                                    Constant.Logout,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () {
                                    matrixController.selected =
                                        !matrixController.selected;
                                    Get.off(const Login());
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    body: Column(
                      children: [
                        const SizedBox(
                          height: Constant.sizedBox7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 15,
                              height: Constant.tabbarHeight,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2),
                                  borderRadius:
                                      BorderRadius.circular(Constant.RADIUS_6)),
                              child: TabBar(
                                  indicator: BoxDecoration(
                                      color: AppTheme.skip1BorderColor),
                                  labelStyle: TextStyle(
                                      fontSize: landscap
                                          ? Constant.landscaptabbarlabelSize.w
                                          : Constant.potraittabbarlabelSize.h),
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  controller: tabcontroller,
                                  labelPadding: const EdgeInsets.symmetric(
                                      horizontal: 2.0),
                                  tabs: [
                                    Tab(
                                        text:
                                            'Pending (${matrixController.pendingList[0].data!.pendingTrainings})'),
                                    Tab(
                                        text:
                                            '__  Completed (${matrixController.pendingList[0].data!.completedTrainings})'),
                                    Tab(
                                        text:
                                            '__ All(${matrixController.pendingList[0].data!.totalTrainings})'),
                                  ]),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: Constant.sizedBox7,
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.all(Constant.PEDDING_FOUR),
                            child: TabBarView(
                                controller: tabcontroller,
                                children: [
                                  // list(
                                  //     listLegth: matrixController
                                  //         .pendingList[0]
                                  //         .data!
                                  //         .trainingList!
                                  //         .length,
                                  //     trainingList: matrixController
                                  //         .pendingList[0]
                                  //         .data!
                                  //         .trainingList),
                                  // list(
                                  //     listLegth: matrixController
                                  //         .completedList[0]
                                  //         .data!
                                  //         .trainingList!
                                  //         .length,
                                  //     trainingList: matrixController
                                  //         .completedList[0]
                                  //         .data!
                                  //         .trainingList),
                                  // list(
                                  //     listLegth: matrixController
                                  //         .allList[0]
                                  //         .data!
                                  //         .trainingList!
                                  //         .length,
                                  //     trainingList: matrixController
                                  //         .allList[0].data!.trainingList),
                                ]),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          );
        },
      );
    });
  }

  // Widget list(
  //     {required int listLegth, required List<TrainingList>? trainingList}) {
  //   double mediawidth = MediaQuery.of(context).size.width;
  //   return Container(
  //     width: mediawidth,
  //     color: Colors.transparent,
  //     child: ListView.builder(
  //       itemBuilder: (context, index) {
  //         return SizerUtil.deviceType == DeviceType.tablet
  //             ? trainingMatrixList(
  //                 context: context,
  //                 index: index,
  //                 title: trainingList[index].title.toString(),
  //                 trainignumber: trainingList[index].trainingNo.toString())
  //             : trainingMatrixList(
  //                 context: context,
  //                 index: index,
  //                 title: trainingList[index].title.toString(),
  //                 trainignumber: trainingList[index].trainingNo.toString());
  //       },
  //       itemCount: trainingList!.length,
  //     ),
  //   );
  // }
}
