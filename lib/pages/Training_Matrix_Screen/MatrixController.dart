import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tims/pages/Training_Matrix_Screen/model/Request/MatrixListRequest.dart';
import 'package:tims/pages/Training_Matrix_Screen/model/Response/MatrixListResponse.dart';
import 'package:tims/pages/Training_Matrix_Screen/provider/MatrixListProvider.dart';
import 'package:tims/webservices/response_model.dart';

class MatrixListController extends GetxController {
  @override
  void onInit() {
    update();
    pendingApi(0);
    completedApi();
    allApi();

    super.onInit();
  }

  bool convert = false;
  bool selected = false;

  List<MatrixListResponse> pendingList = [];
  List<MatrixListResponse> completedList = [];
  List<MatrixListResponse> allList = [];

  void matrixApiCall(
      {required String employeeId,
      required String pageNo,
      required String pageSize,
      required String trainingFilter,
      required String trainingNo,
      required List<MatrixListResponse> list}) {
    MatrixListRequest matrixListRequest = MatrixListRequest(
      employeeId: employeeId,
      currentPageNo: pageNo,
      pageSize: pageSize,
      trainingFilter: trainingFilter,
      trainingNo: trainingNo,
    );

    MatrixListProvider().matrixListProvider(
      matrixListRequest: matrixListRequest,
      onSuccess: (ResponseModel responseModel) {
        if (responseModel.statusCode == 200) {
          MatrixListResponse responseData =
              MatrixListResponse.fromJson(responseModel.result);

          if (responseData.success == true && responseData != null) {
            list.add(MatrixListResponse(
                returnCode: responseData.returnCode, data: responseData.data));

            update();
          } else {}
        } else {
          snackbar(message: 'Not Able to find ', color: Colors.red);
        }
      },
      onError: (error) {
        snackbar(message: '$error', color: Colors.red);
      },
    );
  }

  void pendingApi(pageno) {
    matrixApiCall(
        employeeId: '11',
        pageNo: '$pageno',
        pageSize: '10',
        trainingFilter: 'Pending',
        trainingNo: '',
        list: pendingList);
  }

  void completedApi() {
    matrixApiCall(
        employeeId: '11',
        pageNo: '1',
        pageSize: '10',
        trainingFilter: 'Completed',
        trainingNo: '',
        list: completedList);
  }

  void allApi() {
    matrixApiCall(
        employeeId: '11',
        pageNo: '1',
        pageSize: '10',
        trainingFilter: 'All',
        trainingNo: '',
        list: allList);
  }

  SnackbarController snackbar({required String message, required Color color}) {
    return Get.snackbar(
      padding: EdgeInsets.all(12),
      "Error",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color,
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
    );
  }
}
