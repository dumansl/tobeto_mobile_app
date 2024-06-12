import 'package:equatable/equatable.dart';
import 'package:tobeto_mobile_app/model/user_model.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUserData extends UserEvent {}

class UpdateUserData extends UserEvent {}
