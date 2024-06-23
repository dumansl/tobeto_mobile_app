import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/video_bloc/video_event.dart';
import 'package:tobeto_mobile_app/blocs/video_bloc/video_state.dart';
import 'package:tobeto_mobile_app/services/video_repository.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final VideoRepository videoRepository;

  VideoBloc(this.videoRepository) : super(VideoInitial()) {
    on<FetchVideo>(_onFetchVideo);  // FetchVideo olayını işleyiciye kaydediyoruz
  }

  Future<void> _onFetchVideo(FetchVideo event, Emitter<VideoState> emit) async {
    emit(VideoLoading());
    try {
      final videoUrl = await videoRepository.fetchVideoUrl(event.videoUrl);
      emit(VideoLoaded(videoUrl: videoUrl));
    } catch (e) {
      emit(VideoError(message: e.toString()));
    }
  }
}
