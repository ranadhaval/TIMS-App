import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tims/pages/feedback/feedback_controller.dart';
import 'package:tims/routes/app_routes.dart';
import 'package:tims/theme/app_theme.dart';
import 'package:tims/util/constant.dart';
import 'package:tims/util/strings.dart';
import 'package:tims/widgets/basic_background.dart';
import 'package:tims/widgets/bottom_card.dart';
import 'package:tims/widgets/custom_radion_button.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  late double height;
  late double width;
  @override
  Widget build(BuildContext context) {
    bool isTablet = SizerUtil.deviceType == DeviceType.tablet;
    final feedbackcontroller = Get.put(FeedbackController());
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
        init: feedbackcontroller,
        builder: (controller) {
          return Stack(children: [
            BasicBackground(),
            Scaffold(
              extendBody: true,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text(
                  Strings.addfeedback,
                  style: TextStyle(fontSize: AppTheme.appBarTextSize.sp),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                toolbarHeight: isTablet ? height * .1 : null,
                actions: [
                  TextButton(
                      onPressed: () {
                        Get.offAllNamed(AppRoutes.DASHBOARD);
                      },
                      child: Text(
                        Strings.skipupper,
                        style: TextStyle(color: AppTheme.colorWhite),
                      ))
                ],
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: SizedBox(
                    width: width * .95,
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Padding(
                        padding: const EdgeInsets.all(Constant.NORMALPADDING),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0;
                                i < controller.fbList.length;
                                i++) ...[
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        (i + 1).toString() + '.',
                                      ),
                                      Expanded(
                                        child: Text(
                                          controller.fbList[i].question,
                                          softWrap: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                  i < 4
                                      ? Align(
                                          alignment: Alignment.centerLeft,
                                          child: Wrap(
                                            direction: Axis.horizontal,
                                            children: [
                                              MyRadioOption<String>(
                                                value: Strings.strongelyagree,
                                                groupValue: controller
                                                    .formanswer[i].radioAnswer,
                                                text: Strings.strongelyagree,
                                                onChanged: (value) {
                                                  controller.formanswer[i]
                                                          .radioAnswer =
                                                      value.toString();
                                                  controller.update();
                                                },
                                              ),
                                              MyRadioOption<String>(
                                                value: Strings.agree,
                                                groupValue: controller
                                                    .formanswer[i].radioAnswer,
                                                text: Strings.agree,
                                                onChanged: (value) {
                                                  controller.formanswer[i]
                                                          .radioAnswer =
                                                      value.toString();
                                                  controller.update();
                                                },
                                              ),
                                              MyRadioOption<String>(
                                                value: Strings.disagree,
                                                groupValue: controller
                                                    .formanswer[i].radioAnswer,
                                                text: Strings.disagree,
                                                onChanged: (value) {
                                                  controller.formanswer[i]
                                                          .radioAnswer =
                                                      value.toString();
                                                  controller.update();
                                                },
                                              ),
                                              MyRadioOption<String>(
                                                value:
                                                    Strings.strongelyDisagree,
                                                groupValue: controller
                                                    .formanswer[i].radioAnswer,
                                                text: Strings.strongelyDisagree,
                                                onChanged: (value) {
                                                  controller.formanswer[i]
                                                          .radioAnswer =
                                                      value.toString();
                                                  controller.update();
                                                },
                                              ),
                                              MyRadioOption<String>(
                                                value: Strings.notrelavent,
                                                groupValue: controller
                                                    .formanswer[i].radioAnswer,
                                                text: Strings.notrelavent,
                                                onChanged: (value) {
                                                  controller.formanswer[i]
                                                          .radioAnswer =
                                                      value.toString();
                                                  controller.update();
                                                },
                                              )
                                            ],
                                          ),
                                        )
                                      : SizedBox(
                                          height: 5,
                                        ),
                                  TextField(
                                    style: TextStyle(
                                        fontSize: Constant
                                            .TRAININGTRAILINGTEXTSIZE.sp),
                                    onTapOutside: (event) {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    controller: controller.TEControllerList[i],
                                    onChanged: (value) {
                                      controller.formanswer[i].remarks = value;
                                    },
                                    decoration: InputDecoration(
                                      hintText: Strings.writehere,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                    ),
                                    maxLines: 3,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: Constant.NORMALPADDING,
                              )
                            ],
                            SizedBox(
                              height: Constant.FIXED_XTRA_HEIGHT.h,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: Constant.ZERO,
              child: BottomCardWithTwoButton(
                onTap1: () {
                  controller.resetAnswer();
                },
                title1: Strings.clearupper,
                title2: Strings.save,
                onTap2: () {
                  for (int i = 0; i < controller.formanswer.length; i++) {
                    print(controller.formanswer[i].toJson());
                  }
                  Get.offAllNamed(AppRoutes.DASHBOARD);
                },
                controller: controller,
                Width: width,
                height: height,
                isTablet: isTablet,
              ),
            )
          ]);
        },
      );
    });
  }
}
