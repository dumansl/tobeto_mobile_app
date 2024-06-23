import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/blocs/profile_photo_bloc/profile_photo_event.dart';
import 'package:tobeto_mobile_app/blocs/profile_photo_bloc/profile_photo_state.dart';
import 'package:tobeto_mobile_app/services/user_service.dart';

class ProfilePhotoBloc extends Bloc<ProfilePhotoEvent, ProfilePhotoState> {
  final UserService userService;

  ProfilePhotoBloc(this.userService) : super(ProfilePhotoInitial()) {
    on<LoadProfilePhoto>(_onLoadProfilePhoto);
    on<UpdateProfilePhoto>(_onUpdateProfilePhoto);
  }

  void _onLoadProfilePhoto(LoadProfilePhoto event, Emitter<ProfilePhotoState> emit) async {
    emit(ProfilePhotoLoading());
    try {
      final String imageUrl = await userService.getPhoto();
      emit(ProfilePhotoLoaded(imageUrl));
    } catch (e) {
      debugPrint(e.toString());
      emit(ProfilePhotoError(e.toString()));
    }
  }

  void _onUpdateProfilePhoto(UpdateProfilePhoto event, Emitter<ProfilePhotoState> emit) async {
    emit(ProfilePhotoLoading());
    try {
      final String imageUrl = await userService.updateProfilePhoto(event.image);
      emit(ProfilePhotoUpdated());
      emit(ProfilePhotoLoaded(imageUrl));
    } catch (e) {
      emit(ProfilePhotoError(e.toString()));
    }
  }
}
