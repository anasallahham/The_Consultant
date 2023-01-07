class FreeDayModel {
  FreeDay? freeDay;

  FreeDayModel({this.freeDay});

  FreeDayModel.fromJson(Map<String, dynamic> json) {
    freeDay = json['free_day'] != null
        ? new FreeDay.fromJson(json['free_day'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.freeDay != null) {
      data['free_day'] = this.freeDay!.toJson();
    }
    return data;
  }
}

class FreeDay {
  int? expertId;
  String? day;
  int? startTime;
  int? endTime;
  String? updatedAt;
  String? createdAt;
  int? id;

  FreeDay(
      {this.expertId,
        this.day,
        this.startTime,
        this.endTime,
        this.updatedAt,
        this.createdAt,
        this.id});

  FreeDay.fromJson(Map<String, dynamic> json) {
    expertId = json['expert_id'];
    day = json['day'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['expert_id'] = this.expertId;
    data['day'] = this.day;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}