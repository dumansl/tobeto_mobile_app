import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tobeto_mobile_app/services/video_repositort.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:tobeto_mobile_app/blocs/video_bloc/video_bloc.dart';
import 'package:tobeto_mobile_app/blocs/video_bloc/video_event.dart';
import 'package:tobeto_mobile_app/blocs/video_bloc/video_state.dart';

class CatalogDetail extends StatefulWidget {
  const CatalogDetail({super.key});

  @override
  State<CatalogDetail> createState() => _CatalogDetailState();
}

class _CatalogDetailState extends State<CatalogDetail> {
  CustomVideoPlayerController? _customVideoPlayerController;
  VideoPlayerController? _videoPlayerController;

  @override
  void dispose() {
    _customVideoPlayerController?.dispose();
    _videoPlayerController?.dispose();
    super.dispose();
  }

  Future<void> initializeVideoPlayer(String videoUrl) async {
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(videoUrl));
    await _videoPlayerController!.initialize();
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _videoPlayerController!,
    );
    _videoPlayerController!.pause();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoBloc(VideoRepository(FirebaseStorage.instance))
        ..add(FetchVideo()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Catalog'),
        ),
        body: BlocBuilder<VideoBloc, VideoState>(
          builder: (context, state) {
            if (state is VideoLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is VideoLoaded) {
              return FutureBuilder(
                future: initializeVideoPlayer(state.videoUrl),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                            'Video yüklenirken bir hata oluştu: ${snapshot.error}'),
                      );
                    }
                    return Center(
                      child: CustomVideoPlayer(
                        customVideoPlayerController:
                            _customVideoPlayerController!,
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              );
            } else if (state is VideoError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('Bir hata oluştu'));
            }
          },
        ),
      ),
    );
  }
}
