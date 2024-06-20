// survey_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tobeto_mobile_app/model/survey_model.dart';
import 'package:tobeto_mobile_app/services/survey_service.dart';

part 'survey_event.dart';
part 'survey_state.dart';

class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {
  final SurveyService _surveyService = SurveyService();

  SurveyBloc() : super(SurveyInitial()) {
    on<LoadSurveys>((event, emit) async {
      try {
        emit(SurveyLoading());
        final surveys = await _surveyService.getSurveys();
        emit(SurveyLoaded(surveys: surveys));
      } catch (e) {
        emit(SurveyError(error: e.toString()));
      }
    });

    on<LoadSurveyDetails>((event, emit) async {
      try {
        emit(SurveyLoading());
        final questions = await _surveyService.getSurveyDetails(event.surveyId);
        emit(SurveyDetailsLoaded(surveyId: event.surveyId, questions: questions));
      } catch (e) {
        emit(SurveyError(error: e.toString()));
      }
    });

    on<SelectOption>((event, emit) {
      if (state is SurveyDetailsLoaded) {
        final questions = (state as SurveyDetailsLoaded).questions;
        questions[event.questionIndex].selected = event.selectedOption;
        emit(SurveyDetailsLoaded(
          surveyId: (state as SurveyDetailsLoaded).surveyId,
          questions: List.from(questions),
        ));
      }
    });

    on<SaveAnswers>((event, emit) async {
      if (state is SurveyDetailsLoaded) {
        try {
          final questions = (state as SurveyDetailsLoaded).questions;
          final responses = questions.map((q) => q.selected ?? '').toList();
          await _surveyService.saveAnswers(event.userId, (state as SurveyDetailsLoaded).surveyId, responses);
          emit(SurveySaved());
        } catch (e) {
          emit(SurveyError(error: e.toString()));
        }
      }
    });
  }
}
