import 'package:equatable/equatable.dart';
import 'package:tobeto_mobile_app/model/educator_annocement-model.dart';

abstract class EducatorAnnouncementState extends Equatable {
  const EducatorAnnouncementState();

  @override
  List<Object> get props => [];
}

class EducatorAnnouncementInitial extends EducatorAnnouncementState {}

class EducatorAnnouncementLoading extends EducatorAnnouncementState {}

class EducatorAnnouncementLoaded extends EducatorAnnouncementState {
  final List<EducatorAnnouncement> announcements;

  const EducatorAnnouncementLoaded(this.announcements);

  @override
  List<Object> get props => [announcements];
}

class EducatorAnnouncementError extends EducatorAnnouncementState {
  final String message;

  const EducatorAnnouncementError(this.message);

  @override
  List<Object> get props => [message];
}
