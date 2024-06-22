import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tobeto_mobile_app/model/catalog_model.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/services/video_repositort.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:tobeto_mobile_app/blocs/video_bloc/video_bloc.dart';
import 'package:tobeto_mobile_app/blocs/video_bloc/video_event.dart';
import 'package:tobeto_mobile_app/blocs/video_bloc/video_state.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CatalogVideo extends StatefulWidget {
  const CatalogVideo({super.key, required this.catalogCourse});
  final CatalogCourse catalogCourse;
  @override
  State<CatalogVideo> createState() => _CatalogDetailState();
}

int _selectedindex = 0;
int _selectedVideoIndex = -1;
bool isPlaylistPage = true;

class _CatalogDetailState extends State<CatalogVideo> {
  CustomVideoPlayerController? _customVideoPlayerController;
  CachedVideoPlayerController? _cachedVideoPlayerController;

  @override
  void dispose() {
    _customVideoPlayerController?.dispose();
    _cachedVideoPlayerController?.dispose();
    super.dispose();
  }

  void name(params) {}
  Future<void> initializeVideoPlayer(String videoUrl) async {
    _cachedVideoPlayerController =
        CachedVideoPlayerController.network(videoUrl);
    await _cachedVideoPlayerController!.initialize();
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _cachedVideoPlayerController!,
    );
    _cachedVideoPlayerController!.pause();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoBloc(VideoRepository(FirebaseStorage.instance))
        ..add(FetchVideo(widget.catalogCourse.videoUrl)),
      child: Scaffold(
        appBar: const FixedAppbar(title: 'Catalog'),
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
                    return CatalogContent(
                      customVideoPlayerController: _customVideoPlayerController,
                      catalogCourse: widget.catalogCourse,
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

class CatalogContent extends StatelessWidget {
  const CatalogContent({
    super.key,
    required CustomVideoPlayerController? customVideoPlayerController,
    required this.catalogCourse,
  }) : _customVideoPlayerController = customVideoPlayerController;
  final CatalogCourse catalogCourse;

  final CustomVideoPlayerController? _customVideoPlayerController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Center(
          child: Container(
            width: ScreenUtil.getWidth(context) * 0.92,
            height: ScreenUtil.getHeight(context) * 0.26,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              gradient: LinearGradient(
                colors: [
                  TobetoColor.purple,
                  TobetoColor.rainbow.lineargreen,
                  TobetoColor.rainbow.linaergreenv2,
                  TobetoColor.rainbow.linearyellow,
                  TobetoColor.purple
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0, top: 3),
              child: Column(
                children: [
                  Row(
                    children: [
                      Align(
                        alignment: Alignment
                            .bottomCenter, // Center the white container
                        child: Container(
                          margin: const EdgeInsets.only(top: 2),
                          width: ScreenUtil.getWidth(context) * 0.9,
                          height: ScreenUtil.getHeight(context) * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: CustomVideoPlayer(
                            customVideoPlayerController:
                                _customVideoPlayerController!,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenPadding.padding16px),
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
          color: Colors.amber,
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text("data"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("data"),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class playlist extends StatelessWidget {
  const playlist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 9,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(
            Icons.play_circle_filled,
            color: _selectedVideoIndex == index ? Colors.purple : Colors.grey,
            size: 40,
          ),
          title: const Text(
            'Gurkan isiten',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: const Text(
            'Gurkan isiten gurkan isiten',
            style: TextStyle(color: Colors.black),
          ),
          onTap: () {
            _selectedVideoIndex = index;
          },
        );
      },
    );
  }
}

class content extends StatelessWidget {
  const content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: const Text('Content Container'), // İçerik sayfası
    );
  }
}
