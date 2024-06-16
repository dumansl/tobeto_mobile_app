import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tobeto_mobile_app/model/announcement_model.dart';
import 'package:tobeto_mobile_app/services/announcement_service.dart';

part 'announcement_event.dart';
part 'announcement_state.dart';

class AnnouncementBloc extends Bloc<AnnouncementEvent, AnnouncementState> {
  final AnnouncementService _announcementService;

  AnnouncementBloc(this._announcementService) : super(AnnouncementInitial()) {
    on<LoadAnnouncements>(_onLoadAnnouncements);
    on<FilterAnnouncements>(_onFilterAnnouncements);
    on<ToggleShowUnread>(_onToggleShowUnread);
    on<MarkAsRead>(_onMarkAsRead);
  }

  void _onLoadAnnouncements(LoadAnnouncements event, Emitter<AnnouncementState> emit) async {
    try {
      final announcements = await _announcementService.getAnnouncements();
      print("Loaded ${announcements.length} announcements");
      emit(AnnouncementsLoaded(announcements: announcements));
    } catch (e) {
      emit(AnnouncementsError('Failed to load announcements'));
    }
  }

  void _onFilterAnnouncements(FilterAnnouncements event, Emitter<AnnouncementState> emit) {
    if (state is AnnouncementsLoaded || state is AnnouncementsFiltered) {
      final originalAnnouncements = state is AnnouncementsLoaded
          ? (state as AnnouncementsLoaded).announcements
          : (state as AnnouncementsFiltered).originalAnnouncements;
      final filteredAnnouncements = originalAnnouncements
          .where((announcement) => announcement.title.toLowerCase().contains(event.query.toLowerCase()))
          .toList();
      emit(AnnouncementsFiltered(
        filteredAnnouncements,
        originalAnnouncements: originalAnnouncements,
      ));
    }
  }

  void _onToggleShowUnread(ToggleShowUnread event, Emitter<AnnouncementState> emit) {
    if (state is AnnouncementsLoaded || state is AnnouncementsFiltered) {
      final originalAnnouncements = state is AnnouncementsLoaded
          ? (state as AnnouncementsLoaded).announcements
          : (state as AnnouncementsFiltered).originalAnnouncements;
      final filteredAnnouncements = event.showOnlyUnread
          ? originalAnnouncements.where((announcement) => !announcement.isRead).toList()
          : originalAnnouncements;
      emit(AnnouncementsFiltered(
        filteredAnnouncements,
        originalAnnouncements: originalAnnouncements,
      ));
    }
  }

  void _onMarkAsRead(MarkAsRead event, Emitter<AnnouncementState> emit) {
    if (state is AnnouncementsLoaded || state is AnnouncementsFiltered) {
      final originalAnnouncements = state is AnnouncementsLoaded
          ? (state as AnnouncementsLoaded).announcements
          : (state as AnnouncementsFiltered).originalAnnouncements;
      final updatedAnnouncements = originalAnnouncements.map((announcement) {
        return announcement.title == event.announcement.title ? announcement.copyWith(isRead: true) : announcement;
      }).toList();
      emit(AnnouncementsLoaded(announcements: updatedAnnouncements));
    }
  }
}
