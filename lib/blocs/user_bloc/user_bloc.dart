import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:equatable/equatable.dart';
import 'package:tobeto_mobile_app/repositories/user_repository.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/screen/personal_information.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<LoadUserData>(_onLoadUserData);
    on<UpdateUserData>(_onUpdateUserData);
  }

  final userId = FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore db = FirebaseFirestore.instance;

  void _onLoadUserData(LoadUserData event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      userRepository.getData();
      emit(UserLoaded());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  void _onUpdateUserData(UpdateUserData event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      userRepository.uploadProfileEdit();
      // Veriyi güncelledikten sonra tekrar yükle
      userRepository.getData();
      emit(UserLoaded());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
