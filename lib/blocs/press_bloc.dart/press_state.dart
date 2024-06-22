import 'package:tobeto_mobile_app/model/press_model.dart';

abstract class PressState {
  const PressState();
}

class PressInitial extends PressState {}

class PressLoading extends PressState {}

class PressLoaded extends PressState {
  final List<PressModel> press;

  const PressLoaded(this.press);
}

class PressError extends PressState {
  final String message;

  const PressError(this.message);
}
