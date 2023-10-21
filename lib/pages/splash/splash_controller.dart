import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:tims/pages/Login/Login_Page.dart';

import 'package:tims/pages/Login/loginController.dart';

import 'package:tims/routes/app_routes.dart';
import 'package:tims/util/constant.dart';
import '../../webservices/api_request.dart';
import '../../webservices/base_response.dart';
import '../../webservices/url_constants.dart';
import '../Tutorial_Screen/on_boarding_page.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    fetchapidata();
    super.onInit();
  }

  GetStorage getStorage = GetStorage();
  final controllerM = Get.put(CheckLoginController());
  getUserData() async {
    String strUserData = "";
    if (getStorage.hasData(Constant.USER_DATA)) {
      strUserData = await getStorage.read(Constant.USER_DATA);
    }
    if (getStorage.read('FirstUser') == false) {
      Get.offAll(const Login());
    } else {
      Get.offAll(const onBoardingPage());
    }
  }

  void moveToLogin() async {
    Get.offAllNamed(AppRoutes.LOGIN);
  }

  var apkversion = ''.obs;

  void fetchapidata() {
    ApiRequest(url: UrlConstants.checklatestVersion, data: {}).postRequest(
      onSuccess: (responseModel) {
        Map<String, dynamic> dataFromSuccess = responseModel.result;
        BaseResponse responseData = BaseResponse.fromJson(dataFromSuccess);
        if (responseData.success == true && responseData != null) {
          apkversion(dataFromSuccess['data']['apkLatestVesion'].toString());
          update();
        }
      },
      onError: (error) {
        print(error);
      },
    );
  }
}
