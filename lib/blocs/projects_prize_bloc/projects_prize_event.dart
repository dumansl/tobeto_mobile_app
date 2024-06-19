abstract class ProjectsPrizeEvent {}

class LoadProjectsPrize extends ProjectsPrizeEvent {}

class AddProjectsPrize extends ProjectsPrizeEvent {
  final Map<String, dynamic> projects;

  AddProjectsPrize(this.projects);
}

class RemoveProjectsPrize extends ProjectsPrizeEvent {
  Map<String, dynamic> projects;

  RemoveProjectsPrize(this.projects);
}
