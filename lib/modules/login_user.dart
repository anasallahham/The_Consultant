import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_consultant/bloc/user_login_cubit.dart';
import 'package:the_consultant/core/function/validinput.dart';
import 'package:the_consultant/modules/usersignup.dart';
import 'package:the_consultant/shared/components/coustemtextboudyauth.dart';
import 'package:the_consultant/shared/components/coustemtextfieldauth.dart';
import 'package:the_consultant/shared/components/coustemtexttilteauth.dart';
import 'package:the_consultant/shared/components/coustmebuttonsauth.dart';
import 'package:the_consultant/shared/components/textsignuo.dart';

import '../../network/local/cache.dart';
import 'package:the_consultant/layout/home_layout.dart';


class LoginUser extends StatefulWidget {
  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {

  var emailController=TextEditingController();

  var passController=TextEditingController();
  CacheHelper? prefs;
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
        title: const Text(
          'User Sign In',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: BlocProvider<UserLoginCubit>(
          create: (context) => UserLoginCubit(),
          child: BlocConsumer<UserLoginCubit, UserLoginState>(
            listener: (context, state) {
              if (state is UserLoginSuccess) {
                CacheHelper.saveData(
                    key: 'token',
                    value: state.data.token);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomeLayout()));
              }
            }, builder: (context, state) {
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
                    CoustemTextTilteAuth(text: "Welcome Back"),
                    const CoustemTextBoudyAuth(
                      text: 'Sign In with your email and password ',
                    ),
                    const SizedBox(height: 30),
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
                          UserLoginCubit.get(context).Userlogin(
                              email: emailController.text,
                              password: passController.text)
                          ;
                        }

                    ),
                    const SizedBox(height: 20),

                    textSignUp(
                        textone: "if you don't have account  ?  ",
                        texttwo: "Sing Up",
                        onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UserSignUp()),
                            );

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
