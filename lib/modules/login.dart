import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_consultant/bloc/Login_Cubit/login_cubit.dart';
import 'package:the_consultant/modules/usersignup.dart';
import 'package:the_consultant/shared/function/validinput.dart';
import '../layout/home_layout.dart';
import '../shared/components/coustemtextboudyauth.dart';
import '../shared/components/coustemtextfieldauth.dart';
import '../shared/components/coustemtexttilteauth.dart';
import '../shared/components/coustmebuttonsauth.dart';
import '../shared/components/textsignuo.dart';
import 'expertsignup.dart';



class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var people= "User";

  var emailController=TextEditingController();

  var passController=TextEditingController();

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
          'Sign In',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context)=>LoginCubit(),
        child: BlocConsumer<LoginCubit,LoginState>(
          listener: (context,state){
            if(state is LoginSuccess)
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeLayout()));
            }
          },
          builder: (context,state){
            return Container(
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
                      mycontroller: emailController,
                      valid: (val) {
                        return validinput(val!, 5, 100, "email");
                      },
                      hintText: "Enter your Email",
                      iconData: Icons.email_outlined,
                      labelText: "Email",
                      auto: AutovalidateMode.always,

                    ),
                    CoustemTextFieldAuth(
                      mycontroller: passController,
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
                      onPressed: () {

                        LoginCubit.get(context).login(email: emailController.text, password: passController.text)
            ;          }

                    ),
                    const SizedBox(height: 20),

                    textSignUp(
                        textone: "if you don't have account  ?  ",
                        texttwo: "Sing Up",
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
            );
          },
        )
      ),
    );
  }
}
