import 'package:flutter/material.dart';
import 'package:the_consultant/modules/profile.dart';
import 'package:the_consultant/modules/schedule_screen.dart';

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
    ExpertsScreen(),
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
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'SEARCH',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'SCHEDULE',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'PROFILE',
            ),
          ]
      ),
    );
  }
}
