import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:tims/model/MatrixScreenModel.dart';

import '../util/resources.dart';

class MatrixController extends GetxController {
  @override
  void onInit() {
    getAssetData();
    super.onInit();
  }

  List<MyModel> mYlist = [];

  getAssetData() async {
    String data = await rootBundle.loadString(mydata);
    var myModelMap = jsonDecode(data);
    MyModel myModelData = MyModel.fromJson(myModelMap);

    if (myModelData.data.isNotEmpty && myModelData.data != null) {
      mYlist.addAll({
        MyModel(
            success: myModelData.success,
            returnCode: myModelData.returnCode,
            data: myModelData.data,
            accessToken: myModelData.accessToken)
      });
      update();
    }
  }

  
}
