// import 'package:get/get.dart';
// import 'package:tims/model/MatrixScreenPageModel.dart';

// import '../webservices/api_request.dart';

// class MatrixPgeController extends GetxController {
//   // from api request
//   List<maxtrixScreenPageModel> matrixList = [];
//   List<TrainingList> trainingList = [];
//   List<TrainingList> pendingList = [];
//   List<TrainingList> completeList = [];
//   List<TrainingList> allList = [];

//   fetchapidata() async {
//     final appreq = ApiRequest(data: {
//       "employeeId": "13",
//       "currentPageNo": "0",
//       "pageSize": "10",
//       "trainingNo": "",
//       "trainingFilter": "Pending"
//     }, url: "http://202.8.125.236:8081/timsWeb/rest/v1/employeeTrainingList");
//     await appreq.postRequest();

//     var mymodeldata = maxtrixScreenPageModel.fromJson(appreq.yourdata);

//     matrixList.add(maxtrixScreenPageModel(
//         success: mymodeldata.success,
//         returnCode: mymodeldata.returnCode,
//         data: mymodeldata.data,
//         accessToken: mymodeldata.accessToken,
//         errorMessage: mymodeldata.errorMessage));
//     await addData();

//     update();
//   }

//   addData() {
//     for (int i = 0; i < matrixList[0].data.trainingList.length; i++) {
//       trainingList.add(TrainingList(
//           trainingTypeName: matrixList[0].data.trainingList[i].trainingTypeName,
//           trainingDetailId: matrixList[0].data.trainingList[i].trainingDetailId,
//           trainingId: matrixList[0].data.trainingList[i].trainingId,
//           trainingNo: matrixList[0].data.trainingList[i].trainingNo,
//           title: matrixList[0].data.trainingList[i].title,
//           trainingVersion: matrixList[0].data.trainingList[i].trainingVersion,
//           trainingMethodology:
//               matrixList[0].data.trainingList[i].trainingMethodology,
//           trainingMethodologyId:
//               matrixList[0].data.trainingList[i].trainingMethodologyId,
//           isOneToOneTraining:
//               matrixList[0].data.trainingList[i].isOneToOneTraining,
//           isSchedule: matrixList[0].data.trainingList[i].isSchedule,
//           scheduleDate: matrixList[0].data.trainingList[i].scheduleDate,
//           scheduleReason: matrixList[0].data.trainingList[i].scheduleReason,
//           scheduleTrainingType:
//               matrixList[0].data.trainingList[i].scheduleTrainingType,
//           scheduleAssignBy: matrixList[0].data.trainingList[i].scheduleAssignBy,
//           trainingStatus: matrixList[0].data.trainingList[i].trainingStatus,
//           evaluationStatus: matrixList[0].data.trainingList[i].evaluationStatus,
//           contentStatus: matrixList[0].data.trainingList[i].contentStatus));

//       if (trainingList[i].trainingTypeName.toString() == 'SOP') {
//         print("hii fjsbdfjsf");
//       }
//     }
//     // pendingList = tryi();
//   }

//   // List<TrainingList> tryi() {
//   //   return trainingList
//   //       .where((element) => element.trainingStatus == "Pending")
//   //       .toList();
//   // }
// }
