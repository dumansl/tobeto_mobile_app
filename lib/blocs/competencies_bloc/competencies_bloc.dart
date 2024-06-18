import 'package:bloc/bloc.dart';
import 'package:tobeto_mobile_app/services/user_service.dart';
import 'competencies_event.dart';
import 'competencies_state.dart';

class CompetenciesBloc extends Bloc<CompetenciesEvent, CompetenciesState> {
  final UserRepository userRepository;

  CompetenciesBloc({required this.userRepository}) : super(CompetenciesState()) {
    on<LoadSkills>(_onLoadSkills);
    on<AddSkill>(_onAddSkill);
    on<RemoveSkill>(_onRemoveSkill);
  }

  Future<void> _onLoadSkills(LoadSkills event, Emitter<CompetenciesState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final skills = await userRepository.loadSkills();
      emit(state.copyWith(skills: skills, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onAddSkill(AddSkill event, Emitter<CompetenciesState> emit) async {
    try {
      await userRepository.addSkill(event.skill);
      final updatedSkills = List<String>.from(state.skills)..add(event.skill);
      emit(state.copyWith(skills: updatedSkills));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onRemoveSkill(RemoveSkill event, Emitter<CompetenciesState> emit) async {
    try {
      await userRepository.removeSkill(event.skill);
      final updatedSkills = List<String>.from(state.skills)..remove(event.skill);
      emit(state.copyWith(skills: updatedSkills));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
