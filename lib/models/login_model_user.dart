class LoginModelUser {
  int? id;
  String? name;
  String? email;
  Null? image;
  int? wallet;
  String? createdAt;
  String? updatedAt;
  String? token;

  LoginModelUser(
      {this.id,
        this.name,
        this.email,
        this.image,
        this.wallet,
        this.createdAt,
        this.updatedAt,
        this.token});

  LoginModelUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    wallet = json['wallet'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['image'] = this.image;
    data['wallet'] = this.wallet;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['token'] = this.token;
    return data;
  }
}