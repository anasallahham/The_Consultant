import 'package:flutter/material.dart';
import 'package:the_consultant/language/language_constants.dart';
import 'package:the_consultant/shared/styles/colors.dart';
import 'package:the_consultant/shared/components/expert_card.dart';
class FavoritesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kVioletColor ,
        title: Text(
          translation(context).favorites,
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
          ),

        ),
      ),
      body:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildExpertCard(),
          separatorBuilder: (context, index) =>SizedBox(height: 20,),
          itemCount: 3,
        ),
      ),
    );
  }
  buildExpertCard() {
    return ExpertCard(
      'Anas',
      'Doctor',
      'assets/images/doctor2.png',
      kVioletColor,
    );
  }
}