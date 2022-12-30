import 'package:flutter/material.dart';

class CoustemTextTilteAuth extends StatelessWidget {
  final String text;

   CoustemTextTilteAuth({super.key, required this.text});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
