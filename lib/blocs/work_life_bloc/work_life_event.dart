abstract class WorkLifeEvent {}

class LoadWorkLife extends WorkLifeEvent {}

class AddWorkLife extends WorkLifeEvent {
  final Map<String, dynamic> works;

  AddWorkLife(this.works);
}

class RemoveWorkLife extends WorkLifeEvent {
  Map<String, dynamic> works;

  RemoveWorkLife(this.works);
}
