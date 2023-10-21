import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tims/pages/Tutorial_Screen/on_boarding_page.dart';
import 'package:tims/pages/splash/splash_controller.dart';
import 'package:tims/theme/app_theme.dart';
import 'package:tims/util/constant.dart';
import 'package:tims/util/resources.dart';
import 'package:tims/widgets/no_appbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splshController = Get.put(SplashController());

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      splshController.getUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(screenBG),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Scaffold(
        backgroundColor: AppTheme.colorTransparent,
        appBar: NoAppBar(),
        body: _body(),
      )
    ]);
  }

  _body() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: Constant.SCREEN_PADDING * 1.5,
              ),
              child: Image.asset(
                logoIcon2,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
