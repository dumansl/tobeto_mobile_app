part of 'announcement_bloc.dart';

abstract class AnnouncementState extends Equatable {
  const AnnouncementState();

  @override
  List<Object> get props => [];
}

class AnnouncementInitial extends AnnouncementState {}

class AnnouncementsLoading extends AnnouncementState {}

class AnnouncementsLoaded extends AnnouncementState {
  final List<Announcement> announcements;

  const AnnouncementsLoaded({required this.announcements});

  @override
  List<Object> get props => [announcements];
}

class AnnouncementsFiltered extends AnnouncementState {
  final List<Announcement> announcements;
  final List<Announcement> originalAnnouncements;

  const AnnouncementsFiltered(
    this.announcements, {
    required this.originalAnnouncements,
  });

  @override
  List<Object> get props => [announcements, originalAnnouncements];
}

class AnnouncementsError extends AnnouncementState {
  final String message;

  const AnnouncementsError(this.message);

  @override
  List<Object> get props => [message];
}
