import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:tims/pages/Login/loginController.dart';

import 'package:tims/theme/app_theme.dart';
import 'package:tims/util/constant.dart';
import 'package:tims/util/strings.dart';

import '../../util/resources.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  // final loginController = Get.put(CheckLoginController());
  final key = GlobalKey<FormState>();
  bool error = false;
  RxBool? checkLogeedin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: GetBuilder<CheckLoginController>(
        init: CheckLoginController(),
        builder: (controller) {
          return Sizer(builder: (context, orientation, deviceType) {
            double mediaHight = MediaQuery.of(context).size.height;
            double mediaWidth = MediaQuery.of(context).size.width;
            return orientation == Orientation.landscape
                ? scaff(
                    logoiconHighet: Constant.logoiconHighet.h,
                    logoiconwidth: Constant.logoiconwidth.w,
                    logoicon2Highet: Constant.logoicon2Highet.h,
                    logoicon2width: MediaQuery.of(context).size.width -
                        Constant.logoicon2width,
                    size: Constant.size.sp,
                    size_1: Constant.size_1.sp,
                    padding: Constant.padding,
                    boxwidth: mediaWidth - Constant.boxwidth,
                    textheight: mediaHight * Constant.textheight,
                    textsize: Constant.textsize.sp,
                    buttonhighet: mediaHight * Constant.buttonhighet,
                    buttonwidth: mediaWidth - Constant.buttonwidth,
                    logoTop: -Constant.logoTop.w,
                    logoheight: Constant.logoheight,
                    logowidth: Constant.logowidth,
                    size1: Constant.size1.sp,
                    context: context,
                    checkLoginController: controller)
                : scaff(
                    logoiconHighet: Constant.logoiconHighet2.h,
                    logoiconwidth: MediaQuery.of(context).size.width -
                        Constant.logoiconwidth2,
                    logoicon2Highet: Constant.logoicon2Highet2.h,
                    logoicon2width: MediaQuery.of(context).size.width -
                        Constant.logoicon2width2,
                    size: Constant.size2.sp,
                    size_1: Constant.size_1_2.sp,
                    padding: Constant.padding2,
                    boxwidth: mediaWidth - Constant.boxwidth2,
                    textheight: mediaHight * Constant.textheight2,
                    textsize: Constant.textsize2.sp,
                    buttonhighet: mediaHight * Constant.buttonhighet2,
                    buttonwidth: mediaWidth - Constant.buttonwidth2,
                    logoTop: -Constant.logoTop2.w,
                    logoheight: Constant.logoheight2.w,
                    logowidth: Constant.logowidth2.w,
                    size1: Constant.size12.sp,
                    checkLoginController: controller,
                    context: context,
                  );
          });
        },
      ),
    );
  }

  Widget scaff({
    required double logoiconHighet,
    required double logoiconwidth,
    required double logoicon2Highet,
    required double logoicon2width,
    required double size,
    required size_1,
    required double padding,
    required double boxwidth,
    required double textheight,
    required double textsize,
    required double buttonhighet,
    required double buttonwidth,
    required double logoTop,
    required double logoheight,
    required double logowidth,
    required double size1,
    required CheckLoginController checkLoginController,
    context,
  }) {
    return Scaffold(
        backgroundColor: AppTheme.loginPagePrimaryColor,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(screenBG), fit: BoxFit.cover),
              color: AppTheme.colorWhite,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: Constant.sizedBox5,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage(logoIcon))),
                    height: logoiconHighet,
                    width: logoiconwidth,
                  ),
                  const SizedBox(height: Constant.sizedBox2),
                  Stack(
                    children: [
                      stack(
                        padding: padding,
                        width: boxwidth,
                        textfieldhight: textheight,
                        textsize: textsize,
                        buttonhight: buttonhighet,
                        buttonwidth: buttonwidth,
                        logoTop: logoTop,
                        logohight: logoheight,
                        logowidth: logowidth,
                        size_1: size1,
                        context: context,
                        deviceid: checkLoginController.deviceId,
                        checkLoginController: checkLoginController,
                      ),
                    ],
                  ),
                  const SizedBox(height: Constant.sizedBox3),
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage(logoIcon2))),
                    height: logoicon2Highet,
                    width: logoicon2width,
                  ),
                  const SizedBox(height: Constant.sizedBox4),
                  Text(
                    "V ${checkLoginController.version}.0.0",
                    style:
                        TextStyle(color: AppTheme.colorWhite, fontSize: size),
                  ),
                  const SizedBox(height: Constant.sizedBox5),
                  Text(
                    Strings.text_1,
                    style:
                        TextStyle(color: AppTheme.colorWhite, fontSize: size_1),
                  ),
                  const SizedBox(height: Constant.sizedBox6),
                  Padding(
                    padding: const EdgeInsets.all(Constant.PEDDING_EIGHT),
                    child: Text(
                      Strings.text_2,
                      style: TextStyle(
                          color: AppTheme.colorWhite, fontSize: size_1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget stack(
      {required double padding,
      required double width,
      required double textfieldhight,
      required double textsize,
      required double buttonhight,
      required double buttonwidth,
      required double logoTop,
      required double logohight,
      required double logowidth,
      required double size_1,
      required CheckLoginController checkLoginController,
      required String deviceid,
      context}) {
    return Stack(clipBehavior: Clip.none, children: [
      Form(
        key: key,
        child: Container(
          margin: EdgeInsets.only(left: padding, right: padding),
          decoration: BoxDecoration(
              color: AppTheme.colorWhite,
              borderRadius: BorderRadius.circular(11)),
          child: Column(
            children: [
              const SizedBox(
                height: Constant.sizedBox3,
              ),
              nameOfTextfield(textsize, Strings.username),
              // textfeildusername(),
              textfield(textfieldhight, false,
                  checkLoginController.usernameController, Strings.username),
              nameOfTextfield(textsize, Strings.password),
              const SizedBox(
                height: Constant.sizedBox7,
              ),
              textfield(textfieldhight, false,
                  checkLoginController.passwordController, Strings.password),
              const SizedBox(
                height: Constant.sizedBox3,
              ),
              loginButton(
                  buttonhight,
                  textsize,
                  checkLoginController.usernameController.text,
                  checkLoginController.passwordController.text,
                  deviceid,
                  context,
                  checkLoginController: checkLoginController),
              const SizedBox(
                height: Constant.sizedBox2,
              ),
            ],
          ),
        ),
      ),
      Positioned.fill(
        top: logoTop,
        child: Align(
          alignment: Alignment.topCenter,
          child: Card(
            elevation: 5,
            color: AppTheme.logoCircle,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(120),
                borderSide:
                    const BorderSide(color: AppTheme.colorWhite, width: 2.3)),
            child: Container(
              padding: const EdgeInsets.all(25),
              height: logohight,
              width: logowidth,
              decoration: BoxDecoration(
                color: AppTheme.logoCircle,
                borderRadius: BorderRadius.circular(120),
              ),
              child: const Image(
                image: AssetImage(appIcon),
              ),
            ),
          ),
        ),
      ),
    ]);
  }

  Widget nameOfTextfield(double textsize, String fieldName) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            fieldName,
            style: TextStyle(fontSize: textsize),
          ),
        )
      ],
    );
  }

  Widget textfield(double textfieldhight, bool obsecureText,
      TextEditingController controller, String hintText) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          controller: controller,
          maxLength: 15,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value != null && value.isNotEmpty) {
              return null;
            } else {
              return Strings.validatemessage;
            }
          },
          style: const TextStyle(fontSize: Constant.textfieldtextSize),
          textAlign: TextAlign.justify,
          obscureText: obsecureText,
          decoration: InputDecoration(
            counter: const Offstage(),
            contentPadding: const EdgeInsets.all(5),
            prefix: const SizedBox(
              width: Constant.sizedBox5,
            ),
            filled: true,
            hintText: 'Enter $hintText',
            fillColor: AppTheme.textfeildColor,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.textfeildColor),
                borderRadius:
                    BorderRadius.circular((textfieldhight * 1.4) / 2)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius:
                    BorderRadius.circular((textfieldhight * 1.4) / 2)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.textfeildColor),
                borderRadius:
                    BorderRadius.circular((textfieldhight * 1.4) / 2)),
          ),
        ),
      ),
    );
  }

  Widget loginButton(double buttonhight, textsize, String username,
      String password, deviceid, context,
      {required CheckLoginController checkLoginController}) {
    call() {
      if (key.currentState!.validate()) {
        try {
          checkLoginController.apicall(context);
          print(":fsf");
        } catch (e) {
          snackbar('$e');
        }
      } else {
        snackbar('Something Went Wrong');
      }
    }

    return InkWell(
      onTap: () async {
        checkLoginController.circular.isTrue ? null : call();
      },
      child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              gradient: LinearGradient(colors: [
                AppTheme.loginboxColor1,
                AppTheme.loginboxColor2,
                AppTheme.loginboxColor3,
              ]),
              borderRadius: BorderRadius.circular(20)),
          height: buttonhight,
          child: Center(
              child: checkLoginController.circular.isTrue
                  ? Text(
                      'Proccessing...',
                      style: TextStyle(
                          fontSize: textsize,
                          letterSpacing: 1,
                          color: Colors.white54),
                    )
                  : Text(
                      Constant.LogIn,
                      style: TextStyle(
                          fontSize: textsize,
                          letterSpacing: 1,
                          color: Colors.white54),
                    ))),
    );
  }

  SnackbarController snackbar(String message) {
    return Get.snackbar(
      "Error",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
    );
  }
}
