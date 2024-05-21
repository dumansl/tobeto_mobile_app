import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/connect_internet/net_connect_event.dart';
import 'package:tobeto_mobile_app/blocs/connect_internet/net_connect_state.dart';

class NetConnectBloc extends Bloc<NetConnectEvent, NetConnectState> {
  final Connectivity connectivity;
  NetConnectBloc(this.connectivity) : super(NetNotConnect()) {
    on<NetControl>(_netConnect);
  }

  Future<void> _netConnect(
      NetControl event, Emitter<NetConnectState> emit) async {
    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      emit(NetConnectFailed());
    } else {
      emit(NetConnected());
    }
  }
}
