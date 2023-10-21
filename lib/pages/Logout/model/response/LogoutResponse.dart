import 'package:tims/webservices/base_response.dart';

class LogoutResponse extends BaseResponse {
  int? returnCode;
  Null? data;

  LogoutResponse({
    this.returnCode,
    this.data,
  });

  LogoutResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    errorMessage = json['errorMessage'];
    returnCode = json['returnCode'];
    data = json['data'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['errorMessage'] = this.errorMessage;
    data['returnCode'] = this.returnCode;
    data['data'] = this.data;
    data['accessToken'] = this.accessToken;
    return data;
  }
}
