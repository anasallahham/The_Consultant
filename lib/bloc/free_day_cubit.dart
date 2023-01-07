import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:the_consultant/network/remote/dio.dart';


import '../models/free_day_model.dart';

class FreeDayCubit extends Cubit<FreeDayState> {
  FreeDayCubit() : super(InitState());
  FreeDayModel? freeDayModel;
  static FreeDayCubit get(context) => BlocProvider.of(context);

  void FreeDay({
    required day,
    required start_time,
    required end_time,
  }) {
    emit(LoadingState());
    DioHelper.postData(url: 'expert/free_day', data: {
      'day': day,
      'start_time': start_time,
      'end_time': end_time,
    }).then((value) {
      print('succes');
      freeDayModel= FreeDayModel .fromJson(value.data);
      if(freeDayModel!=null)
        print('signInModel_dataUser_id=${freeDayModel!}');
      emit(FreeDaySuccess(data:freeDayModel!));
    }).catchError((onError) {
      print(onError.toString());
      emit(ErrorState());
    });
  }
}

abstract class FreeDayState {}

class InitState extends FreeDayState {}

class LoadingState extends FreeDayState {}

class FreeDaySuccess extends FreeDayState {
  FreeDayModel data;

  FreeDaySuccess({required this.data});

}

class ErrorState extends FreeDayState {}
