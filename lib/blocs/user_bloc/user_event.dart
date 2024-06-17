import 'package:flutter/material.dart';

abstract class UserEvent {}

class LoadUserData extends UserEvent {}

class UpdateUserData extends UserEvent {}

class UploadUserDAte extends UserEvent {
  final BuildContext context;

  UploadUserDAte(this.context);
}

class AddWorkLife extends UserEvent {
  final Map<String, dynamic> workLifeData;

  AddWorkLife(this.workLifeData);
}

class RemoveWorkLife extends UserEvent {
  final Map<String, dynamic> workLifeData;

  RemoveWorkLife(this.workLifeData);
}

class AddSkill extends UserEvent {
  final String skill;

  AddSkill(this.skill);
}

class RemoveSkill extends UserEvent {
  final String skill;

  RemoveSkill(this.skill);
}
