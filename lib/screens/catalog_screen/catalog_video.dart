import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tobeto_mobile_app/blocs/video_bloc/video_bloc.dart';
import 'package:tobeto_mobile_app/blocs/video_bloc/video_event.dart';
import 'package:tobeto_mobile_app/blocs/video_bloc/video_state.dart';
import 'package:tobeto_mobile_app/model/catalog_model.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/services/video_repository.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CatalogVideo extends StatefulWidget {
  const CatalogVideo({super.key, required this.catalogCourse});
  final CatalogCourse catalogCourse;

  @override
  State<CatalogVideo> createState() => _CatalogDetailState();
}

class _CatalogDetailState extends State<CatalogVideo> {
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
        appBar: FixedAppbar(
          title: Text(
            "Katalog",
            style: TobetoTextStyle.poppins(context).subHeadlinePurpleBold28,
          ),
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
          Center(
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: ScreenUtil.getWidth(context) * 1,
                        height: ScreenUtil.getHeight(context) * 0.30,
                        decoration: const BoxDecoration(),
                        child: _customVideoPlayerController != null
                            ? CustomVideoPlayer(
                                customVideoPlayerController:
                                    _customVideoPlayerController!,
                              )
                            : const Center(
                                child: CircularProgressIndicator(),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenPadding.padding24px),
            child: Row(
              children: [
                SizedBox(
                  width: ScreenUtil.getWidth(context) * 0.8,
                  child: Text(
                    catalogCourse.courseName,
                    style: TobetoTextStyle.poppins(context).headlineBlackBold32,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: TobetoColor.card.shadowColor.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 6), // changes position of shadow
                ),
              ],
              color: TobetoColor.purple,
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: ScreenPadding.padding24px),
                  child: Text(
                    'playlist',
                    style: TobetoTextStyle.poppins(context).captionWhiteBold30,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Expanded(
                    child: TabBarView(
                      children: [
                        Playlist(
                          catalogCourse: catalogCourse,
                          onVideoSelected: onVideoSelected,
                        ),
                        DescriptionTab(
                          catalogCourse: catalogCourse,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
    return BlocProvider(
      create: (context) => VideoBloc(VideoRepository(FirebaseStorage.instance)),
      child: PlaylistContent(
          catalogCourse: catalogCourse, onVideoSelected: onVideoSelected),
    );
  }
}

class PlaylistContent extends StatefulWidget {
  final CatalogCourse catalogCourse;
  final Function(String) onVideoSelected;

  const PlaylistContent({
    super.key,
    required this.catalogCourse,
    required this.onVideoSelected,
  });

  @override
  State<PlaylistContent> createState() => _PlaylistContentState();
}

class _PlaylistContentState extends State<PlaylistContent> {
  int _selectedVideoIndex = -1;
  late ScrollController playlistController;

  @override
  void initState() {
    super.initState();
    playlistController = ScrollController();
    playlistController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (playlistController.position.atEdge) {
      if (playlistController.position.pixels != 0) {
        // Firebase'den yeni veri çekme işlemini başlatabilirsin
      }
    }
  }

  @override
  void dispose() {
    playlistController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: playlistController,
      itemCount: widget.catalogCourse.playlist.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(
            _selectedVideoIndex == index
                ? Icons.play_circle_filled
                : Icons.play_circle_filled,
            color: _selectedVideoIndex == index ? Colors.purple : Colors.grey,
            size: 50,
          ),
          title: Text('${widget.catalogCourse.courseName} ',
              style: _selectedVideoIndex == index
                  ? TobetoTextStyle.poppins(context).captionMediumBlack20
                  : TobetoTextStyle.poppins(context).subtitleGrayDarkLight20),
          subtitle: Text('${widget.catalogCourse.courseTeacher} ',
              style: _selectedVideoIndex == index
                  ? TobetoTextStyle.poppins(context).bodyBlackLight16
                  : TobetoTextStyle.poppins(context).bodyGrayDarkLight16),
          onTap: () {
            setState(() {
              _selectedVideoIndex = index;
            });
            widget.onVideoSelected(widget.catalogCourse.playlist[index]);
          },
        );
      },
    );
  }
}

class DescriptionTab extends StatelessWidget {
  final CatalogCourse catalogCourse;

  const DescriptionTab({
    Key? key,
    required this.catalogCourse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Açıklama Sayfası',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            'Burada ${catalogCourse.courseName} için açıklama içeriği gösterilebilir.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
