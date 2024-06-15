import 'package:tobeto_mobile_app/model/user_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final UserModel user;
  final List<ExperienceModel>? experiences;
  final List<EducationModel>? educations;
  final CompetencyModel? competencies;
  final List<CertificateModel>? certificates;
  final List<CommunityModel>? communities;
  final List<ProjectOrAwardModel>? projectsAndAwards;
  final MediaAccountModel? mediaAccounts;
  final List<ForeignLanguageModel>? foreignLanguages;

  UserLoaded({
    required this.user,
    this.experiences,
    this.educations,
    this.competencies,
    this.certificates,
    this.communities,
    this.projectsAndAwards,
    this.mediaAccounts,
    this.foreignLanguages,
  });
}

class UserError extends UserState {
  final String message;

  UserError(this.message);
}
