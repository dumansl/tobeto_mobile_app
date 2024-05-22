import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'connection_event.dart';
import 'connection_state.dart';

class NetConnectBloc extends Bloc<NetConnectEvent, NetConnectState> {
  NetConnectBloc() : super(InitialState()) {
    on<CheckInternetEvent>(_internetToState);
  }

  Future<void> _internetToState(CheckInternetEvent event, Emitter<NetConnectState> emit) async {
    try {
      final bool isConnected = await checkInternetConnection();
      if (isConnected) {
        emit(ConnectedState(isConnected: true));
      } else {
        emit(NotConnectedState());
      }
    } catch (e) {
      emit(NotConnectedState());
    }
  }

  Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
