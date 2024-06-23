import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:tobeto_mobile_app/model/user_model.dart';
import 'package:tobeto_mobile_app/services/user_service.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserService userService = UserService();

  UserBloc() : super(UserInitial()) {
    on<LoadUserData>(_onLoadUserData);
    on<UpdateUserData>(_onUpdateUserData);
  }

  void _onLoadUserData(LoadUserData event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final UserModel? userModel = await userService.getData();
      emit(UserLoaded(userModel: userModel));
    } catch (e) {
      debugPrint(e.toString());
      emit(UserError(e.toString()));
    }
  }

  void _onUpdateUserData(UpdateUserData event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      await userService.updateProfileEdit();
      final UserModel? userModel = await userService.getData();
      emit(UserUpdated());
      emit(UserLoaded(userModel: userModel));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
