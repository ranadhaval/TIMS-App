class MatrixListRequest {
  String? employeeId;
  String? currentPageNo;
  String? pageSize;
  String? trainingNo;
  String? trainingFilter;

  MatrixListRequest(
      {this.employeeId,
      this.currentPageNo,
      this.pageSize,
      this.trainingNo,
      this.trainingFilter});

  MatrixListRequest.fromJson(Map<String, dynamic> json) {
    employeeId = json['employeeId'];
    currentPageNo = json['currentPageNo'];
    pageSize = json['pageSize'];
    trainingNo = json['trainingNo'];
    trainingFilter = json['trainingFilter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeId'] = this.employeeId;
    data['currentPageNo'] = this.currentPageNo;
    data['pageSize'] = this.pageSize;
    data['trainingNo'] = this.trainingNo;
    data['trainingFilter'] = this.trainingFilter;
    return data;
  }
}