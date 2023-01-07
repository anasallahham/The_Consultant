import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_consultant/bloc/free_day_cubit.dart';
import 'package:the_consultant/network/local/cache.dart';

import 'package:the_consultant/shared/components/coustmebuttonsauth.dart';

import 'package:the_consultant/layout/home_layout.dart';


class FreeDay extends StatefulWidget {
  @override
  State<FreeDay> createState() => _FreeDayState();
}

class _FreeDayState extends State<FreeDay> {


  var st;
  var en;
  var _Timev;
  var _Timeve;
  final List _Time = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
  ];
  var day;
  //bool selected_time = false;
  bool sat = false,
      sun = false,
      mon = false,
      tue = false,
      wed = false,
      thu = false,
      fri = false;
  CacheHelper? prefs;

  void initShared() async {
    await CacheHelper.init();

  }
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    initShared();
  }


  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formstate = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          toolbarHeight: 70,
          centerTitle: true,
          title: const Text(
            'Available Time And Day',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        body: BlocProvider<FreeDayCubit>(
            create: (context) => FreeDayCubit(),
            child: BlocConsumer<FreeDayCubit, FreeDayState>(
              listener: (context, state) {
                if (state is FreeDaySuccess) {
                  CacheHelper.saveData(
                      key: 'token',
                      value: state.data.freeDay);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => HomeLayout()));
                }
              }, builder: (context, state) {
              return
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formstate,
            child: ListView(
              children: [
                Container(
                  width: 275,
                  height: 230,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey.shade400),
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: EdgeInsets.all(18),
                    child: Column(
                      children: [

                        Text("Select Available Time",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 25),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      hintText: "Start Time",
                                      hintStyle: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300),
                                      floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                      contentPadding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 30),
                                      suffixIcon: Icon(Icons.alarm_outlined),
                                      label: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 9),
                                        child: const Text("Available Time Start"),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black,
                                    ),
                                    value: _Timev,
                                    onChanged: (value) {
                                      setState(() {
                                        _Timev = value;
                                        st=_Timev;
                                      });

                                    },

                                    items: _Time.map((value) {
                                      return DropdownMenuItem(
                                          value: value, child: Text(value));
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 25),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      hintText: "End Time",
                                      hintStyle: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300),
                                      floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                      contentPadding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 30),
                                      suffixIcon: Icon(Icons.alarm_outlined),
                                      label: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 9),
                                        child: const Text("Available Time End"),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black,
                                    ),
                                    value: _Timeve,
                                    onChanged: (value) {
                                      setState(() {
                                        _Timeve = value;
                                        en=_Timeve;
                                      });

                                    },
                                    items: _Time.map((value) {
                                      return DropdownMenuItem(
                                          value: value, child: Text(value));
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  width: 300,
                  height: 310,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey.shade400),
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: EdgeInsets.all(18),
                    child: Column(children: [
                      Text("Available Days",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              title: Text("Sat"),
                              value: sat,
                              onChanged: (value) {
                                setState(() {
                                  sat = value!;
                                });
                                if(sat==true)
                                  {
                                    day="Saturday,";
                                  };

                              },
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              title: Text("Sun"),
                              value: sun,
                              onChanged: (value) {
                                setState(() {
                                  sun = value!;
                                });
                                if(sun==true)
                                {
                                  day="Sunday,";
                                };
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              title: Text("Mon"),
                              value: mon,
                              onChanged: (value) {
                                setState(() {
                                  mon = value!;
                                });
                                if(mon==true)
                                {
                                  day="Monday,";
                                };
                              },
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              title: Text("Tue"),
                              value: tue,
                              onChanged: (value) {
                                setState(() {
                                  tue = value!;
                                });
                                if(tue==true)
                                {
                                  day="Tuesday,";
                                };
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              title: Text("Wed"),
                              value: wed,
                              onChanged: (value) {
                                setState(() {
                                  wed = value!;
                                });
                                if(wed==true)
                                {
                                  day="Wednesday,";
                                };
                              },
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              title: Text("Thu"),
                              value: thu,
                              onChanged: (value) {
                                setState(() {
                                  thu = value!;
                                });
                                if(thu==true)
                                {
                                  day="Thursday,";
                                };
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              title: Text("Fri"),
                              value: fri,
                              onChanged: (value) {
                                setState(() {
                                  fri = value!;
                                });
                                if(fri==true)
                                {
                                  day="Friday,";
                                };
                              },
                            ),
                          ),
                          Expanded(
                              child: SizedBox(
                                width: 30,
                              )),
                        ],
                      )
                    ]),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),


                const SizedBox(height: 20),
                CoustemButtonAuth(
                    text: "Sign In",
                    onPressed: () { FreeDayCubit.get(context).FreeDay(
                      start_time: st,
                      end_time: en,
                      day: day,

                    );

                      }),
              ],
            ),
          ),
        );
  },
  )
  ),
  );
}
}
