import 'package:bloc/bloc.dart';
import 'package:tobeto_mobile_app/blocs/certificate_bloc/certificate_event.dart';
import 'package:tobeto_mobile_app/blocs/certificate_bloc/certificate_state.dart';
import 'package:tobeto_mobile_app/services/user_service.dart';

class CertificateBloc extends Bloc<CertificateEvent, CertificateState> {
  final UserService userService;

  CertificateBloc({required this.userService}) : super(CertificateState()) {
    on<LoadCertificate>(_onLoadCertificate);
    on<AddCertificate>(_onAddCertificate);
    on<RemoveCertificate>(_onRemoveCertificate);
  }

  Future<void> _onLoadCertificate(LoadCertificate event, Emitter<CertificateState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final certificate = await userService.loadCertificate();
      emit(state.copyWith(certificate: certificate, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onAddCertificate(AddCertificate event, Emitter<CertificateState> emit) async {
    try {
      await userService.addCertificate(event.certificate);
      final updateCertificate = List<Map<String, dynamic>>.from(state.certificate)..add(event.certificate);
      emit(state.copyWith(certificate: updateCertificate));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onRemoveCertificate(RemoveCertificate event, Emitter<CertificateState> emit) async {
    try {
      await userService.removeCertificate(event.certificate);
      final updateCertificate = List<Map<String, dynamic>>.from(state.certificate)..remove(event.certificate);
      emit(state.copyWith(certificate: updateCertificate));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
