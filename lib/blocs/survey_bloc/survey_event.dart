part of 'survey_bloc.dart';

abstract class SurveyEvent extends Equatable {
  const SurveyEvent();

  @override
  List<Object> get props => [];
}

class LoadSurveys extends SurveyEvent {}

class LoadSurveyDetails extends SurveyEvent {
  final String surveyId;

  const LoadSurveyDetails({required this.surveyId});

  @override
  List<Object> get props => [surveyId];
}

class SelectOption extends SurveyEvent {
  final int questionIndex;
  final String selectedOption;

  const SelectOption({required this.questionIndex, required this.selectedOption});

  @override
  List<Object> get props => [questionIndex, selectedOption];
}

class SaveAnswers extends SurveyEvent {
  final String userId;
  final String surveyId;

  const SaveAnswers({required this.userId, required this.surveyId});

  @override
  List<Object> get props => [userId, surveyId];
}
