import 'package:bloc/bloc.dart';
import 'package:tobeto_mobile_app/services/auth_service.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(NotAuthenticated()) {
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
    on<GoogleLoginEvent>(_onGoogleLogin);
    on<GuestLoginEvent>(_onGuestLogin);
    on<RegisterEvent>(_onRegister);
    on<ResetPasswordEvent>(_onResetPassword);
    on<DeleteAccountEvent>(_onDeleteAccount); // Yeni event işleyici
  }

  final AuthService _authService = AuthService();

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoginProgress());
      await _authService.signInWithEmailAndPassword(
          event.email, event.password);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError(errorMessage: e.toString()));
    }
  }

  Future<void> _onGoogleLogin(
      GoogleLoginEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoginProgress());
      await _authService.signInWithGoogle();
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError(errorMessage: e.toString()));
    }
  }

  Future<void> _onGuestLogin(
      GuestLoginEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoginProgress());
      await _authService.signInAnonymously();
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError(errorMessage: e.toString()));
    }
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    await _authService.signOut();
    emit(NotAuthenticated());
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoginProgress());
      await _authService.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
          name: event.name,
          lastName: event.lastName);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError(errorMessage: e.toString()));
    }
  }

  Future<void> _onResetPassword(
      ResetPasswordEvent event, Emitter<AuthState> emit) async {
    try {
      emit(ResetPasswordProgress());
      await _authService.resetPassword(event.email);
      emit(ResetPasswordSuccess());
    } catch (e) {
      emit(ResetPasswordError(errorMessage: e.toString()));
    }
  }

  Future<void> _onDeleteAccount(
      DeleteAccountEvent event, Emitter<AuthState> emit) async {
    try {
      emit(DeleteAccountProgress());
      await _authService.deleteAccount();
      emit(DeleteAccountSuccess());
      emit(NotAuthenticated());
    } catch (e) {
      emit(DeleteAccountError(errorMessage: e.toString()));
    }
  }
}
