import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tims/pages/Login/Provider/LoginProvider.dart';
import 'package:tims/pages/Login/model/request/LoginRequest.dart';
import 'package:tims/pages/Login/model/request/OtherLoginModel.dart';
import 'package:tims/pages/Login/model/response/LoginRequestResponse.dart';
import 'package:tims/pages/Login/model/response/OtherLoginInfoResponse.dart';
import 'package:tims/routes/app_routes.dart';
import 'package:tims/webservices/response_model.dart';
import 'package:tims/widgets/snackbar.dart';

class CheckLoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String appName = "";
  String packageName = "";
  String version = "";
  String buildNumber = "";
  String deviceId = "";
  RxBool circular = false.obs;
  RxBool f = false.obs;
  GetStorage storage = GetStorage();

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  @override
  void onInit() {
    super.onInit();
    packageInfoGetter();
  }

  Future<void> packageInfoGetter() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    AndroidDeviceInfo info = await deviceInfo.androidInfo;
    IosDeviceInfo iosinfo = await deviceInfo.iosInfo;
    appName = packageInfo.appName;
    packageName = packageInfo.packageName;
    version = packageInfo.buildNumber;
    buildNumber = packageInfo.buildNumber;
    if (Platform.isAndroid) {
      deviceId = info.id;
    }
    if (Platform.isIOS) {
      deviceId = iosinfo.identifierForVendor!;
    }
    update();
  }

  void apicall(context) {
    circular(true);
    update();

    OtherLoginCheckModel loginRequestModel = OtherLoginCheckModel(
        deviceId: deviceId,
        employeeNo: usernameController.text,
        password: passwordController.text);
    update();

    CheckLoginProvider().othercheckLoginProvider(
        otherLoginCheckModel: loginRequestModel,
        onSuccess: (ResponseModel responseModel) {
          if (responseModel.statusCode == 200) {
            OtherLoginInfoResponse response =
                OtherLoginInfoResponse.fromJson(responseModel.result);

            if (response != null && response.success == true) {
              if (response.data != null) {
                if (response.data!.otherLogin != null &&
                    response.data!.otherLogin == false) {
                  loginRequestApi();
                  snackbar('you can log in', Colors.green);
                } else if (response.data!.otherLogin != null &&
                    response.data!.otherLogin == true) {
                  alert(
                    context,
                    response.data!.otherLoginIpAddress.toString(),
                    response.data!.platform,
                  );
                } else {
                  circular(false);
                  update();

                  snackbar(
                      'we dont get any data from thos user id', Colors.red);
                }
              } else {
                circular(false);
                update();
                snackbar('We not get Any data1', Colors.red);
              }
            } else {
              circular(false);
              update();
              snackbar('We not get Any data', Colors.red);
            }
          } else {
            circular(false);
            update();
            snackbar('We not get Any data', Colors.red);
          }
        });
  }

  void loginRequestApi() {
    print('object');
    LoginRequest loginRequest = LoginRequest(
        employeeNo: usernameController.text,
        password: passwordController.text,
        deviceId: 'f1fdc08a21267991',
        deviceType: 'A');

    CheckLoginProvider().loginRequestProvider(
        loginRequest: loginRequest,
        onSuccess: (ResponseModel response) {
          if (response.statusCode == 200) {
            LoginRequestResponse loginRequestResponse =
                LoginRequestResponse.fromJson(response.result);

            if (loginRequestResponse.success == true &&
                loginRequestResponse.data != null) {
              storage.write('ListMatrix', loginRequestResponse);
              Get.offAllNamed(AppRoutes.DASHBOARD,
                  arguments: [loginRequestResponse]);
            } else {
              snackbar('We can\'t redirect', Colors.red);
            }
          } else {
            snackbar('We not get Any data', Colors.red);
          }
        });
  }

  alert(BuildContext context, String ip, platform) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          contentPadding: EdgeInsets.all(15),
          contentTextStyle: TextStyle(color: Colors.black),
          title: const Text(
            'Login Failed',
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 25),
            textAlign: TextAlign.center,
          ),
          content: Text(
            'Someone Already Login With '
            '$platform '
            'Ip : $ip '
            '\n'
            'Are You Really Want To Login ?',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, height: 1.5),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                loginRequestApi();
                circular(false);
                update();

                Get.back();
              },
            ),
            ElevatedButton(
              child: const Text(
                'No',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                usernameController.clear();
                passwordController.clear();
                circular(false);

                update();
                Get.back();
              },
            )
          ],
        );
      },
    );
  }
}
