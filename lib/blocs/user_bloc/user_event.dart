import 'package:tobeto_mobile_app/model/user_model.dart';

abstract class UserEvent {}

class FetchUserData extends UserEvent {}

class UpdateUser extends UserEvent {
  final UserModel user;

  UpdateUser(this.user);
}

class AddExperience extends UserEvent {
  final ExperienceModel experience;

  AddExperience(this.experience);
}

class UpdateExperience extends UserEvent {
  final String experienceId;
  final ExperienceModel experience;

  UpdateExperience(this.experienceId, this.experience);
}

class DeleteExperience extends UserEvent {
  final String experienceId;

  DeleteExperience(this.experienceId);
}

class AddEducation extends UserEvent {
  final EducationModel education;

  AddEducation(this.education);
}

class UpdateEducation extends UserEvent {
  final String educationId;
  final EducationModel education;

  UpdateEducation(this.educationId, this.education);
}

class DeleteEducation extends UserEvent {
  final String educationId;

  DeleteEducation(this.educationId);
}

class UpdateCompetencies extends UserEvent {
  final CompetencyModel competencies;

  UpdateCompetencies(this.competencies);
}

class AddCertificate extends UserEvent {
  final CertificateModel certificate;

  AddCertificate(this.certificate);
}

class UpdateCertificate extends UserEvent {
  final String certificateId;
  final CertificateModel certificate;

  UpdateCertificate(this.certificateId, this.certificate);
}

class DeleteCertificate extends UserEvent {
  final String certificateId;

  DeleteCertificate(this.certificateId);
}

class AddCommunity extends UserEvent {
  final CommunityModel community;

  AddCommunity(this.community);
}

class UpdateCommunity extends UserEvent {
  final String communityId;
  final CommunityModel community;

  UpdateCommunity(this.communityId, this.community);
}

class DeleteCommunity extends UserEvent {
  final String communityId;

  DeleteCommunity(this.communityId);
}

class AddProjectOrAward extends UserEvent {
  final ProjectOrAwardModel projectOrAward;

  AddProjectOrAward(this.projectOrAward);
}

class UpdateProjectOrAward extends UserEvent {
  final String projectOrAwardId;
  final ProjectOrAwardModel projectOrAward;

  UpdateProjectOrAward(this.projectOrAwardId, this.projectOrAward);
}

class DeleteProjectOrAward extends UserEvent {
  final String projectOrAwardId;

  DeleteProjectOrAward(this.projectOrAwardId);
}

class UpdateMediaAccounts extends UserEvent {
  final MediaAccountModel mediaAccounts;

  UpdateMediaAccounts(this.mediaAccounts);
}

class AddForeignLanguage extends UserEvent {
  final ForeignLanguageModel foreignLanguage;

  AddForeignLanguage(this.foreignLanguage);
}

class UpdateForeignLanguage extends UserEvent {
  final String foreignLanguageId;
  final ForeignLanguageModel foreignLanguage;

  UpdateForeignLanguage(this.foreignLanguageId, this.foreignLanguage);
}

class DeleteForeignLanguage extends UserEvent {
  final String foreignLanguageId;

  DeleteForeignLanguage(this.foreignLanguageId);
}
