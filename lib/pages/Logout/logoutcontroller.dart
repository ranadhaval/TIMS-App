import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tims/pages/Login/model/response/LoginRequestResponse.dart';

import 'package:tims/pages/Logout/model/provider/LogoutProvider.dart';
import 'package:tims/pages/Logout/model/request/LogoutRequest.dart';
import 'package:tims/pages/Logout/model/response/LogoutResponse.dart';
import 'package:tims/webservices/response_model.dart';
import 'package:tims/widgets/snackbar.dart';

// class logoutController extends GetxController {
//   GetStorage getStorage = GetStorage();

//   void apicall(context) {
//     LoginRequestResponse list = getStorage.read('ListMatrix');
//     LogoutRequest logoutRequest = LogoutRequest(
//         deviceId: 'f1fdc08a21267991', employeeNo: '3', sesstionTimeOut: true);
//     update();

//     LogoutProvider().logoutProvider(
//         logoutRequest: logoutRequest,
//         onSuccess: (ResponseModel responseModel) {
//           if (responseModel.statusCode == 200) {
//             LogoutResponse response =
//                 LogoutResponse.fromJson(responseModel.result);

//             if (response != null && response.success == true) {
//               print('get success');
//             } else {
//               snackbar('We not get Any data2', Colors.red);
//             }
//           } else {
//             snackbar('We not get Any data2', Colors.red);
//           }
//         });
//   }
// }
