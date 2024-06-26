import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/educator_announcement_bloc/educator_announcement_event.dart';
import 'package:tobeto_mobile_app/blocs/educator_announcement_bloc/educator_announcement_state.dart';
import 'package:tobeto_mobile_app/services/educator_announcement.dart';

class EducatorAnnouncementBloc
    extends Bloc<EducatorAnnouncementEvent, EducatorAnnouncementState> {
  final EducatorAnnouncementRepository announcementRepository;

  EducatorAnnouncementBloc({required this.announcementRepository})
      : super(EducatorAnnouncementInitial()) {
    on<FetchEducatorAnnouncements>((event, emit) async {
      emit(EducatorAnnouncementLoading());
      try {
        final announcements = await announcementRepository.fetchAnnouncements();
        emit(EducatorAnnouncementLoaded(announcements));
      } catch (e) {
        emit(EducatorAnnouncementError(e.toString()));
      }
    });
  }
}
