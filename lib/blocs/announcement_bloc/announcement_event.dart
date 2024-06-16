part of 'announcement_bloc.dart';

abstract class AnnouncementEvent extends Equatable {
  const AnnouncementEvent();

  @override
  List<Object> get props => [];
}

class LoadAnnouncements extends AnnouncementEvent {}

class FilterAnnouncements extends AnnouncementEvent {
  final String query;

  const FilterAnnouncements(this.query);

  @override
  List<Object> get props => [query];
}

class ToggleShowUnread extends AnnouncementEvent {
  final bool showOnlyUnread;

  const ToggleShowUnread(this.showOnlyUnread);

  @override
  List<Object> get props => [showOnlyUnread];
}

class MarkAsRead extends AnnouncementEvent {
  final Announcement announcement;

  const MarkAsRead(this.announcement);

  @override
  List<Object> get props => [announcement];
}
