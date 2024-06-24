import 'package:bloc/bloc.dart';
import 'package:tobeto_mobile_app/blocs/club_cominities_bloc/club_cominities_event.dart';
import 'package:tobeto_mobile_app/blocs/club_cominities_bloc/club_cominities_state.dart';
import 'package:tobeto_mobile_app/services/user_service.dart';

class ClubCominitiesBloc
    extends Bloc<ClubCominitiesEvent, ClubCominitiesState> {
  final UserService userService = UserService();

  ClubCominitiesBloc() : super(ClubCominitiesState()) {
    on<LoadClubCominities>(_onLoadClubCominities);
    on<AddClubCominities>(_onAddClubCominities);
    on<RemoveClubCominities>(_onRemoveClubCominities);
  }

  Future<void> _onLoadClubCominities(
      LoadClubCominities event, Emitter<ClubCominitiesState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final club = await userService.loadClubCominities();
      emit(state.copyWith(club: club, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onAddClubCominities(
      AddClubCominities event, Emitter<ClubCominitiesState> emit) async {
    try {
      await userService.addClubCominities(event.club);
      final updateClub = List<Map<String, dynamic>>.from(state.club)
        ..add(event.club);
      emit(state.copyWith(club: updateClub));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onRemoveClubCominities(
      RemoveClubCominities event, Emitter<ClubCominitiesState> emit) async {
    try {
      await userService.removeClubCominities(event.club);
      final updateClub = List<Map<String, dynamic>>.from(state.club)
        ..remove(event.club);
      emit(state.copyWith(club: updateClub));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
