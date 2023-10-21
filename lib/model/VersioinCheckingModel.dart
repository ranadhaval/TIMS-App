// To parse this JSON data, do
//
//     final VersionCheckingModel = VersionCheckingModelFromJson(jsonString);

import 'dart:convert';

VersionCheckingModel VersionCheckingModelFromJson(String str) => VersionCheckingModel.fromJson(json.decode(str));

String VersionCheckingModelToJson(VersionCheckingModel data) => json.encode(data.toJson());

class VersionCheckingModel {
    VersionCheckingModel({
        required this.data,
    });

    Data data;

    factory VersionCheckingModel.fromJson(Map<String, dynamic> json) => VersionCheckingModel(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.apkLatestVesion,
    });

    String apkLatestVesion;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        apkLatestVesion: json["apkLatestVesion"],
    );

    Map<String, dynamic> toJson() => {
        "apkLatestVesion": apkLatestVesion,
    };
}
