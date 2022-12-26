import 'package:the_consultant/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class ScheduleCardA extends StatelessWidget {
  var _title;
  var _description;
  var _date;
  var _month;
  var _bgColor;

  ScheduleCardA(
      this._title, this._description, this._date, this._month, this._bgColor);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          print("CONFIRMED");
                        },
                        child: Text("CONFIRM")),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          print("CANCEL");
                        },
                        child: Text("CANCEL")),
                  ],
                  titlePadding: EdgeInsets.only(top: 20, left: 20,right: 20),
                  title: Text("Are you sure ?"),
                );
              });
        },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: _bgColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            leading: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: _bgColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _date,
                    style: TextStyle(
                      color: _bgColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _month,
                    style: TextStyle(
                      color: _bgColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            title: Text(
              _title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kTitleTextColor,
              ),
            ),
            subtitle: Text(
              _description,
              style: TextStyle(
                color: kTitleTextColor.withOpacity(0.7),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
