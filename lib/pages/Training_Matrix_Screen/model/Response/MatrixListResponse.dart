import 'package:tims/webservices/base_response.dart';

class MatrixListResponse extends BaseResponse {
  int? returnCode;
  Data? data;

  MatrixListResponse({
    this.returnCode,
    this.data,
  });

  MatrixListResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    errorMessage = json['errorMessage'];
    returnCode = json['returnCode'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['errorMessage'] = this.errorMessage;
    data['returnCode'] = this.returnCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['accessToken'] = this.accessToken;
    return data;
  }
}

class Data {
  int? totalNoOftrainings;
  int? totalTrainings;
  int? completedTrainings;
  int? pendingTrainings;
  List<TrainingList>? trainingList;

  Data(
      {this.totalNoOftrainings,
      this.totalTrainings,
      this.completedTrainings,
      this.pendingTrainings,
      this.trainingList});

  Data.fromJson(Map<String, dynamic> json) {
    totalNoOftrainings = json['totalNoOftrainings'];
    totalTrainings = json['totalTrainings'];
    completedTrainings = json['completedTrainings'];
    pendingTrainings = json['pendingTrainings'];
    if (json['trainingList'] != null) {
      trainingList = <TrainingList>[];
      json['trainingList'].forEach((v) {
        trainingList!.add(new TrainingList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalNoOftrainings'] = this.totalNoOftrainings;
    data['totalTrainings'] = this.totalTrainings;
    data['completedTrainings'] = this.completedTrainings;
    data['pendingTrainings'] = this.pendingTrainings;
    if (this.trainingList != null) {
      data['trainingList'] = this.trainingList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TrainingList {
  String? trainingTypeName;
  String? trainingDetailId;
  String? trainingId;
  String? trainingNo;
  String? title;
  String? trainingVersion;
  String? trainingMethodology;
  int? trainingMethodologyId;
  bool? isOneToOneTraining;
  String? iSSCHEDULE;
  String? scheduleDate;
  String? scheduleReason;
  String? scheduleTrainingType;
  String? scheduleAssignBy;
  String? trainingStatus;
  String? evaluationStatus;
  String? contentStatus;

  TrainingList(
      {this.trainingTypeName,
      this.trainingDetailId,
      this.trainingId,
      this.trainingNo,
      this.title,
      this.trainingVersion,
      this.trainingMethodology,
      this.trainingMethodologyId,
      this.isOneToOneTraining,
      this.iSSCHEDULE,
      this.scheduleDate,
      this.scheduleReason,
      this.scheduleTrainingType,
      this.scheduleAssignBy,
      this.trainingStatus,
      this.evaluationStatus,
      this.contentStatus});

  TrainingList.fromJson(Map<String, dynamic> json) {
    trainingTypeName = json['trainingTypeName'];
    trainingDetailId = json['trainingDetailId'];
    trainingId = json['trainingId'];
    trainingNo = json['trainingNo'];
    title = json['title'];
    trainingVersion = json['trainingVersion'];
    trainingMethodology = json['trainingMethodology'];
    trainingMethodologyId = json['trainingMethodologyId'];
    isOneToOneTraining = json['isOneToOneTraining'];
    iSSCHEDULE = json['IS_SCHEDULE'];
    scheduleDate = json['scheduleDate'];
    scheduleReason = json['scheduleReason'];
    scheduleTrainingType = json['scheduleTrainingType'];
    scheduleAssignBy = json['scheduleAssignBy'];
    trainingStatus = json['trainingStatus'];
    evaluationStatus = json['evaluationStatus'];
    contentStatus = json['contentStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trainingTypeName'] = this.trainingTypeName;
    data['trainingDetailId'] = this.trainingDetailId;
    data['trainingId'] = this.trainingId;
    data['trainingNo'] = this.trainingNo;
    data['title'] = this.title;
    data['trainingVersion'] = this.trainingVersion;
    data['trainingMethodology'] = this.trainingMethodology;
    data['trainingMethodologyId'] = this.trainingMethodologyId;
    data['isOneToOneTraining'] = this.isOneToOneTraining;
    data['IS_SCHEDULE'] = this.iSSCHEDULE;
    data['scheduleDate'] = this.scheduleDate;
    data['scheduleReason'] = this.scheduleReason;
    data['scheduleTrainingType'] = this.scheduleTrainingType;
    data['scheduleAssignBy'] = this.scheduleAssignBy;
    data['trainingStatus'] = this.trainingStatus;
    data['evaluationStatus'] = this.evaluationStatus;
    data['contentStatus'] = this.contentStatus;
    return data;
  }
}
