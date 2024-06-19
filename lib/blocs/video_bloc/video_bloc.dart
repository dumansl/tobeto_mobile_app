  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:tobeto_mobile_app/blocs/video_bloc/video_event.dart';
  import 'package:tobeto_mobile_app/blocs/video_bloc/video_state.dart';
  import 'package:tobeto_mobile_app/services/video_repositort.dart';

  class VideoBloc extends Bloc<VideoEvent, VideoState> {
    final VideoRepository repository;

    VideoBloc(this.repository) : super(VideoLoading()) {
      on<FetchVideo>((event, emit) async {
        emit(VideoLoading());
        try {
          final videoUrl = await repository.fetchVideoUrl();
          if (videoUrl.isNotEmpty) {
            emit(VideoLoaded(videoUrl));
          } else {
            emit(VideoError('Video URL is empty'));
          }
        } catch (e) {
          emit(VideoError('Failed to load video: $e'));
        }
      });
    }
  }
