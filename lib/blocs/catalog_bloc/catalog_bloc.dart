import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/model/catalog_model.dart';
import 'package:tobeto_mobile_app/services/catalog_service.dart';
import 'catalog_event.dart';
import 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final CatalogService catalogService = CatalogService();

  CatalogBloc() : super(CatalogInitial()) {
    on<FetchCatalog>(fetchReviews);
  }

  Future<void> fetchReviews(FetchCatalog event, Emitter<CatalogState> emit) async {
    emit(CatalogLoading());
    try {
      catalogService.fetchCourses();
      emit(CatalogLoaded());
    } catch (e) {
      emit(CatalogError(e.toString()));
    }
  }
}
