import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tims/routes/app_routes.dart';
import 'package:tims/webservices/api_request.dart';
import 'package:tims/webservices/base_response.dart';
import 'package:tims/webservices/url_constants.dart';

class PopupController extends GetxController {
  TextEditingController popupcontroller = TextEditingController();
  var issuccess = true.obs;

  void callpopupApi() {
    ApiRequest(
            url: UrlConstants.passwordPopUp,
            data: {"employeeNo": "ALPL2762", "password": popupcontroller.text})
        .postRequest(
      onSuccess: (responseModel) {
        Map<String, dynamic> map = responseModel.result;
        BaseResponse responseData = BaseResponse.fromJson(map);

        if (responseData.success != null && responseData.success == true) {
          print('ok');
          Get.back();
          Get.toNamed(AppRoutes.FEEDBACKFORM);
        } else {
          issuccess.value = false;
          update();
        }
      },
      onError: (error) {
        print(error);
      },
    );
  }
}
