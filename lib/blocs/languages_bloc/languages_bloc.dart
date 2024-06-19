import 'package:bloc/bloc.dart';
import 'package:tobeto_mobile_app/blocs/languages_bloc/languages_event.dart';
import 'package:tobeto_mobile_app/blocs/languages_bloc/languages_state.dart';
import 'package:tobeto_mobile_app/services/user_service.dart';

class LanguagesBloc extends Bloc<LanguagesEvent, LanguagesState> {
  final UserService userService;

  LanguagesBloc({required this.userService}) : super(LanguagesState()) {
    on<LoadLanguages>(_onLoadLanguages);
    on<AddLanguages>(_onAddLanguages);
    on<RemoveLanguages>(_onRemoveLanguages);
  }

  Future<void> _onLoadLanguages(LoadLanguages event, Emitter<LanguagesState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final languages = await userService.loadLanguages();
      emit(state.copyWith(languages: languages, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onAddLanguages(AddLanguages event, Emitter<LanguagesState> emit) async {
    try {
      await userService.addLanguages(event.languages);
      final updateLanguages = List<Map<String, dynamic>>.from(state.languages)..add(event.languages);
      emit(state.copyWith(languages: updateLanguages));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onRemoveLanguages(RemoveLanguages event, Emitter<LanguagesState> emit) async {
    try {
      await userService.removeLanguages(event.languages);
      final updateLanguages = List<Map<String, dynamic>>.from(state.languages)..remove(event.languages);
      emit(state.copyWith(languages: updateLanguages));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
