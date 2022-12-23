import 'package:flutter/material.dart';

class CoustemTextFieldAuth extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final bool obscureText;
  final AutovalidateMode auto;
  final String? Function(String?) valid;

  const CoustemTextFieldAuth({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.iconData,
    this.mycontroller,
    this.obscureText = false,
    required this.valid,
    required this.auto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: valid,
        controller: mycontroller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          suffixIcon: Icon(iconData),
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(labelText),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
