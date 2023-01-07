import 'package:flutter/material.dart';
import 'package:the_consultant/language/language_constants.dart';
import 'package:the_consultant/modules/profile.dart';
import 'package:the_consultant/modules/schedule_screen.dart';
import 'package:the_consultant/modules/search_screen.dart';

import '../modules/experts_screen.dart';
import '../modules/home_screen.dart';
class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex=0;
  List<Widget> screens= [
    HomeScreen(),
    SearchScreen(),
    ScheduleScreen(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
          onTap: (index){
          setState(() {
            currentIndex=index;
          });
          },
          items:[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: translation(context).home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: translation(context).search,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: translation(context).schedule,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: translation(context).profile,
            ),
          ]
      ),
    );
  }
}
