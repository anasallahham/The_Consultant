import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_consultant/bloc/expert_signup_cubit.dart';
import 'package:the_consultant/core/function/validinput.dart';
import 'package:the_consultant/language/language_constants.dart';
import 'package:the_consultant/network/local/cache.dart';
import 'package:the_consultant/modules/free_day.dart';
import 'package:the_consultant/shared/components/buttonforimage.dart';
import 'package:the_consultant/shared/components/coustemtextboudyauth.dart';
import 'package:the_consultant/shared/components/coustemtextfieldauth.dart';
import 'package:the_consultant/shared/components/coustemtexttilteauth.dart';
import 'package:the_consultant/shared/components/coustmebuttonsauth.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:the_consultant/shared/components/logoauth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:the_consultant/layout/home_layout.dart';

class ExpertSignUp extends StatefulWidget {
  const ExpertSignUp({Key? key}) : super(key: key);

  @override
  _ExpertSignUp createState() => _ExpertSignUp();
}

class _ExpertSignUp extends State<ExpertSignUp> {

  var en_nameController = TextEditingController();
  var ar_nameController = TextEditingController();
  var walletController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();
  var experienceController = TextEditingController();
  int num=0;
  CacheHelper? prefs;


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


  var _Counsv;

  List _Couns=[  "mediacl",
    "carrer",
    "psychological",
    "family",
    "bussnies",
  ];

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
        title:  Text(
          translation(context).signUp,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body:BlocProvider<ExpertSignUpCubit>(
        create: (context) => ExpertSignUpCubit(),
        child: BlocConsumer<ExpertSignUpCubit, ExpertSignUpState>(
            listener: (context, state) {
              if (state is ExpertSignUpSuccess) {
                CacheHelper.saveData(
                    key: 'token',
                    value: state.data.accessToken);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomeLayout()));
              }
            }, builder: (context, state) {
          return


            Container(
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
                text: translation(context).uploadImage,
                onPressed: () => uploadImage(),
              ),
              const SizedBox(height: 10),
              CoustemTextTilteAuth(text: translation(context).newAccount),
               CoustemTextBoudyAuth(
                text: translation(context).signUpHint,
              ),
              const SizedBox(height: 20),
              CoustemTextFieldAuth(
                auto: AutovalidateMode.always,
                valid: (val) {
                  return validinput(val!, 3, 20, "name");
                },
                mycontroller: ar_nameController,
                hintText: translation(context).nameHintA,
                iconData: Icons.person_outlined,
                labelText: translation(context).nameA,
              ),
              CoustemTextFieldAuth(
                auto: AutovalidateMode.always,
                valid: (val) {
                  return validinput(val!, 3, 20, "name");
                },
                mycontroller: en_nameController,
                hintText: translation(context).nameHintE,
                iconData: Icons.person_outlined,
                labelText: translation(context).nameE,
              ),
              CoustemTextFieldAuth(
                auto: AutovalidateMode.always,
                valid: (val) {
                  return validinput(val!, 5, 100, "email");
                },
                mycontroller: emailController,
                hintText: translation(context).emailHint,
                iconData: Icons.email_outlined,
                labelText: translation(context).email,
              ),
              CoustemTextFieldAuth(
                auto: AutovalidateMode.always,
                valid: (val) {
                  return validinput(val!, 5, 30, "password");
                },
                mycontroller: passController,
                hintText: translation(context).passwordHint,
                iconData: Icons.lock_outlined,
                labelText: translation(context).password,
                obscureText: true,
              ),
              CoustemTextFieldAuth(
                auto: AutovalidateMode.always,
                valid: (val) {
                  return validinput(val!, 5, 20, "Address");
                },
                mycontroller: addressController,
                hintText: translation(context).addressHint,
                iconData: Icons.home_outlined,
                labelText: translation(context).address,
              ),
              CoustemTextFieldAuth(
                mycontroller: phoneController,
                auto: AutovalidateMode.always,
                valid: (val) {
                  return validinput(val!, 10, 10, "Phone Number");
                },
                hintText: translation(context).numberHint,
                iconData: Icons.phone,
                labelText: translation(context).number,
              ),
              CoustemTextFieldAuth(
                mycontroller: experienceController,
                auto: AutovalidateMode.always,
                valid: (val) {
                  return validinput(val!, 1, 20, "Experience");
                },
                hintText: translation(context).experiencesHint,
                iconData: Icons.info_outline,
                labelText: translation(context).experiences,
              ),
              CoustemTextFieldAuth(
                mycontroller: walletController,
                auto: AutovalidateMode.always,
                valid: (val) {
                  return validinput(val!, 5, 30, "wallet");
                },
                hintText: translation(context).walletHint,
                iconData: Icons.attach_money_outlined,
                labelText: translation(context).wallet,
                obscureText: true,
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
                            hintText: translation(context).selectCounseling,
                            hintStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300),
                            floatingLabelBehavior:
                            FloatingLabelBehavior.always,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 30),
                            suffixIcon: Icon(Icons.question_mark_outlined),
                            label: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 9),
                              child:  Text(translation(context).consulting),
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
                          onChanged: (value) {
                            print('//////////////////');
                            print(value);
                            setState(() {
                              _Counsv = value;
                              print(_Counsv);
                              if(_Counsv=="mediacl"){
                                num=1;
                              }
                              if(_Counsv=="carrer"){
                                num=2;
                              }
                              if(_Counsv=="psychological"){
                                num=3;
                              }
                              if(_Counsv=="family"){
                                num=4;
                              }
                              if(_Counsv=="bussnies"){
                                num=5;
                              }
                            });


                          }
                          ,

                          items: _Couns.map((value) {
                            return DropdownMenuItem(
                                value: value, child: Text(value));
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 30.0,
              ),
              SizedBox(height: 20),

              CoustemButtonAuth(
                text: translation(context).next,
                onPressed: () {
                  ExpertSignUpCubit.get(context).ExpertSignUp(
                  name_ar:ar_nameController.text,
                  name_en:en_nameController.text,
                  email: emailController.text,
                  password: passController.text,
                  addresses: addressController.text,
                  phone: phoneController.text,
                  experience: experienceController.text,
                  wallet: walletController.text,
                  consulting_id: num,


                );


                },
              ),
            ],
          ),
        ),
      );
  }),
  ),
  );
}
}


bool isPasswordCompliant(String password, [int minLength = 8]) {
  if (password.isEmpty) {
    return false;
  }

  bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
  bool hasDigits = password.contains(RegExp(r'[0-9]'));
  bool hasLowercase = password.contains(RegExp(r'[a-z]'));
  bool hasSpecialCharacters =
  password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool hasMinLength = password.length > minLength;

  return (hasDigits ||
      hasUppercase ||
      hasLowercase ||
      hasSpecialCharacters) &&
      hasMinLength;
}