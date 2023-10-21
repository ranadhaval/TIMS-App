class VenuModel {
  Result? result;
  bool? status;
  String? title;
  String? message;

  VenuModel({this.result, this.status, this.title, this.message});

  VenuModel.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
    status = json['status'];
    title = json['title'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['status'] = this.status;
    data['title'] = this.title;
    data['message'] = this.message;
    return data;
  }
}

class Result {
  List<Data>? data;
  int? total;

  Result({this.data, this.total});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int? id;
  String? venueId;
  int? projectId;
  String? name;
  String? color;
  String? type;
  int? noOfSlots;
  int? maxPax;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? bookingStatus;
  int? totalSlot;
  int? bookedSlot;
  List<VenueSlot>? venueSlot;

  Data(
      {this.id,
      this.venueId,
      this.projectId,
      this.name,
      this.color,
      this.type,
      this.noOfSlots,
      this.maxPax,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.bookingStatus,
      this.totalSlot,
      this.bookedSlot,
      this.venueSlot});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    venueId = json['venue_id'];
    projectId = json['project_id'];
    name = json['name'];
    color = json['color'];
    type = json['type'];
    noOfSlots = json['no_of_slots'];
    maxPax = json['max_pax'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    bookingStatus = json['booking_status'];
    totalSlot = json['totalSlot'];
    bookedSlot = json['bookedSlot'];
    if (json['venue_slot'] != null) {
      venueSlot = <VenueSlot>[];
      json['venue_slot'].forEach((v) {
        venueSlot!.add(new VenueSlot.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['venue_id'] = this.venueId;
    data['project_id'] = this.projectId;
    data['name'] = this.name;
    data['color'] = this.color;
    data['type'] = this.type;
    data['no_of_slots'] = this.noOfSlots;
    data['max_pax'] = this.maxPax;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['booking_status'] = this.bookingStatus;
    data['totalSlot'] = this.totalSlot;
    data['bookedSlot'] = this.bookedSlot;
    if (this.venueSlot != null) {
      data['venue_slot'] = this.venueSlot!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VenueSlot {
  int? venueId;
  String? slotName;
  int? id;
  String? fromTime;
  String? toTime;
  String? bookingDetail;
  bool? selected;

  VenueSlot(
      {this.venueId,
      this.slotName,
      this.id,
      this.fromTime,
      this.toTime,
      this.bookingDetail,
      this.selected});

  VenueSlot.fromJson(Map<String, dynamic> json) {
    venueId = json['venue_id'];
    slotName = json['slot_name'];
    id = json['id'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    bookingDetail = json['booking_detail'];
    selected = json['selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['venue_id'] = this.venueId;
    data['slot_name'] = this.slotName;
    data['id'] = this.id;
    data['from_time'] = this.fromTime;
    data['to_time'] = this.toTime;
    data['booking_detail'] = this.bookingDetail;
    data['selected'] = this.selected;
    return data;
  }
}
