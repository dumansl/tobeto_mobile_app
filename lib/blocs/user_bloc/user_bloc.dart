import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:tobeto_mobile_app/model/user_model.dart';
import 'package:tobeto_mobile_app/services/user_repository.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository = UserRepository();

  UserBloc() : super(UserInitial()) {
    on<LoadUserData>(_onLoadUserData);
    on<UpdateUserData>(_onUpdateUserData);
    // on<UploadUserDAte>(_onUploadFile);
  }

  final userId = FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore db = FirebaseFirestore.instance;

  void _onLoadUserData(LoadUserData event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final UserModel? userModel = await userRepository.getData();
      emit(UserLoaded(userModel: userModel));
    } catch (e) {
      debugPrint(e.toString());
      emit(UserError(e.toString()));
    }
  }

  void _onUpdateUserData(UpdateUserData event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      await userRepository.updateProfileEdit();
      // Veriyi güncelledikten sonra tekrar yükle
      final UserModel? userModel = await userRepository.getData();
      emit(UserUpdated());
      emit(UserLoaded(userModel: userModel));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  // void _onUploadFile(UploadUserDAte event, Emitter<UserState> emit) async {
  //   emit(UserLoading());
  //   try {
  //     await userRepository.uploadFile(event.context);
  //     await userRepository.getData();
  //     emit(UserFileUploaded());
  //   } catch (e) {
  //     emit(UserError(e.toString()));
  //   }
  // }
}
