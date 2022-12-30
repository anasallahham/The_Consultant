import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_consultant/bloc/Login_Cubit/login_cubit.dart';
import 'package:the_consultant/language/language_constants.dart';
import 'package:the_consultant/modules/usersignup.dart';
import 'package:the_consultant/shared/function/validinput.dart';
import '../bloc/Login_Cubit/state.dart';
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
        title:  Text(
          translation(context).signIn,
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
                            image: AssetImage("assets/images/login.png"),
                            fit: BoxFit.fill,
                          )),
                    ),
                    const SizedBox(height: 10),
                     CoustemTextTilteAuth(text: translation(context).welcome),
                     CoustemTextBoudyAuth(
                      text: translation(context).login1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text(
                          translation(context).user,
                        ),

                        Radio(

                            value: "User",
                            groupValue: people,
                            onChanged: (val) {
                               setState(() {
                            people = "User";
                          });
                            }),
                         Text(translation(context).expert),
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
                      hintText: translation(context).emailHint,
                      iconData: Icons.email_outlined,
                      labelText: translation(context).email,
                      auto: AutovalidateMode.always,

                    ),
                    CoustemTextFieldAuth(
                      mycontroller: passController,
                      auto: AutovalidateMode.always,
                      valid: (val) {
                        return validinput(val!, 5, 30, "password");
                      },
                      hintText: translation(context).passwordHint,
                      iconData: Icons.lock_outlined,
                      labelText: translation(context).password,
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    CoustemButtonAuth(
                      text: translation(context).signIn,
                      onPressed: () {
                        LoginCubit.get(context).login(email: emailController.text, password: passController.text);
                     }
                    ),
                    const SizedBox(height: 20),
                    textSignUp(
                        textone: translation(context).login2,
                        texttwo: translation(context).signUp,
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
