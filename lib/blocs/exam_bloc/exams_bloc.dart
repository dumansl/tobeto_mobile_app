import 'package:bloc/bloc.dart';
import 'package:tobeto_mobile_app/blocs/exam_bloc/exams_event.dart';
import 'package:tobeto_mobile_app/blocs/exam_bloc/exams_state.dart';
import 'package:tobeto_mobile_app/model/exam_model.dart';
import 'package:tobeto_mobile_app/services/exam_service.dart';

class ExamBloc extends Bloc<ExamEvent, ExamState> {
  final ExamService _examService = ExamService();
  ExamBloc() : super(ExamInitialState()) {
    on<FetchExams>(fetchExams);
    on<SaveExamResult>(saveExamResult);
    on<FetchExamResult>(fetchExamResultSuccess);
  }

  Future<void> fetchExams(FetchExams event, Emitter<ExamState> emit) async {
    emit(ExamLoading());
    try {
      final List<ExamModel> exams = await _examService.fetchReviewData();
      emit(ExamLoaded(exams));
    } catch (e) {
      emit(ExamError(e.toString()));
    }
  }

  Future<void> saveExamResult(
      SaveExamResult event, Emitter<ExamState> emit) async {
    try {
      await _examService.saveExamResult(event.score, event.isCompleted);
      emit(ExamResultSaved());
    } catch (e) {
      emit(ExamResultError(e.toString()));
    }
  }

  Future<void> fetchExamResultSuccess(
      FetchExamResult event, Emitter<ExamState> emit) async {
    emit(ExamResultLoading());
    try {
      final data = await _examService.fetchExamResults();
      emit(ExamResultLoaded(data));
    } catch (e) {
      emit(ExamResultError(e.toString()));
    }
  }
}
