import 'package:flutter/material.dart';
import 'package:the_consultant/layout/home_layout.dart';
import 'package:the_consultant/modules/profile.dart';
import 'package:the_consultant/modules/usersignup.dart';

import '../shared/components/coustemtextboudyauth.dart';
import '../shared/components/coustemtextfieldauth.dart';
import '../shared/components/coustemtexttilteauth.dart';
import '../shared/components/coustmebuttonsauth.dart';
import '../shared/components/textsignuo.dart';
import '../shared/function/validinput.dart';
import 'expertsignup.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var people= "User";

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
          'Sign In',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formstate,
          child: ListView(
            children: [
              Container(
                height: 300,
                width: 500,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("images/pic.png"),
                  fit: BoxFit.fill,
                )),
              ),
              const SizedBox(height: 10),
              const CoustemTextTilteAuth(text: "Welcome Back"),
              const CoustemTextBoudyAuth(
                text: 'Sign In with your email and password as:',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "User",
                  ),

                  Radio(

                      value: "User",
                      groupValue: people,
                      onChanged: (val) {
                        setState(() {
                          people = "User";
                        });
                      }),
                  const Text("Expert"),
                  Radio(
                      value: "Expert",
                      groupValue: people,
                      onChanged: (val) {
                        setState(() {
                          people = "Expert";
                        });
                      })
                ],
              ),
              const SizedBox(height: 20),
              CoustemTextFieldAuth(
                valid: (val) {
                  return validinput(val!, 5, 100, "email");
                },
                hintText: "Enter your Email",
                iconData: Icons.email_outlined,
                labelText: "Email",
                auto: AutovalidateMode.always,
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
              const SizedBox(height: 20),
              CoustemButtonAuth(
                text: "Sign In",
                onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomeLayout()),
                );
  },
                 // loginn(),
              ),
              const SizedBox(height: 20),
              textSignUp(
                  textone: "if you don't have account  ?  ",
                  texttwo: "Sign Up",
                  onTap: () {
                    if (people == "User") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserSignUp()),
                      );
                    } else if (people == "Expert") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ExpertSignUp()),
                      );
                    } ;
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
