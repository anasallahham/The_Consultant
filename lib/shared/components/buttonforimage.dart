import 'package:flutter/material.dart';

import '../styles/colors.dart';


class buttonForImage extends StatelessWidget {
  final String text;
  final  Function()? onPressed;


  const buttonForImage({super.key, required this.text, required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return Container( margin: const EdgeInsets.only(top: 10,right: 40,left: 40),
      child:
      MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 5),
        onPressed: onPressed,

        color: kBlueColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        textColor: Colors.white,
        child: Text(text),
      ),);
  }
}
