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

  var _Timev;
  var _Timeve;

  List _Time = [
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
  var selected_day;
  var start_time;

  //bool selected_time = false;
  bool sat = false,
      sun = false,
      mon = false,
      tue = false,
      wed = false,
      thu = false,
      fri = false,
      medical = false,
      law = false,
      education = false,
      economy = false,
      family = false;

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
               CoustemTextTilteAuth(text: "New Account For Expert"),
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
              Container(
                width: 300,
                height: 375,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey.shade400),
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Column(children: [
                    Text("Select Counseling Type",
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
                            title: Text("Medical"),
                            value: medical,
                            onChanged: (value) {
                              setState(() {
                                medical = value!;
                              });
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
                            title: Text("Law"),
                            value: law,
                            onChanged: (value) {
                              setState(() {
                                law = value!;
                              });
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
                            title: Text("Education"),
                            value: education,
                            onChanged: (value) {
                              setState(() {
                                education = value!;
                              });
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
                            title: Text("Economy"),
                            value: economy,
                            onChanged: (value) {
                              setState(() {
                                economy = value!;
                              });
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
                            title: Text("Family"),
                            value: family,
                            onChanged: (value) {
                              setState(() {
                                family = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),



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
