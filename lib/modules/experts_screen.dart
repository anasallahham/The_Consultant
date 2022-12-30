import 'package:flutter/material.dart';
import 'package:the_consultant/shared/styles/colors.dart';
import 'package:the_consultant/shared/components/expert_card.dart';
class ExpertsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kOrangeColor ,
        title: Text(
          'Experts',
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
          itemCount: 10,
        ),
      ),
    );
  }
  buildExpertCard() {
    return ExpertCard(
      'Name',
      'Profession',
      'assets/images/doctor1.png',
      kOrangeColor,
    );
  }
}