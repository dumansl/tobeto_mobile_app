abstract class AuthState {}

class NotAuthenticated extends AuthState {}

class LoginProgress extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginError extends AuthState {
  String? errorMessage;

  LoginError({this.errorMessage});
}

// Send Reset Password

class ResetPasswordProgress extends AuthState {}

class ResetPasswordSuccess extends AuthState {}

class ResetPasswordError extends AuthState {
  String? errorMessage;

  ResetPasswordError({this.errorMessage});
}
