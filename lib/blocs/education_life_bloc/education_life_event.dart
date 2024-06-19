abstract class EducationLifeEvent {}

class LoadEducationLife extends EducationLifeEvent {}

class AddEducationLife extends EducationLifeEvent {
  final Map<String, dynamic> education;

  AddEducationLife(this.education);
}

class RemoveEducationLife extends EducationLifeEvent {
  Map<String, dynamic> education;

  RemoveEducationLife(this.education);
}
