import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/blocs/tobeto_success_bloc/tobeto_success_event.dart';
import 'package:tobeto_mobile_app/blocs/tobeto_success_bloc/tobeto_success_state.dart';
import 'package:tobeto_mobile_app/model/tobeto_success_model.dart';
import 'package:tobeto_mobile_app/services/tobeto_success_service.dart';

class BusinessSuccessBloc
    extends Bloc<BusinessSuccessEvent, BusinessSuccessState> {
  final TobetoSuccessService _successService = TobetoSuccessService();

  BusinessSuccessBloc() : super(BusinessSuccessInitial()) {
    on<FetchBusinessSuccess>(fetchTobetoSuccess);
    on<SaveQuizResult>(saveQuizResult);
    on<FetchQuizResult>(fetchQuizzResultSuccess);
  }

  Future<void> fetchTobetoSuccess(
      FetchBusinessSuccess event, Emitter<BusinessSuccessState> emit) async {
    emit(BusinessSuccessLoading());
    try {
      final data = await _successService.fetchBusinessSuccessData();
      debugPrint("Data $data");
      final businessSuccess = BusinessSuccessModel.fromJson(data);
      debugPrint(businessSuccess.toString());
      emit(BusinessSuccessLoaded(businessSuccess));
    } catch (e) {
      emit(BusinessSuccessError(e.toString()));
    }
  }

  Future<void> saveQuizResult(
      SaveQuizResult event, Emitter<BusinessSuccessState> emit) async {
    try {
      await _successService.saveQuizResult(event.score, event.isCompleted);
      emit(QuizResultSaved());
    } catch (e) {
      emit(QuizResultError(e.toString()));
    }
  }

  Future<void> fetchQuizzResultSuccess(
      FetchQuizResult event, Emitter<BusinessSuccessState> emit) async {
    emit(QuizResultLoading());
    try {
      final data = await _successService.fetchQuizResults();
      emit(QuizResultLoaded(data));
    } catch (e) {
      emit(BusinessSuccessError(e.toString()));
    }
  }
}
