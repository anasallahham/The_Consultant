class ScanModel {
  int? id;
  String? nameEn;
  String? nameAr;
  String? email;
  String? address;
  String? phone;
  int? wallet;
  Null? experiences;
  int? consultingId;
  String? createdAt;
  String? updatedAt;

  ScanModel(
      {this.id,
        this.nameEn,
        this.nameAr,
        this.email,
        this.address,
        this.phone,
        this.wallet,
        this.experiences,
        this.consultingId,
        this.createdAt,
        this.updatedAt});

  ScanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    email = json['email'];
    address = json['address'];
    phone = json['phone'];
    wallet = json['wallet'];
    experiences = json['experiences'];
    consultingId = json['consulting_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['email'] = this.email;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['wallet'] = this.wallet;
    data['experiences'] = this.experiences;
    data['consulting_id'] = this.consultingId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}