abstract class UserState {
  const UserState();
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {}

class UserUpdated extends UserState {}

class UserError extends UserState {
  final String message;

  const UserError(this.message);
}

class UploadUserData extends UserState {}

class FileFormatDontMatch extends UserState {}

class UserFileUploaded extends UserState {}
