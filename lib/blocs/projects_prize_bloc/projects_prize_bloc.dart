import 'package:bloc/bloc.dart';
import 'package:tobeto_mobile_app/blocs/projects_prize_bloc/projects_prize_event.dart';
import 'package:tobeto_mobile_app/blocs/projects_prize_bloc/projects_prize_state.dart';
import 'package:tobeto_mobile_app/services/user_service.dart';

class ProjectsPrizeBloc extends Bloc<ProjectsPrizeEvent, ProjectsPrizeState> {
  final UserService userService = UserService();

  ProjectsPrizeBloc() : super(ProjectsPrizeState()) {
    on<LoadProjectsPrize>(_onLoadProjectsPrize);
    on<AddProjectsPrize>(_onAddProjectsPrize);
    on<RemoveProjectsPrize>(_onRemoveProjectsPrize);
  }

  Future<void> _onLoadProjectsPrize(
      LoadProjectsPrize event, Emitter<ProjectsPrizeState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final projects = await userService.loadProjectsPrize();
      emit(state.copyWith(projects: projects, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onAddProjectsPrize(
      AddProjectsPrize event, Emitter<ProjectsPrizeState> emit) async {
    try {
      await userService.addProjectsPrize(event.projects);
      final updateProjects = List<Map<String, dynamic>>.from(state.projects)
        ..add(event.projects);
      emit(state.copyWith(projects: updateProjects));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onRemoveProjectsPrize(
      RemoveProjectsPrize event, Emitter<ProjectsPrizeState> emit) async {
    try {
      await userService.removeProjectsPrize(event.projects);
      final updateProjects = List<Map<String, dynamic>>.from(state.projects)
        ..remove(event.projects);
      emit(state.copyWith(projects: updateProjects));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
