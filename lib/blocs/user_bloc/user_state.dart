import 'package:tobeto_mobile_app/model/user_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final UserModel user;
  final List<ExperienceModel> experiences;
  final EducationModel education;
  final CompetencyModel competencies;
  final List<CertificateModel> certificates;
  final List<CommunityModel> communities;
  final List<ProjectOrAwardModel> projectsAndAwards;
  final MediaAccountModel mediaAccounts;
  final ForeignLanguageModel foreignLanguages;

  UserLoaded({
    required this.user,
    required this.experiences,
    required this.education,
    required this.competencies,
    required this.certificates,
    required this.communities,
    required this.projectsAndAwards,
    required this.mediaAccounts,
    required this.foreignLanguages,
  });
}

class UserError extends UserState {
  final String message;

  UserError(this.message);
}
