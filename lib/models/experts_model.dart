import 'expert_model.dart';

class Experts
{
  List<dynamic> experts;
  Experts({required this.experts});
  factory Experts.fromJson(Map<String,dynamic> jsonData)
  {
    return Experts(
      experts: jsonData['experts'],
    );
  }

}