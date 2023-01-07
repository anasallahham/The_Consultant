import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_consultant/network/remote/dio.dart';

import '../models/login_model_expert.dart';
import '../models/scan_model.dart';

/*
class ScanCubit extends Cubit<ScanState> {
  ScanCubit() : super(InitState());
  ScanModel  ? scanModel;
  static ScanCubit get(context) => BlocProvider.of(context);

  void Scan({
    required email,
    required password,
  }) {
    emit(LoadingState());
    DioHelperSec.getData(url: 'expert/login', data: {
      'email': email,
      'password': password,
    }).then((value) {
      print('succes');
      loginModel=LoginModel.fromJson(value.data);
      if(loginModel!=null)
        print('signInModel_dataUser_id=${loginModel!}');
      emit(ScanSuccess(data:loginModel! ));
    }).catchError((onError) {
      print(onError.toString());
      emit(ErrorState());
    });
  }
}

abstract class ScanState {}

class InitState extends ScanState {}

class LoadingState extends ScanState {}

class ScanSuccess extends ScanState {
  LoginModel  data;

  ScanSuccess({required this.data});

}

class ErrorState extends ExpertLoginState {}

 */
