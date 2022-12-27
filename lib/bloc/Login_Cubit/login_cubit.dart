

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itproject/network/remote/dio.dart';

class LoginCubit extends Cubit<LoginState>
{

  LoginCubit():super(InitState());

  static LoginCubit get(context)=>BlocProvider.of(context);



  void login(
      {
        required email,
        required password,
      }){


    emit(LoadingState());
    DioHelper.postData(url:'user/login', data: {
      'email':email,
      'password':password,
    }).then((value) {
print('succes');
emit(LoginSuccess());

    }).catchError((onError)
    {

      print(onError.toString());
      emit(ErrorState());
    });
  }








}



abstract class LoginState{}

class InitState extends LoginState{}


class LoadingState extends LoginState{}


class LoginSuccess extends LoginState{

}

class ErrorState extends LoginState{}





