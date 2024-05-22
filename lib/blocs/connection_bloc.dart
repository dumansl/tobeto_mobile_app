import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'connection_event.dart';
import 'connection_state.dart';

class NetConnectBloc extends Bloc<NetConnectEvent, NetConnectState> {
  NetConnectBloc() : super(InitialState()) {
    on<CheckInternetEvent>(_internetToState);
  }

  void _internetToState(
      CheckInternetEvent event, Emitter<NetConnectState> emit) async {
    emit(InitialState());
    try {
      final bool isConnected = await checkInternetConnection();
      emit(ConnectedState(isConnected: isConnected));
    } catch (e) {
      emit(NotConnectedState());
    }
  }

  Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
