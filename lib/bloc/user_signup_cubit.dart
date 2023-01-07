import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_consultant/network/remote/dio.dart';

import '../models/register_model_user.dart';

class UserSignUpCubit extends Cubit<UserSignUpState> {
  UserSignUpCubit() : super(InitState());
  RegisterModelUser ? registerModelUser;
  static UserSignUpCubit get(context) => BlocProvider.of(context);

  void UserSignUp({
    required name,
    required email,
    required password,
    required wallet,
  }) {
    emit(LoadingState());
    DioHelper.postData(url: 'user/register', data: {
      'name': name,
      'email': email,
      'password': password,
      'wallet': wallet,
    }).then((value) {
      print('succes');
      registerModelUser=RegisterModelUser.fromJson(value.data);
      if(registerModelUser!.user!=null)
        print('signInModel_dataUser_id=${registerModelUser!.user}');
      emit(UserSignUpSuccess(data:registerModelUser!));
    }).catchError((onError) {
      print(onError.toString());
      emit(ErrorState());
    });
  }
}

abstract class UserSignUpState {}

class InitState extends UserSignUpState {}

class LoadingState extends UserSignUpState {}

class UserSignUpSuccess extends UserSignUpState {
  RegisterModelUser data;

 UserSignUpSuccess({required this.data});
}

class ErrorState extends UserSignUpState {}
