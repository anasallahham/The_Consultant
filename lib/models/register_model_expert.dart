class RegisterModelExpert {
  User? user;
  String? accessToken;

  RegisterModelExpert({this.user, this.accessToken});

  RegisterModelExpert.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['access_token'] = this.accessToken;
    return data;
  }
}

class User {
  String? nameEn;
  String? nameAr;
  String? email;
  String? address;
  String? phone;
  int? consultingId;
  String? wallet;
  String? updatedAt;
  String? createdAt;
  int? id;

  User(
      {this.nameEn,
        this.nameAr,
        this.email,
        this.address,
        this.phone,
        this.consultingId,
        this.wallet,
        this.updatedAt,
        this.createdAt,
        this.id});

  User.fromJson(Map<String, dynamic> json) {
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    email = json['email'];
    address = json['address'];
    phone = json['phone'];
    consultingId = json['consulting_id'];
    wallet = json['wallet'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['email'] = this.email;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['consulting_id'] = this.consultingId;
    data['wallet'] = this.wallet;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}