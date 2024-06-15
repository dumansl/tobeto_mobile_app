import 'package:bloc/bloc.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_event.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_state.dart';
import 'package:tobeto_mobile_app/services/user_services.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserServices _userServices = UserServices();

  UserBloc() : super(UserInitial()) {
    on<FetchUserData>(_onFetchUserData);
    on<UpdateUser>(_onUpdateUser);
    on<AddExperience>(_onAddExperience);
    on<UpdateExperience>(_onUpdateExperience);
    on<DeleteExperience>(_onDeleteExperience);
    on<AddEducation>(_onAddEducation);
    on<UpdateEducation>(_onUpdateEducation);
    on<DeleteEducation>(_onDeleteEducation);
    on<UpdateCompetencies>(_onUpdateCompetencies);
    on<AddCertificate>(_onAddCertificate);
    on<UpdateCertificate>(_onUpdateCertificate);
    on<DeleteCertificate>(_onDeleteCertificate);
    on<AddCommunity>(_onAddCommunity);
    on<UpdateCommunity>(_onUpdateCommunity);
    on<DeleteCommunity>(_onDeleteCommunity);
    on<AddProjectOrAward>(_onAddProjectOrAward);
    on<UpdateProjectOrAward>(_onUpdateProjectOrAward);
    on<DeleteProjectOrAward>(_onDeleteProjectOrAward);
    on<UpdateMediaAccounts>(_onUpdateMediaAccounts);
    on<AddForeignLanguage>(_onAddForeignLanguage);
    on<UpdateForeignLanguage>(_onUpdateForeignLanguage);
    on<DeleteForeignLanguage>(_onDeleteForeignLanguage);
  }

  Future<void> _onFetchUserData(
      FetchUserData event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading());
      final user = await _userServices.getUserData();
      final experiences = await _userServices.getUserExperiences();
      final educations = await _userServices.getUserEducation();
      final competencies = await _userServices.getUserCompetencies();
      final certificates = await _userServices.getUserCertificates();
      final communities = await _userServices.getUserCommunities();
      final projectsAndAwards = await _userServices.getUserProjectsAndAwards();
      final mediaAccounts = await _userServices.getUserMediaAccounts();
      final foreignLanguages = await _userServices.getUserForeignLanguages();

      emit(UserLoaded(
        user: user!,
        experiences: experiences,
        educations: educations,
        competencies: competencies,
        certificates: certificates,
        communities: communities,
        projectsAndAwards: projectsAndAwards,
        mediaAccounts: mediaAccounts,
        foreignLanguages: foreignLanguages,
      ));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onUpdateUser(UpdateUser event, Emitter<UserState> emit) async {
    try {
      await _userServices.updateUserData(event.user);
      add(FetchUserData());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onAddExperience(
      AddExperience event, Emitter<UserState> emit) async {
    try {
      await _userServices.addUserExperience(event.experience);
      add(FetchUserData());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onUpdateExperience(
      UpdateExperience event, Emitter<UserState> emit) async {
    try {
      await _userServices.updateUserExperience(
          event.experienceId, event.experience);
      add(FetchUserData());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onDeleteExperience(
      DeleteExperience event, Emitter<UserState> emit) async {
    try {
      await _userServices.deleteUserExperience(event.experienceId);
      add(FetchUserData());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onAddEducation(
      AddEducation event, Emitter<UserState> emit) async {
    try {
      await _userServices.addUserEducation(event.education);
      add(FetchUserData());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onUpdateEducation(
      UpdateEducation event, Emitter<UserState> emit) async {
    try {
      await _userServices.updateUserEducation(
          event.educationId, event.education);
      add(FetchUserData());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onDeleteEducation(
      DeleteEducation event, Emitter<UserState> emit) async {
    try {
      await _userServices.deleteUserEducation(event.educationId);
      add(FetchUserData());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onUpdateCompetencies(
      UpdateCompetencies event, Emitter<UserState> emit) async {
    try {
      await _userServices.updateUserCompetencies(event.competencies);
      add(FetchUserData());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onAddCertificate(
      AddCertificate event, Emitter<UserState> emit) async {
    try {
      await _userServices.addUserCertificate(event.certificate);
      add(FetchUserData());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onUpdateCertificate(
      UpdateCertificate event, Emitter<UserState> emit) async {
    try {
      await _userServices.updateUserCertificate(
          event.certificateId, event.certificate);
      add(FetchUserData());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onDeleteCertificate(
      DeleteCertificate event, Emitter<UserState> emit) async {
    try {
      await _userServices.deleteUserCertificate(event.certificateId);
      add(FetchUserData());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onAddCommunity(
      AddCommunity event, Emitter<UserState> emit) async {
    try {
      await _userServices.addUserCommunity(event.community);
      add(FetchUserData());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onUpdateCommunity(
      UpdateCommunity event, Emitter<UserState> emit) async {
    try {
      await _userServices.updateUserCommunity(
          event.communityId, event.community);
      add(FetchUserData());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onDeleteCommunity(
      DeleteCommunity event, Emitter<UserState> emit) async {
    try {
      await _userServices.deleteUserCommunity(event.communityId);
      add(FetchUserData());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onAddProjectOrAward(
      AddProjectOrAward event, Emitter<UserState> emit) async {
    try {
      await _userServices.addUserProjectOrAward(event.projectOrAward);
      add(FetchUserData());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onUpdateProjectOrAward(
      UpdateProjectOrAward event, Emitter<UserState> emit) async {
    try {
      await _userServices.updateUserProjectOrAward(
          event.projectOrAwardId, event.projectOrAward);
      add(FetchUserData());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onDeleteProjectOrAward(
      DeleteProjectOrAward event, Emitter<UserState> emit) async {
    try {
      await _userServices.deleteUserProjectOrAward(event.projectOrAwardId);
      add(FetchUserData());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onUpdateMediaAccounts(
      UpdateMediaAccounts event, Emitter<UserState> emit) async {
    try {
      await _userServices.updateUserMediaAccounts(event.mediaAccounts);
      add(FetchUserData());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onAddForeignLanguage(
      AddForeignLanguage event, Emitter<UserState> emit) async {
    try {
      await _userServices.addUserForeignLanguage(event.foreignLanguage);
      add(FetchUserData());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onUpdateForeignLanguage(
      UpdateForeignLanguage event, Emitter<UserState> emit) async {
    try {
      await _userServices.updateUserForeignLanguage(
          event.foreignLanguageId, event.foreignLanguage);
      add(FetchUserData());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onDeleteForeignLanguage(
      DeleteForeignLanguage event, Emitter<UserState> emit) async {
    try {
      await _userServices.deleteUserForeignLanguage(event.foreignLanguageId);
      add(FetchUserData());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
