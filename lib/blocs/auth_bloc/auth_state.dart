abstract class AuthState {}

class NotAuthenticated extends AuthState {}

class LoginProgress extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginError extends AuthState {
  final String? errorMessage;

  LoginError({required this.errorMessage});
}

// Change Password

class ChangePasswordProgress extends AuthState {}

class ChangePasswordSuccess extends AuthState {}

class ChangePasswordError extends AuthState {
  final String? errorMessage;

  ChangePasswordError({this.errorMessage});
}

// Send Reset Password

class ResetPasswordProgress extends AuthState {}

class ResetPasswordSuccess extends AuthState {}

class ResetPasswordError extends AuthState {
  String? errorMessage;

  ResetPasswordError({this.errorMessage});
}

class DeleteAccountProgress extends AuthState {}

class DeleteAccountSuccess extends AuthState {}

class DeleteAccountError extends AuthState {
  String? errorMessage;

  DeleteAccountError({this.errorMessage});
}
