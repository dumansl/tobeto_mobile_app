import 'package:tobeto_mobile_app/model/catalog_model.dart';

abstract class CatalogState {}

class CatalogNotLoaded extends CatalogState {}

class CatalogLoaded extends CatalogState {
  List<CatalogCourse> catalogCourse;
  CatalogLoaded({
    required this.catalogCourse,
  });
}
