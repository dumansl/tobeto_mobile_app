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
    on<FetchExamResult>(_fetchExamResult);
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
      await _examService.saveExamResult(
        correctCount: event.correctCount,
        incorrectCount: event.incorrectCount,
        unansweredCount: event.unansweredCount,
        score: event.score,
        isCompleted: event.isCompleted,
        examId: event.examId,
      );
      emit(ExamResultSaved());
    } catch (e) {
      emit(ExamResultError(e.toString()));
    }
  }

  Future<void> _fetchExamResult(
      FetchExamResult event, Emitter<ExamState> emit) async {
    emit(ExamResultLoading());
    try {
      final ExamResult examResult =
          await _examService.fetchExamResults(examId: event.examId);
      emit(ExamResultLoaded(examResult));
    } catch (e) {
      emit(ExamResultError(e.toString()));
    }
  }
}
