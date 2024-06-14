import 'package:flutter/material.dart';

abstract class UserEvent {}

class LoadUserData extends UserEvent {}

class UpdateUserData extends UserEvent {}

class UploadUserDAte extends UserEvent {
  final BuildContext context;

  UploadUserDAte(this.context);
}
