abstract class NetConnectState {}

class InitialState extends NetConnectState {}

class ConnectedState extends NetConnectState {
  final bool isConnected;

  ConnectedState({required this.isConnected});
}

class NotConnectedState extends NetConnectState {}
