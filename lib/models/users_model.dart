import 'user_model.dart';

class Users
{
  List<dynamic> users;
  Users({required this.users});
  factory Users.fromJson(Map<String,dynamic> jsonData)
  {
    return Users(
      users: jsonData['users'],
    );
  }

}