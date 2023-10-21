

import 'dart:convert';

MyModel myModelFromJson(String str) => MyModel.fromJson(json.decode(str));

String myModelToJson(MyModel data) => json.encode(data.toJson());

class MyModel {
    MyModel({
        required this.success,
        this.message,
        this.errorMessage,
        required this.returnCode,
        required this.data,
        required this.accessToken,
    });

    bool success;
    dynamic message;
    dynamic errorMessage;
    int returnCode;
    List<Datum> data;
    String accessToken;

    factory MyModel.fromJson(Map<String, dynamic> json) => MyModel(
        success: json["success"],
        message: json["message"],
        errorMessage: json["errorMessage"],
        returnCode: json["returnCode"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        accessToken: json["accessToken"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "errorMessage": errorMessage,
        "returnCode": returnCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "accessToken": accessToken,
    };
}

class Datum {
    Datum({
        required this.trainingStatus,
        required this.evaluationStatus,
        required this.contentStatus,
        required this.trainingRecordId,
        required this.isSectionDependent,
        required this.sectionName,
        required this.sectionOrderNo,
        required this.sectionId,
        required this.materialIndex,
        required this.trainingDetailId,
        required this.material,
    });

    String trainingStatus;
    String evaluationStatus;
    String contentStatus;
    String trainingRecordId;
    String isSectionDependent;
    String sectionName;
    String sectionOrderNo;
    String sectionId;
    String materialIndex;
    String trainingDetailId;
    List<Material> material;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        trainingStatus: json["trainingStatus"],
        evaluationStatus: json["evaluationStatus"],
        contentStatus: json["contentStatus"],
        trainingRecordId: json["trainingRecordID"],
        isSectionDependent: json["isSectionDependent"],
        sectionName: json["sectionName"],
        sectionOrderNo: json["sectionOrderNo"],
        sectionId: json["sectionId"],
        materialIndex: json["materialIndex"],
        trainingDetailId: json["trainingDetailId"],
        material: List<Material>.from(json["material"].map((x) => Material.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "trainingStatus": trainingStatus,
        "evaluationStatus": evaluationStatus,
        "contentStatus": contentStatus,
        "trainingRecordID": trainingRecordId,
        "isSectionDependent": isSectionDependent,
        "sectionName": sectionName,
        "sectionOrderNo": sectionOrderNo,
        "sectionId": sectionId,
        "materialIndex": materialIndex,
        "trainingDetailId": trainingDetailId,
        "material": List<dynamic>.from(material.map((x) => x.toJson())),
    };
}

class Material {
    Material({
        required this.selectedMaterialReadingTime,
        required this.materialUrl,
        required this.materialIsMandatory,
        required this.readByEmployee,
        required this.materialIndex,
        required this.isMaterialDependent,
        required this.materialName,
        required this.trainingDetailId,
        required this.materialFileName,
        required this.materialType,
        required this.materialId,
        required this.materialOrderNo,
        required this.materialMinimumReadTime,
        required this.subMaterial,
        required this.childMaterial,
    });

    String selectedMaterialReadingTime;
    String materialUrl;
    String materialIsMandatory;
    String readByEmployee;
    String materialIndex;
    String isMaterialDependent;
    String materialName;
    String trainingDetailId;
    String materialFileName;
    String materialType;
    String materialId;
    String materialOrderNo;
    String materialMinimumReadTime;
    bool subMaterial;
    List<dynamic> childMaterial;

    factory Material.fromJson(Map<String, dynamic> json) => Material(
        selectedMaterialReadingTime: json["selectedMaterialReadingTime"],
        materialUrl: json["materialURL"],
        materialIsMandatory: json["materialIsMandatory"],
        readByEmployee: json["readByEmployee"],
        materialIndex: json["materialIndex"],
        isMaterialDependent: json["isMaterialDependent"],
        materialName: json["materialName"],
        trainingDetailId: json["trainingDetailId"],
        materialFileName: json["materialFileName"],
        materialType: json["materialType"],
        materialId: json["materialId"],
        materialOrderNo: json["materialOrderNo"],
        materialMinimumReadTime: json["materialMinimumReadTime"],
        subMaterial: json["subMaterial"],
        childMaterial: List<dynamic>.from(json["childMaterial"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "selectedMaterialReadingTime": selectedMaterialReadingTime,
        "materialURL": materialUrl,
        "materialIsMandatory": materialIsMandatory,
        "readByEmployee": readByEmployee,
        "materialIndex": materialIndex,
        "isMaterialDependent": isMaterialDependent,
        "materialName": materialName,
        "trainingDetailId": trainingDetailId,
        "materialFileName": materialFileName,
        "materialType": materialType,
        "materialId": materialId,
        "materialOrderNo": materialOrderNo,
        "materialMinimumReadTime": materialMinimumReadTime,
        "subMaterial": subMaterial,
        "childMaterial": List<dynamic>.from(childMaterial.map((x) => x)),
    };
}
