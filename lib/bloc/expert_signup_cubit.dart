import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_consultant/models/register_model_expert.dart';
import 'package:the_consultant/network/remote/dio.dart';

class ExpertSignUpCubit extends Cubit<ExpertSignUpState> {
  ExpertSignUpCubit() : super(InitState());
  RegisterModelExpert ? registerModel;
  static ExpertSignUpCubit get(context) => BlocProvider.of(context);

  void ExpertSignUp({
    required name_en,
    required name_ar,
    required email,
    required password,
    required addresses,
    required phone,
    required experience,
    required consulting_id,
    required wallet,

  }) {
    emit(LoadingState());
    DioHelper.postData(url: 'expert/register', data: {
      'name_en': name_en,
      'name_ar': name_ar,
      'email': email,
      'password': password,
      'address': addresses,
      'phone': phone,
      'experiences': experience,
      'wallet': wallet,
      'consulting_id': consulting_id,


    }).then((value) {
      print('succes');
      registerModel=RegisterModelExpert.fromJson(value.data);
      if(registerModel!.user!=null)
        print('signInModel_dataUser_id=${registerModel!.user}');
      emit(ExpertSignUpSuccess(data:registerModel! ));
    }).catchError((onError) {
      print(onError.toString());
      emit(ErrorState());
    });
  }
}

abstract class ExpertSignUpState {}

class InitState extends ExpertSignUpState {}

class LoadingState extends ExpertSignUpState {}

class ExpertSignUpSuccess extends ExpertSignUpState {
  RegisterModelExpert data;

  ExpertSignUpSuccess({required this.data});
}

class ErrorState extends ExpertSignUpState {}