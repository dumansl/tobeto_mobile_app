import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/exams_bloc/exams_bloc.dart';
import 'package:tobeto_mobile_app/blocs/exams_bloc/exams_event.dart';
import 'package:tobeto_mobile_app/blocs/exams_bloc/exams_state.dart';

class ExamsScreen extends StatelessWidget {
  const ExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sınavlar'),
      ),
      body: BlocBuilder<ExamBloc, ExamState>(
        builder: (context, state) {
          if (state is InitialState) {
            context.read<ExamBloc>().add(FetchExams());
            return const Center(
              child: Text("Yazıların yükleme işlemi başlamadı.."),
            );
          }
          if (state is ExamLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ExamLoaded) {
            return ListView.builder(
              itemCount: state.exams.length,
              itemBuilder: (context, index) {
                var exam = state.exams[index];
                return ListTile(
                  title: Text(exam.exam),
                  subtitle: Text('ID: ${exam.examId}'),
                );
              },
            );
          } else if (state is ExamError) {
            return Center(child: Text('Hata: ${state.message}'));
          } else {
            return const Center(child: Text('Bilinmeyen bir hata oluştu.'));
          }
        },
      ),
    );
  }
}
