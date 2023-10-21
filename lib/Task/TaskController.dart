import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:tims/Task/Model/Response/ResponseModel.dart';
import '../util/resources.dart';

class TaskController extends GetxController {
  @override
  void onInit() {
    getAssetData();
    super.onInit();
  }

  VenuModel? model;
 bool isloading = true;

  List<Data>? lstData = [];

  bool nextWidget = false;
  TextEditingController datecontroller = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController paxController = TextEditingController();

  getAssetData() async {
    String data = await rootBundle.loadString(mydata);
    var myModelMap = jsonDecode(data);
    VenuModel myModelData = VenuModel.fromJson(myModelMap);

    if (myModelData.status == true && myModelData != null) {
      if (myModelData.result != null && myModelData.result!.data != null) {
        lstData!.addAll(myModelData.result!.data!);

      // mYlist.addAll({
      //   VenuModel(
      //       result: myModelData.result,
      //       status: myModelData.status,
      //       title: myModelData.title,
      //       message: myModelData.message)
      // });

      }



      update();
    }

    
  }
}
