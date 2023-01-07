import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_consultant/network/remote/dio.dart';

import '../models/login_model_user.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  UserLoginCubit() : super(InitState());
  LoginModelUser  ? loginModelUser;
  static UserLoginCubit get(context) => BlocProvider.of(context);

  void Userlogin({
    required email,
    required password,
  }) {
    emit(LoadingState());
    DioHelper.postData(url: 'user/login', data: {
      'email': email,
      'password': password,
    }).then((value) {
      print('succes');
      loginModelUser=LoginModelUser .fromJson(value.data);
      if(loginModelUser!=null)
        print('signInModel_dataUser_id=${loginModelUser!}');
      emit(UserLoginSuccess(data:loginModelUser!));
    }).catchError((onError) {
      print(onError.toString());
      emit(ErrorState());
    });
  }
}

abstract class UserLoginState {}

class InitState extends UserLoginState {}

class LoadingState extends UserLoginState {}

class UserLoginSuccess extends UserLoginState {
  LoginModelUser   data;

  UserLoginSuccess({required this.data});


}

class ErrorState extends UserLoginState {}
