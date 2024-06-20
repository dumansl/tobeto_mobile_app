part of 'survey_bloc.dart';

abstract class SurveyState extends Equatable {
  const SurveyState();

  @override
  List<Object> get props => [];
}

class SurveyInitial extends SurveyState {}

class SurveyLoading extends SurveyState {}

class SurveyLoaded extends SurveyState {
  final List<SurveyModel> surveys;

  const SurveyLoaded({required this.surveys});

  @override
  List<Object> get props => [surveys];
}

class SurveyDetailsLoaded extends SurveyState {
  final String surveyId;
  final List<SurveyModel> questions;

  const SurveyDetailsLoaded({required this.surveyId, required this.questions});

  @override
  List<Object> get props => [surveyId, questions];
}

class SurveySaved extends SurveyState {}

class SurveyError extends SurveyState {
  final String error;

  const SurveyError({required this.error});

  @override
  List<Object> get props => [error];
}
