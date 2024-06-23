import 'dart:io';

abstract class ProfilePhotoEvent {
  const ProfilePhotoEvent();
}

class LoadProfilePhoto extends ProfilePhotoEvent {}

class UpdateProfilePhoto extends ProfilePhotoEvent {
  final File image;

  const UpdateProfilePhoto(this.image);
}
