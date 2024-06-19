import 'package:bloc/bloc.dart';
import 'package:tobeto_mobile_app/blocs/education_life_bloc/education_life_event.dart';
import 'package:tobeto_mobile_app/blocs/education_life_bloc/education_life_state.dart';
import 'package:tobeto_mobile_app/services/user_service.dart';

class EducationLifeBloc extends Bloc<EducationLifeEvent, EducationLifeState> {
  final UserService userService;

  EducationLifeBloc({required this.userService}) : super(EducationLifeState()) {
    on<LoadEducationLife>(_onLoadEducationLife);
    on<AddEducationLife>(_onAddEducationLife);
    on<RemoveEducationLife>(_onRemoveEducationLife);
  }

  Future<void> _onLoadEducationLife(LoadEducationLife event, Emitter<EducationLifeState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final education = await userService.loadEducationLife();
      emit(state.copyWith(education: education, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onAddEducationLife(AddEducationLife event, Emitter<EducationLifeState> emit) async {
    try {
      await userService.addEducationLife(event.education);
      final updateEducation = List<Map<String, dynamic>>.from(state.education)..add(event.education);
      emit(state.copyWith(education: updateEducation));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onRemoveEducationLife(RemoveEducationLife event, Emitter<EducationLifeState> emit) async {
    try {
      await userService.removeEducationLife(event.education);
      final updateEducation = List<Map<String, dynamic>>.from(state.education)..remove(event.education);
      emit(state.copyWith(education: updateEducation));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
