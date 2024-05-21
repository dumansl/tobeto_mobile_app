abstract class NetConnectState {}

class NetNotConnect extends NetConnectState {}

class NetConnecting extends NetConnectState {}

class NetConnected extends NetConnectState {}

class NetConnectFailed extends NetConnectState {}
