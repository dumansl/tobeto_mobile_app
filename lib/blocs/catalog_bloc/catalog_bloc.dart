import 'package:bloc/bloc.dart';
import 'package:tobeto_mobile_app/blocs/catalog_bloc/catalog_event.dart';
import 'package:tobeto_mobile_app/blocs/catalog_bloc/catalog_state.dart';
import 'package:tobeto_mobile_app/model/catalog_model.dart';
import 'package:tobeto_mobile_app/services/catalog_service.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final CourseRepository courseRepository;

  CatalogBloc({required this.courseRepository}) : super(CatalogNotLoaded()) {
    on<Fetch>(_onFetch);
  }

  Future<void> _onFetch(Fetch event, Emitter<CatalogState> emit) async {
    try {
      List<CatalogCourse> courses = await courseRepository.fetchLessons();
      emit(CatalogLoaded(catalogCourse: courses));
    } catch (_) {
      emit(CatalogNotLoaded());
    }
  }
}
