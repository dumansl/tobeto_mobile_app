import 'package:equatable/equatable.dart';

abstract class EducatorAnnouncementEvent extends Equatable {
  const EducatorAnnouncementEvent();

  @override
  List<Object> get props => [];
}

class FetchEducatorAnnouncements extends EducatorAnnouncementEvent {}
