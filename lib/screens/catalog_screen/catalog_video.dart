import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  CustomVideoPlayerController? _customVideoPlayerController;
  CachedVideoPlayerController? _cachedVideoPlayerController;
  bool _isDisposing = false;

  @override
  void dispose() {
    _isDisposing = true;
    _cachedVideoPlayerController?.dispose();
    _customVideoPlayerController?.dispose();
    super.dispose();
  }

  Future<void> initializeVideoPlayer(String videoUrl) async {
    if (_isDisposing) return;

    _cachedVideoPlayerController?.dispose();
    _customVideoPlayerController?.dispose();

    _cachedVideoPlayerController =
        CachedVideoPlayerController.network(videoUrl);
    await _cachedVideoPlayerController!.initialize();
    if (_isDisposing) return;
    setState(() {
      _customVideoPlayerController = CustomVideoPlayerController(
        context: context,
        videoPlayerController: _cachedVideoPlayerController!,
      );
    });
    _cachedVideoPlayerController!.pause();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoBloc(VideoRepository(FirebaseStorage.instance))
        ..add(FetchVideo(widget.catalogCourse.videoUrl)),
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
                customVideoPlayerController: _customVideoPlayerController,
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
    required CustomVideoPlayerController? customVideoPlayerController,
    required this.catalogCourse,
    required this.onVideoSelected,
  }) : _customVideoPlayerController = customVideoPlayerController;

  final CatalogCourse catalogCourse;
  final CustomVideoPlayerController? _customVideoPlayerController;
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
            child: _customVideoPlayerController != null
                ? CustomVideoPlayer(
                    customVideoPlayerController: _customVideoPlayerController!,
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
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

class PlaylistItem extends StatefulWidget {
  final int index;
  final CatalogCourse catalogCourse;
  final Function(String) onVideoSelected;

  const PlaylistItem({
    Key? key,
    required this.index,
    required this.catalogCourse,
    required this.onVideoSelected,
  }) : super(key: key);

  @override
  _PlaylistItemState createState() => _PlaylistItemState();
}

class _PlaylistItemState extends State<PlaylistItem> {
  CustomVideoPlayerController? _customVideoPlayerController;
  CachedVideoPlayerController? _cachedVideoPlayerController;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  @override
  void dispose() {
    _cachedVideoPlayerController?.dispose();
    _customVideoPlayerController?.dispose();
    super.dispose();
  }

  void _initializeVideoPlayer() {
    _cachedVideoPlayerController = CachedVideoPlayerController.network(
        widget.catalogCourse.playlist[widget.index]);
    _cachedVideoPlayerController!.initialize().then((_) {
      if (!mounted) return; // Check if widget is still mounted
      setState(() {
        _customVideoPlayerController = CustomVideoPlayerController(
          context: context,
          videoPlayerController: _cachedVideoPlayerController!,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onVideoSelected(widget.catalogCourse.playlist[widget.index]);
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
                    '${widget.catalogCourse.courseName} ',
                    style: TobetoTextStyle.poppins(context)
                        .subtitleGrayDarkLight20,
                  ),
                  Text(
                    '${widget.catalogCourse.courseTeacher} ',
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
