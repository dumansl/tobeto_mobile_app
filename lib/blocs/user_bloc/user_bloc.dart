

import 'package:bloc/bloc.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_event.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_state.dart';
import 'package:tobeto_mobile_app/services/user_services.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserServices _userServices = UserServices();

  UserBloc() : super(UserInitial()) {
    on<FetchUserData>(_onFetchUserData);
  }

  Future<void> _onFetchUserData(
      FetchUserData event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading());

      final user = await _userServices.getUserData();
      final experiences = await _userServices.getUserExperiences();
      final education = await _userServices.getUserEducation();
      final competencies = await _userServices.getUserCompetencies();
      final certificates = await _userServices.getUserCertificates();
      final communities = await _userServices.getUserCommunities();
      final projectsAndAwards = await _userServices.getUserProjectsAndAwards();
      final mediaAccounts = await _userServices.getUserMediaAccounts();
      final foreignLanguages = await _userServices.getUserForeignLanguages();

      if (user != null) {
        emit(UserLoaded(
          user: user,
          experiences: experiences,
          education: education!,
          competencies: competencies!,
          certificates: certificates,
          communities: communities,
          projectsAndAwards: projectsAndAwards,
          mediaAccounts: mediaAccounts!,
          foreignLanguages: foreignLanguages!,
        ));
      } else {
        emit(UserError('User not found'));
      }
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
