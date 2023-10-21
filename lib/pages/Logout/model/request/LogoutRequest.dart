class LogoutRequest {
  String? employeeNo;
  String? deviceId;
  bool? sesstionTimeOut;

  LogoutRequest({this.employeeNo, this.deviceId, this.sesstionTimeOut});

  LogoutRequest.fromJson(Map<String, dynamic> json) {
    employeeNo = json['employeeNo'];
    deviceId = json['deviceId'];
    sesstionTimeOut = json['sesstionTimeOut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeNo'] = this.employeeNo;
    data['deviceId'] = this.deviceId;
    data['sesstionTimeOut'] = this.sesstionTimeOut;
    return data;
  }
}