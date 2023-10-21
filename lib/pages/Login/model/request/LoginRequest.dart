class LoginRequest {
  String? employeeNo;
  String? password;
  String? deviceId;
  String? deviceType;

  LoginRequest(
      {this.employeeNo, this.password, this.deviceId, this.deviceType});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    employeeNo = json['employeeNo'];
    password = json['password'];
    deviceId = json['deviceId'];
    deviceType = json['deviceType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeNo'] = this.employeeNo;
    data['password'] = this.password;
    data['deviceId'] = this.deviceId;
    data['deviceType'] = this.deviceType;
    return data;
  }
}