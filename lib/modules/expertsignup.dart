import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../shared/components/buttonforimage.dart';
import '../shared/components/coustemtextboudyauth.dart';
import '../shared/components/coustemtextfieldauth.dart';
import '../shared/components/coustemtexttilteauth.dart';
import '../shared/components/coustmebuttonsauth.dart';
import '../shared/components/logoauth.dart';
import '../shared/function/validinput.dart';


class ExpertSignUp extends StatefulWidget {
  const ExpertSignUp({Key? key}) : super(key: key);

  @override
  _ExpertSignUp createState() => _ExpertSignUp();
}

class _ExpertSignUp extends State<ExpertSignUp> {
  File? image;
  final imagepicker = ImagePicker();

  Future uploadImage() async {
    final image = await imagepicker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemprorary = File(image.path);
    setState(() {
      this.image = imageTemprorary;
    });
  }

  var _daysv ;
 List _days=['Saturday','Sunday','Monday','Tuesday','Wednesday','Thursday','Friday'];
  var _counsv ;
  List _couns=['Medical','Law','Education','Family','Economy'];

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
          'Expert Sign Up',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
        child: Form(
          key: formstate,
          child: ListView(
            children: [
              image != null
                  ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 1),
                      padding: EdgeInsets.symmetric(horizontal: 100),
                      child: ClipOval(
                        child: Image.file(image!,
                            width: 200, height: 150, fit: BoxFit.cover),
                      ),
                    )
                  : LogoAuth(),
              buttonForImage(
                text: "Upload Image",
                onPressed: () => uploadImage(),
              ),
              const SizedBox(height: 10),
              const CoustemTextTilteAuth(text: "New Account For Expert"),
              const CoustemTextBoudyAuth(
                text: 'Sign Up with your information below ',
              ),
              const SizedBox(height: 20),
              CoustemTextFieldAuth(
                auto: AutovalidateMode.always,
                valid: (val) {
                  return validinput(val!, 3, 20, "name");
                },
                hintText: "Enter your Name In Arabic",
                iconData: Icons.person_outlined,
                labelText: "Expert Name In Arabic",
              ),
              CoustemTextFieldAuth(
                auto: AutovalidateMode.always,
                valid: (val) {
                  return validinput(val!, 3, 20, "name");
                },
                hintText: "Enter your Name In English",
                iconData: Icons.person_outlined,
                labelText: "Expert Name In English",
              ),
              CoustemTextFieldAuth(
                auto: AutovalidateMode.always,
                valid: (val) {
                  return validinput(val!, 5, 100, "email");
                },
                hintText: "Enter your Email",
                iconData: Icons.email_outlined,
                labelText: "Email",
              ),
              CoustemTextFieldAuth(
                auto: AutovalidateMode.always,
                valid: (val) {
                  return validinput(val!, 5, 30, "password");
                },
                hintText: "Enter your Password",
                iconData: Icons.lock_outlined,
                labelText: "Password",
                obscureText: true,
              ),
              CoustemTextFieldAuth(
                auto: AutovalidateMode.always,
                valid: (val) {
                  return validinput(val!, 5, 20, "Address");
                },
                hintText: "Enter Your Address",
                iconData: Icons.home_outlined,
                labelText: "Address",
              ),
              CoustemTextFieldAuth(
                auto: AutovalidateMode.always,
                valid: (val) {
                  return validinput(val!, 10, 10, "Phone Number");
                },
                hintText: "Enter Phone Number",
                iconData: Icons.phone,
                labelText: "Phone Number",
              ),
              CoustemTextFieldAuth(
                auto: AutovalidateMode.always,
                valid: (val) {
                  return validinput(val!, 20, 100, "Experience");
                },
                hintText: "Enter Your Experiences",
                iconData: Icons.info_outline,
                labelText: "Experience",
              ),

        Container(
          margin: const EdgeInsets.only(bottom: 25),
          child: DropdownButtonHideUnderline(child:
          DropdownButtonFormField(
            decoration: InputDecoration(
              hintText: "Select Available days",
              hintStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              suffixIcon: Icon(Icons.calendar_view_week),
              label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: const Text("Available Days"),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300,color:Colors.black,),
            value: _daysv,
          onChanged: (value){setState(() {
            _daysv=value;
          });},


          items:_days.map((value) {
            return DropdownMenuItem(
              value:value,
              child:Text(value));
          }  ).toList(),

        ),),),

              Container(
                margin: const EdgeInsets.only(bottom: 25),
                child: DropdownButtonHideUnderline(child:
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    hintText: "Select Your Consulting",
                    hintStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    suffixIcon: Icon(Icons.question_answer),
                    label: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 9),
                      child: const Text("Consulting"),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300,color:Colors.black,),
                  value: _counsv,
                  onChanged: (value){setState(() {
                    _counsv=value;
                  });},


                  items:_couns.map((value) {
                    return DropdownMenuItem(
                        value:value,
                        child:Text(value));
                  }  ).toList(),

                ),),),
              const SizedBox(height: 20),
              CoustemButtonAuth(
                text: "Next",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
