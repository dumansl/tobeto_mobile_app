// bloc/user_bloc.dart

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:tobeto_mobile_app/model/user_model.dart';
import 'package:tobeto_mobile_app/services/user_services.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserServices userRepository = UserServices();

  UserBloc() : super(UserInitial()) {
    on<FetchUserData>(_onFetchUserData);
  }

  void _onFetchUserData(FetchUserData event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      UserModel? userData = await userRepository.getUserData();
      if (userData != null) {
        emit(UserLoaded(userData));
      } else {
        emit(UserError("Kullanıcı verisi bulunamadı."));
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(UserError(e.toString()));
    }
  }
}
