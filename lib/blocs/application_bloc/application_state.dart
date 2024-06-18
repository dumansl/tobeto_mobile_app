part of 'application_bloc.dart';

abstract class ApplicationState extends Equatable {
  const ApplicationState();

  @override
  List<Object> get props => [];
}

class ApplicationInitial extends ApplicationState {}

class ApplicationLoaded extends ApplicationState {
  final Application application;

  const ApplicationLoaded(this.application);

  @override
  List<Object> get props => [application];
}

class ApplicationError extends ApplicationState {
  final String message;

  const ApplicationError(this.message);

  @override
  List<Object> get props => [message];
}
