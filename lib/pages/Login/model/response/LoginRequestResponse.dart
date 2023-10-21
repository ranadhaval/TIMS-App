import 'package:tims/webservices/base_response.dart';

class LoginRequestResponse extends BaseResponse {
  int? returnCode;
  Data? data;
  String? accessToken;

  LoginRequestResponse({this.returnCode, this.data, this.accessToken});

  LoginRequestResponse.fromJson(Map<String, dynamic> json) {
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
  String? employeeId;
  String? firstName;
  String? employeeNo;
  String? roleName;

  Data({this.employeeId, this.firstName, this.employeeNo, this.roleName});

  Data.fromJson(Map<String, dynamic> json) {
    employeeId = json['employeeId'];
    firstName = json['firstName'];
    employeeNo = json['employeeNo'];
    roleName = json['roleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeId'] = this.employeeId;
    data['firstName'] = this.firstName;
    data['employeeNo'] = this.employeeNo;
    data['roleName'] = this.roleName;
    return data;
  }
}
