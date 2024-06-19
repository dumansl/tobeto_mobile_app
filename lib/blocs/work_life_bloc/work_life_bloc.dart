import 'package:bloc/bloc.dart';
import 'package:tobeto_mobile_app/blocs/work_life_bloc/work_life_event.dart';
import 'package:tobeto_mobile_app/blocs/work_life_bloc/work_life_state.dart';
import 'package:tobeto_mobile_app/services/user_service.dart';

class WorkLifeBloc extends Bloc<WorkLifeEvent, WorkLifeState> {
  final UserRepository userRepository;

  WorkLifeBloc({required this.userRepository}) : super(WorkLifeState()) {
    on<LoadWorkLife>(_onLoadWorkLife);
    on<AddWorkLife>(_onAddWorkLife);
    on<RemoveWorkLife>(_onRemoveWorkLife);
  }

  Future<void> _onLoadWorkLife(LoadWorkLife event, Emitter<WorkLifeState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final works = await userRepository.loadWorkLife();
      emit(state.copyWith(works: works, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onAddWorkLife(AddWorkLife event, Emitter<WorkLifeState> emit) async {
    try {
      await userRepository.addWorkLife(event.works);
      final updatedWorks = List<Map<String, dynamic>>.from(state.works)..add(event.works);
      emit(state.copyWith(works: updatedWorks));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onRemoveWorkLife(RemoveWorkLife event, Emitter<WorkLifeState> emit) async {
    try {
      await userRepository.removeWorkLife(event.works);
      final updatedWorks = List<Map<String, dynamic>>.from(state.works)..remove(event.works);
      emit(state.copyWith(works: updatedWorks));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
