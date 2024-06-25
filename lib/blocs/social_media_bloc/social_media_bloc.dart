import 'package:bloc/bloc.dart';
import 'package:tobeto_mobile_app/blocs/social_media_bloc/social_media_event.dart';
import 'package:tobeto_mobile_app/blocs/social_media_bloc/social_media_state.dart';
import 'package:tobeto_mobile_app/services/user_service.dart';

class SocialMediaBloc extends Bloc<SocialMediaEvent, SocialMediaState> {
  final UserService userService = UserService();

  SocialMediaBloc() : super(SocialMediaState()) {
    on<LoadSocialMedia>(_onLoadSocialMedia);
    on<AddSocialMedia>(_onAddSocialMedia);
    on<RemoveSocialMedia>(_onRemoveSocialMedia);
  }

  Future<void> _onLoadSocialMedia(
      LoadSocialMedia event, Emitter<SocialMediaState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final media = await userService.loadSocialMedia();
      emit(state.copyWith(media: media, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onAddSocialMedia(
      AddSocialMedia event, Emitter<SocialMediaState> emit) async {
    try {
      await userService.addSocialMedia(event.media);
      final updateMedia = List<Map<String, dynamic>>.from(state.media)
        ..add(event.media);
      emit(state.copyWith(media: updateMedia));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onRemoveSocialMedia(
      RemoveSocialMedia event, Emitter<SocialMediaState> emit) async {
    try {
      await userService.removeSocialMedia(event.media);
      final updateMedia = List<Map<String, dynamic>>.from(state.media)
        ..remove(event.media);
      emit(state.copyWith(media: updateMedia));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
