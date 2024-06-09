import 'package:bloc/bloc.dart';
import 'package:tobeto_mobile_app/blocs/exams_bloc/exams_event.dart';
import 'package:tobeto_mobile_app/blocs/exams_bloc/exams_state.dart';
import 'package:tobeto_mobile_app/model/exam_model.dart';
import 'package:tobeto_mobile_app/services/exam_service.dart';

class ExamBloc extends Bloc<ExamEvent, ExamState> {
  final ExamService examService = ExamService();
  ExamBloc() : super(InitialState()) {
    on<FetchExams>(fetchExams);
  }

  Future<void> fetchExams(FetchExams event, Emitter<ExamState> emit) async {
    emit(ExamLoading());
    try {
      final List<Exam> exams = await examService.getExams();
      emit(ExamLoaded(exams));
    } catch (e) {
      emit(ExamError(e.toString()));
    }
  }
}
