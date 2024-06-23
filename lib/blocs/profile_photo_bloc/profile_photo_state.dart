abstract class ProfilePhotoState {
  const ProfilePhotoState();
}

class ProfilePhotoInitial extends ProfilePhotoState {}

class ProfilePhotoLoading extends ProfilePhotoState {}

class ProfilePhotoLoaded extends ProfilePhotoState {
  final String imageUrl;

  const ProfilePhotoLoaded(this.imageUrl);
}

class ProfilePhotoUpdated extends ProfilePhotoState {}

class ProfilePhotoError extends ProfilePhotoState {
  final String message;

  const ProfilePhotoError(this.message);
}
