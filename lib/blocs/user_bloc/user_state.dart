import 'package:tobeto_mobile_app/model/user_model.dart';

abstract class UserState {
  const UserState();
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final UserModel user;

  const UserLoaded(this.user);
}

class UserError extends UserState {
  final String message;

  const UserError(this.message);
}
