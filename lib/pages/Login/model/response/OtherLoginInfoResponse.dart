import 'package:tims/webservices/base_response.dart';

class OtherLoginInfoResponse extends BaseResponse {
  Data? data;

  OtherLoginInfoResponse({this.data});

  OtherLoginInfoResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    errorMessage = json['errorMessage'];

    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['errorMessage'] = this.errorMessage;

    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['accessToken'] = this.accessToken;
    return data;
  }
}

class Data {
  bool? otherLogin;
  String? platform;
  String? otherLoginIpAddress;

  Data({this.otherLogin, this.platform, this.otherLoginIpAddress});

  Data.fromJson(Map<String, dynamic> json) {
    otherLogin = json['otherLogin'];
    platform = json['platform'];
    otherLoginIpAddress = json['otherLoginIpAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otherLogin'] = this.otherLogin;
    data['platform'] = this.platform;
    data['otherLoginIpAddress'] = this.otherLoginIpAddress;
    return data;
  }
}
