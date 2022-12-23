import 'dart:convert';
import 'package:the_consultant/models/expert_model.dart';
import 'package:http/http.dart' as http;
import 'package:the_consultant/models/experts_model.dart';
class ExpertsApi
{

  Future<List<Expert>> fetchExperts() async
  {

     http.Response response = await http
         .get(Uri.parse('localhost:8080/api/expert'));
     if(response.statusCode != 200)
     {
       print('status code = ${response.statusCode}');
     }
         String data = response.body;
         var jsonData = jsonDecode(data);
         Experts experts = Experts.fromJson(jsonData);
         List<Expert> expertsList = experts.experts.map((e) => Expert.fromJson(e)).toList();
         return expertsList;
  }


  Future<List<Expert>> fetchExpertsByCategory(String category) async
  {

      http.Response response = await http
          .get(Uri.parse('localhost:8080/api/expert?category=${category}'));
        if(response.statusCode != 200)
        {
          print('status code = ${response.statusCode}');
        };
        String data = response.body;
        var jsonData = jsonDecode(data);
        Experts experts = Experts.fromJson(jsonData);
        List<Expert> expertsList = experts.experts.map((e) => Expert.fromJson(e)).toList();
        return expertsList;
  }
}