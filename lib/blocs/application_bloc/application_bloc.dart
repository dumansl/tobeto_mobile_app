import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tobeto_mobile_app/model/application_model.dart';
import 'package:tobeto_mobile_app/services/application_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final ApplicationService _applicationService;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ApplicationBloc(this._applicationService) : super(ApplicationInitial()) {
    on<LoadApplication>(_onLoadApplication);
  }

  void _onLoadApplication(LoadApplication event, Emitter<ApplicationState> emit) async {
    try {
      // Oturum açmış kullanıcının userId'si
      User? user = _auth.currentUser;
      if (user != null) {
        final userId = user.uid;

        // Application ID'yi al
        final applicationId = await _applicationService.getApplicationId(userId);

        // ApplicationService aracılığıyla Firebase'den veri çekme işlemi
        final application = await _applicationService.getApplication(userId, applicationId);

        // Veri başarıyla çekildiyse
        emit(ApplicationLoaded(application));
      } else {
        throw Exception('User is not authenticated');
      }
    } catch (e) {
      emit(ApplicationError(e.toString()));
    }
  }
}
