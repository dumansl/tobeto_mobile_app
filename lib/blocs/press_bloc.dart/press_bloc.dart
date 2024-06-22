import 'package:bloc/bloc.dart';
import 'package:tobeto_mobile_app/blocs/press_bloc.dart/press_event.dart';
import 'package:tobeto_mobile_app/blocs/press_bloc.dart/press_state.dart';
import 'package:tobeto_mobile_app/model/press_model.dart';
import 'package:tobeto_mobile_app/services/press_service.dart';

class PressBloc extends Bloc<PressEvent, PressState> {
  final PressService pressService = PressService();

  PressBloc() : super(PressInitial()) {
    on<FetchPress>(fetchPress);
  }

  Future<void> fetchPress(PressEvent event, Emitter<PressState> emit) async {
    emit(PressLoading());
    try {
      final List<PressModel> press = await pressService.getPress();
      emit(PressLoaded(press));
    } catch (e) {
      emit(PressError(e.toString()));
    }
  }
}
