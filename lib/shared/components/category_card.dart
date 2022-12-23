import 'package:the_consultant/modules/experts_screen.dart';
import 'package:the_consultant/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  var _title;
  var _imageUrl;
  var _bgColor;

  CategoryCard(this._title, this._imageUrl, this._bgColor);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context)=> ExpertsScreen(),
            )
        );

      },
      child: Container(
        width: 130,
        height: 160,
        child: Stack(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: 110,
                height: 137,
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    _title,
                    style: TextStyle(
                      color: kTitleTextColor,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 25,
              top: 7,
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: _bgColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 8,
                      offset: Offset(-5,5),
                  ),
                    ],
                ),
                child: Image.asset(
                  _imageUrl,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
