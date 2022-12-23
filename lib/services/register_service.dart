import 'dart:convert';
import 'package:the_consultant/models/expert_model.dart';
import 'package:http/http.dart' as http;
import 'package:the_consultant/models/experts_model.dart';
class RegisterApi
{
   String host='192.168.103:8080';

  void register(String email,String password) async {
    Uri url = Uri.http(host, '/api/users/register');
    var response = await http.post(
        url,
        body: {
          "email":email,
          "password":password,
        });
  }


}