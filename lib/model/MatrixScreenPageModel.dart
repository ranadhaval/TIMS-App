// To parse this JSON data, do
//
//     final maxtrixScreenPageModel = maxtrixScreenPageModelFromJson(jsonString);

import 'dart:convert';

maxtrixScreenPageModel maxtrixScreenPageModelFromJson(String str) => maxtrixScreenPageModel.fromJson(json.decode(str));

String maxtrixScreenPageModelToJson(maxtrixScreenPageModel data) => json.encode(data.toJson());

// ignore: camel_case_types
class maxtrixScreenPageModel {
    maxtrixScreenPageModel({
        required this.success,
        this.message,
        this.errorMessage,
        required this.returnCode,
        required this.data,
        this.accessToken,
    });

    bool success;
    dynamic message;
    dynamic errorMessage;
    int returnCode;
    Data data;
    dynamic accessToken;

    factory maxtrixScreenPageModel.fromJson(Map<String, dynamic> json) => maxtrixScreenPageModel(
        success: json["success"],
        message: json["message"],
        errorMessage: json["errorMessage"],
        returnCode: json["returnCode"],
        data: Data.fromJson(json["data"]),
        accessToken: json["accessToken"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "errorMessage": errorMessage,
        "returnCode": returnCode,
        "data": data.toJson(),
        "accessToken": accessToken,
    };
}

class Data {
    Data({
        required this.totalNoOftrainings,
        required this.totalTrainings,
        required this.completedTrainings,
        required this.pendingTrainings,
        required this.trainingList,
    });

    int totalNoOftrainings;
    int totalTrainings;
    int completedTrainings;
    int pendingTrainings;
    List<TrainingList> trainingList;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalNoOftrainings: json["totalNoOftrainings"],
        totalTrainings: json["totalTrainings"],
        completedTrainings: json["completedTrainings"],
        pendingTrainings: json["pendingTrainings"],
        trainingList: List<TrainingList>.from(json["trainingList"].map((x) => TrainingList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "totalNoOftrainings": totalNoOftrainings,
        "totalTrainings": totalTrainings,
        "completedTrainings": completedTrainings,
        "pendingTrainings": pendingTrainings,
        "trainingList": List<dynamic>.from(trainingList.map((x) => x.toJson())),
    };
}

class TrainingList {
    TrainingList({
        required this.trainingTypeName,
        required this.trainingDetailId,
        required this.trainingId,
        required this.trainingNo,
        required this.title,
        required this.trainingVersion,
        required this.trainingMethodology,
        required this.trainingMethodologyId,
        required this.isOneToOneTraining,
        required this.isSchedule,
        required this.scheduleDate,
        required this.scheduleReason,
        required this.scheduleTrainingType,
        required this.scheduleAssignBy,
        required this.trainingStatus,
        required this.evaluationStatus,
        required this.contentStatus,
    });

    TrainingTypeName trainingTypeName;
    String trainingDetailId;
    String trainingId;
    String trainingNo;
    String title;
    String trainingVersion;
    TrainingMethodology trainingMethodology;
    int trainingMethodologyId;
    bool isOneToOneTraining;
    IsSchedule isSchedule;
    Schedule scheduleDate;
    Schedule scheduleReason;
    ScheduleTrainingType scheduleTrainingType;
    Schedule scheduleAssignBy;
    Status trainingStatus;
    Status evaluationStatus;
    ContentStatus contentStatus;

    factory TrainingList.fromJson(Map<String, dynamic> json) => TrainingList(
        trainingTypeName: trainingTypeNameValues.map[json["trainingTypeName"]]!,
        trainingDetailId: json["trainingDetailId"],
        trainingId: json["trainingId"],
        trainingNo: json["trainingNo"],
        title: json["title"],
        trainingVersion: json["trainingVersion"],
        trainingMethodology: trainingMethodologyValues.map[json["trainingMethodology"]]!,
        trainingMethodologyId: json["trainingMethodologyId"],
        isOneToOneTraining: json["isOneToOneTraining"],
        isSchedule: isScheduleValues.map[json["IS_SCHEDULE"]]!,
        scheduleDate: scheduleValues.map[json["scheduleDate"]]!,
        scheduleReason: scheduleValues.map[json["scheduleReason"]]!,
        scheduleTrainingType: scheduleTrainingTypeValues.map[json["scheduleTrainingType"]]!,
        scheduleAssignBy: scheduleValues.map[json["scheduleAssignBy"]]!,
        trainingStatus: statusValues.map[json["trainingStatus"]]!,
        evaluationStatus: statusValues.map[json["evaluationStatus"]]!,
        contentStatus: contentStatusValues.map[json["contentStatus"]]!,
    );

    Map<String, dynamic> toJson() => {
        "trainingTypeName": trainingTypeNameValues.reverse[trainingTypeName],
        "trainingDetailId": trainingDetailId,
        "trainingId": trainingId,
        "trainingNo": trainingNo,
        "title": title,
        "trainingVersion": trainingVersion,
        "trainingMethodology": trainingMethodologyValues.reverse[trainingMethodology],
        "trainingMethodologyId": trainingMethodologyId,
        "isOneToOneTraining": isOneToOneTraining,
        "IS_SCHEDULE": isScheduleValues.reverse[isSchedule],
        "scheduleDate": scheduleValues.reverse[scheduleDate],
        "scheduleReason": scheduleValues.reverse[scheduleReason],
        "scheduleTrainingType": scheduleTrainingTypeValues.reverse[scheduleTrainingType],
        "scheduleAssignBy": scheduleValues.reverse[scheduleAssignBy],
        "trainingStatus": statusValues.reverse[trainingStatus],
        "evaluationStatus": statusValues.reverse[evaluationStatus],
        "contentStatus": contentStatusValues.reverse[contentStatus],
    };
}

enum ContentStatus { NOT_APPLICABLE }

final contentStatusValues = EnumValues({
    "Not Applicable": ContentStatus.NOT_APPLICABLE
});

enum Status { PENDING }

final statusValues = EnumValues({
    "Pending": Status.PENDING
});

enum IsSchedule { N }

final isScheduleValues = EnumValues({
    "N": IsSchedule.N
});

enum Schedule { EMPTY }

final scheduleValues = EnumValues({
    "-": Schedule.EMPTY
});

enum ScheduleTrainingType { TNI }

final scheduleTrainingTypeValues = EnumValues({
    "TNI": ScheduleTrainingType.TNI
});

enum TrainingMethodology { READ_AND_UNDERSTOOD_WITH_EVALUATION }

final trainingMethodologyValues = EnumValues({
    "Read and understood with evaluation": TrainingMethodology.READ_AND_UNDERSTOOD_WITH_EVALUATION
});

enum TrainingTypeName { SOP }

final trainingTypeNameValues = EnumValues({
    "SOP": TrainingTypeName.SOP
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
