abstract class AuthEvent {
  const AuthEvent();
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent({required this.email, required this.password});
}

class LogoutEvent extends AuthEvent {
  const LogoutEvent();
}

class GoogleLoginEvent extends AuthEvent {
  const GoogleLoginEvent();
}

class GuestLoginEvent extends AuthEvent {
  const GuestLoginEvent();
}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String lastName;
  const RegisterEvent(
      {required this.email,
      required this.password,
      required this.name,
      required this.lastName});
}

class ResetPasswordEvent extends AuthEvent {
  final String email;

  const ResetPasswordEvent({required this.email});
}

class DeleteAccountEvent extends AuthEvent {
  const DeleteAccountEvent();
}
