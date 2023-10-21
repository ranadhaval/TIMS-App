class OtherLoginCheckModel{
  String? employeeNo;
  String? password;
  String? deviceId;
  OtherLoginCheckModel({this.employeeNo, this.password, this.deviceId});

  OtherLoginCheckModel.fromJson(Map<String, dynamic> json) {
    employeeNo = json['employeeNo'];
    password = json['password'];
    deviceId = json['deviceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeNo'] = this.employeeNo;
    data['password'] = this.password;
    data['deviceId'] = this.deviceId;
    return data;
  }
}
