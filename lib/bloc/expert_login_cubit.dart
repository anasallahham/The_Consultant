import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_consultant/network/remote/dio.dart';

import '../models/login_model_expert.dart';

class ExpertLoginCubit extends Cubit<ExpertLoginState> {
  ExpertLoginCubit() : super(InitState());
      LoginModel  ? loginModel;
  static ExpertLoginCubit get(context) => BlocProvider.of(context);

  void Expertlogin({
    required email,
    required password,
  }) {
    emit(LoadingState());
    DioHelper.postData(url: 'expert/login', data: {
      'email': email,
      'password': password,
    }).then((value) {
      print('succes');
      loginModel=LoginModel.fromJson(value.data);
      if(loginModel!=null)
        print('signInModel_dataUser_id=${loginModel!}');
      emit(ExpertLoginSuccess(data:loginModel! ));
    }).catchError((onError) {
      print(onError.toString());
      emit(ErrorState());
    });
  }
}

abstract class ExpertLoginState {}

class InitState extends ExpertLoginState {}

class LoadingState extends ExpertLoginState {}

class ExpertLoginSuccess extends ExpertLoginState {
  LoginModel  data;

  ExpertLoginSuccess({required this.data});

}

class ErrorState extends ExpertLoginState {}
