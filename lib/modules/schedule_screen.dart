import 'package:flutter/material.dart';
import 'package:the_consultant/shared/components/schedule_card.dart';
import 'package:the_consultant/shared/styles/colors.dart';
class ScheduleScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kOrangeColor ,
        title: Text(
          'Reservations',
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
          itemBuilder: (context, index) => buildScheduleCard(),
          separatorBuilder: (context, index) =>SizedBox(height: 20,),
          itemCount: 10,
        ),
      ),
    );
  }
  buildScheduleCard() {
    return ScheduleCard(
      'Consultation',
      'Sunday . 9am - 11am',
      '14',
      'Jan',
      kOrangeColor,
    );

  }
}