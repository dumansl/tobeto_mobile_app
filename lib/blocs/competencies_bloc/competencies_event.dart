abstract class CompetenciesEvent {}

class LoadSkills extends CompetenciesEvent {}

class AddSkill extends CompetenciesEvent {
  final String skill;

  AddSkill(this.skill);
}

class RemoveSkill extends CompetenciesEvent {
  final String skill;

  RemoveSkill(this.skill);
}
