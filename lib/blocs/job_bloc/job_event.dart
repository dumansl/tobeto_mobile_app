part of 'job_bloc.dart';

abstract class JobEvent extends Equatable {
  const JobEvent();

  @override
  List<Object> get props => [];
}

class LoadJobs extends JobEvent {
  final String userId;

  const LoadJobs(this.userId);

  @override
  List<Object> get props => [userId];
}

class ToggleTab extends JobEvent {
  final int selectedIndex;

  const ToggleTab(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
