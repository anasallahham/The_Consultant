import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_consultant/bloc/Login_Cubit/state.dart';
//import 'package:project/model/login_model.dart';
import 'package:the_consultant/shared/network/remote/dio.dart';

class LoginCubit extends Cubit<LoginState>
{

  LoginCubit():super(InitState());

  static LoginCubit get(context)=>BlocProvider.of(context);

 // LoginModel ? loginModel;

  void login(
  {
  required email,
  required password,
}){
    emit(LoadingState());
    DioHelper.postData(url: '/login', data: {
      'username':email,
      'password':password,
    }).then((value) {
      //loginModel=LoginModel.fromJson(value.data);
      //emit(LoginSuccess(loginModel!));

    }).catchError((onError)
    {

      print(onError.toString());
      emit(ErrorState());
    });
  }
  void print(String message)
  {print(message);}

  IconData suffix=Icons.visibility_off_outlined;

  bool isPassword=true;

  void password()
  {
   isPassword=!isPassword;
   suffix=isPassword?Icons.visibility_off_outlined:Icons.visibility_outlined;
   emit(ChangePassword());
  }






  }
