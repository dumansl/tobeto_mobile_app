import 'package:bloc/bloc.dart';
import 'package:tobeto_mobile_app/blocs/exam_bloc/exams_event.dart';
import 'package:tobeto_mobile_app/blocs/exam_bloc/exams_state.dart';
import 'package:tobeto_mobile_app/model/exam_model.dart';
import 'package:tobeto_mobile_app/services/exam_service.dart';

class ExamBloc extends Bloc<ExamEvent, ExamState> {
  final ExamService examService = ExamService();
  ExamBloc() : super(ExamInitialState()) {
    on<FetchExams>(fetchExams);
  }

  Future<void> fetchExams(FetchExams event, Emitter<ExamState> emit) async {
    emit(ExamLoading());
    try {
      final List<UserExam> exams = await examService.getExamData();
      emit(ExamLoaded(exams));
    } catch (e) {
      emit(ExamError(e.toString()));
    }
  }

  void updateExamResult(UpdateExamResult event, Emitter<ExamState> emit) {
    emit(ExamLoading());
    if (state is ExamLoaded) {
      final List<UserExam> updatedExams =
          (state as ExamLoaded).exams.map((exam) {
        if (exam.id == event.userExamId) {
          final updatedExam = UserExam(
            id: exam.id,
            exam: exam.exam,
            score: {
              'score': event.totalScore,
            },
            isCompleted: true,
          );
          return updatedExam;
        }
        return exam;
      }).toList();

      emit(ExamLoaded(updatedExams));
    } else {
      emit(ExamUpdatedError("Exam state is not loaded"));
    }
  }
}
