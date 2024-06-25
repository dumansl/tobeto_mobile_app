import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/model/job_model.dart';
import 'package:equatable/equatable.dart';
import 'package:tobeto_mobile_app/services/job_service.dart';

part 'job_event.dart';
part 'job_state.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  final JobService jobService = JobService();

  JobBloc() : super(JobInitial()) {
    on<LoadJobs>((event, emit) async {
      emit(JobLoading());
      try {
        final List<Job> jobs = await jobService.getJobs(event.userId);
        emit(JobLoaded(jobs, 0));
      } catch (e) {
        emit(JobError(e.toString()));
      }
    });

    on<ToggleTab>((event, emit) {
      if (state is JobLoaded) {
        final currentState = state as JobLoaded;
        emit(JobLoaded(currentState.jobs, event.selectedIndex));
      }
    });
  }
}
