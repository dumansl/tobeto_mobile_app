import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import 'package:tobeto_mobile_app/blocs/video_bloc/video_bloc.dart';
import 'package:tobeto_mobile_app/blocs/video_bloc/video_event.dart';
import 'package:tobeto_mobile_app/blocs/video_bloc/video_state.dart';
import 'package:tobeto_mobile_app/model/catalog_model.dart';
import 'package:tobeto_mobile_app/services/video_repository.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CatalogVideo extends StatefulWidget {
  const CatalogVideo({super.key, required this.catalogCourse});
  final CatalogCourse catalogCourse;

  @override
  State<CatalogVideo> createState() => _CatalogVideoState();
}

class _CatalogVideoState extends State<CatalogVideo> {
  VideoPlayerController? _videoPlayerController;
  bool _isDisposing = false;

  @override
  void dispose() {
    _isDisposing = true;
    _videoPlayerController?.dispose();
    super.dispose();
  }

  Future<void> initializeVideoPlayer(String videoUrl) async {
    if (_isDisposing) return;

    _videoPlayerController?.dispose();

    _videoPlayerController = VideoPlayerController.network(videoUrl);
    await _videoPlayerController!.initialize();
    if (_isDisposing) return;
    setState(() {});
    _videoPlayerController!.pause();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoBloc(VideoRepository())..add(FetchVideo(widget.catalogCourse.videoUrl)),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: TobetoColor.icon.white,
            size: IconSize.size25px,
          ),
          backgroundColor: TobetoColor.card.black,
        ),
        body: BlocConsumer<VideoBloc, VideoState>(
          listener: (context, state) {
            if (state is VideoLoaded) {
              initializeVideoPlayer(state.videoUrl);
            }
          },
          builder: (context, state) {
            if (state is VideoLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is VideoLoaded) {
              return CatalogContent(
                videoPlayerController: _videoPlayerController,
                catalogCourse: widget.catalogCourse,
                onVideoSelected: (videoUrl) {
                  initializeVideoPlayer(videoUrl);
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

class CatalogContent extends StatelessWidget {
  const CatalogContent({
    super.key,
    required VideoPlayerController? videoPlayerController,
    required this.catalogCourse,
    required this.onVideoSelected,
  }) : _videoPlayerController = videoPlayerController;

  final CatalogCourse catalogCourse;
  final VideoPlayerController? _videoPlayerController;
  final Function(String) onVideoSelected;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.40,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: _videoPlayerController != null && _videoPlayerController!.value.isInitialized
                ? Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: _videoPlayerController!.value.aspectRatio,
                        child: VideoPlayer(_videoPlayerController!),
                      ),
                      Positioned(
                        right: 8.0,
                        bottom: 8.0,
                        child: IconButton(
                          icon: const Icon(Icons.fullscreen),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FullScreenVideo(
                                  videoPlayerController: _videoPlayerController!,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
          _videoPlayerController != null && _videoPlayerController!.value.isInitialized
              ? VideoControls(controller: _videoPlayerController!)
              : Container(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            color: TobetoColor.purple,
            child: Text(
              catalogCourse.courseName,
              style: TobetoTextStyle.poppins(context).captionWhiteBold30,
            ),
          ),
          Expanded(
            child: Playlist(
              catalogCourse: catalogCourse,
              onVideoSelected: onVideoSelected,
            ),
          ),
        ],
      ),
    );
  }
}

class FullScreenVideo extends StatefulWidget {
  final VideoPlayerController videoPlayerController;

  const FullScreenVideo({super.key, required this.videoPlayerController});

  @override
  // ignore: library_private_types_in_public_api
  _FullScreenVideoState createState() => _FullScreenVideoState();
}

class _FullScreenVideoState extends State<FullScreenVideo> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: widget.videoPlayerController.value.aspectRatio,
              child: VideoPlayer(widget.videoPlayerController),
            ),
            Positioned(
              left: 8.0,
              top: 8.0,
              child: IconButton(
                icon: const Icon(Icons.fullscreen_exit),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Positioned(
              bottom: 8.0,
              left: 8.0,
              right: 8.0,
              child: VideoControls(controller: widget.videoPlayerController),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoControls extends StatefulWidget {
  final VideoPlayerController controller;

  const VideoControls({super.key, required this.controller});

  @override
  State<VideoControls> createState() => _VideoControlsState();
}

class _VideoControlsState extends State<VideoControls> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            widget.controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
          onPressed: () {
            widget.controller.value.isPlaying ? widget.controller.pause() : widget.controller.play();
          },
        ),
        IconButton(
          icon: Icon(widget.controller.value.volume > 0 ? Icons.volume_up : Icons.volume_off),
          onPressed: () {
            widget.controller.setVolume(widget.controller.value.volume > 0 ? 0 : 1);
          },
        ),
        DropdownButton<double>(
          value: widget.controller.value.playbackSpeed,
          items: [0.5, 1.0, 1.5, 2.0]
              .map((speed) => DropdownMenuItem(
                    value: speed,
                    child: Text('${speed}x'),
                  ))
              .toList(),
          onChanged: (speed) {
            if (speed != null) {
              widget.controller.setPlaybackSpeed(speed);
            }
          },
        ),
      ],
    );
  }
}

class Playlist extends StatelessWidget {
  final CatalogCourse catalogCourse;
  final Function(String) onVideoSelected;

  const Playlist({
    super.key,
    required this.catalogCourse,
    required this.onVideoSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: catalogCourse.playlist.length,
      itemBuilder: (context, index) {
        return PlaylistItem(
          index: index,
          catalogCourse: catalogCourse,
          onVideoSelected: onVideoSelected,
        );
      },
    );
  }
}

class PlaylistItem extends StatelessWidget {
  final int index;
  final CatalogCourse catalogCourse;
  final Function(String) onVideoSelected;

  const PlaylistItem({
    super.key,
    required this.index,
    required this.catalogCourse,
    required this.onVideoSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onVideoSelected(catalogCourse.playlist[index]);
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          boxShadow: [
            BoxShadow(
              color: TobetoColor.purple.withOpacity(0.8),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(
              Icons.play_circle_filled,
              color: TobetoColor.purple,
              size: 50,
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${catalogCourse.courseName} ',
                    style: TobetoTextStyle.poppins(context).subtitleGrayDarkLight20,
                  ),
                  Text(
                    '${catalogCourse.courseTeacher} ',
                    style: TobetoTextStyle.poppins(context).bodyGrayDarkLight16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
