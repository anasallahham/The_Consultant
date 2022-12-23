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

class UserSignUp extends StatefulWidget {
  const UserSignUp({Key? key}) : super(key: key);

  @override
  _UserSignUp createState() => _UserSignUp();
}

class _UserSignUp extends State<UserSignUp> {
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
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formstate = GlobalKey<FormState>();
    loginn() {
      var formdata = formstate.currentState;
      if (formdata!.validate()) {
        print("valid");
      } else {
        print("not valid");
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        toolbarHeight: 70,
        centerTitle: true,
        title: const Text(
          'User Sign Up',
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
                  ? Container(margin: EdgeInsets.symmetric(horizontal: 1),
                padding: EdgeInsets.symmetric(horizontal: 100),
                child :ClipOval(
                  child: Image.file(image!,
                      width:100, height: 150, fit: BoxFit.cover),
                ),)
                  :LogoAuth(),
              buttonForImage(
                text: "Upload Image",
                onPressed:()  => uploadImage() ,
              ),
              const SizedBox(height: 10),
              const CoustemTextTilteAuth(text: "New Account For User"),
              const CoustemTextBoudyAuth(
                text: 'Sign Up with your name (in Arabic and English) ,email and password ',
              ),

              const SizedBox(height: 20),

              CoustemTextFieldAuth(
                auto:AutovalidateMode.always ,
                valid: (val) {
                  return validinput(val!, 3,20 , "name");
                },
                hintText: "Enter your Name In Arabic",
                iconData: Icons.person_outlined,
                labelText: "User Name In Arabic",
              ),
              CoustemTextFieldAuth(
                auto:AutovalidateMode.always ,
                valid: (val) {
                  return validinput(val!, 3, 20, "email");
                },
                hintText: "Enter your Name In English",
                iconData: Icons.person_outlined,
                labelText: "User Name In English",
              ),
              CoustemTextFieldAuth(
                auto:AutovalidateMode.always ,
                valid: (val) {
                  return validinput(val!, 5, 100, "email");
                },
                hintText: "Enter your Email",
                iconData: Icons.email_outlined,
                labelText: "Email",
              ),
              CoustemTextFieldAuth(
                auto:AutovalidateMode.always ,
                valid: (val) {
                  return validinput(val!, 5, 30, "password");
                },
                hintText: "Enter your Password",
                iconData: Icons.lock_outlined,
                labelText: "Password",
                obscureText: true,
              ),
              SizedBox(height: 20),
              //CoustemButtonAuth(
              //text: "Sign In",
              //onPressed: ,
              //),
              const SizedBox(height: 20),
          CoustemButtonAuth(
            text: "Next",
            onPressed: (){},
          ),

            ],
          ),
        ),
      ),
    );
  }
}
