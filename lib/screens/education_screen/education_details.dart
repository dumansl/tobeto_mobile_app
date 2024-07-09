import 'package:flutter/material.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:tobeto_mobile_app/model/course_model.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/services/education_service.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class EducationDetails extends StatefulWidget {
  final Course course;
  final String educationId;
  final String asyncEducationId;

  const EducationDetails({
    super.key,
    required this.course,
    required this.educationId,
    required this.asyncEducationId,
  });

  @override
  State<EducationDetails> createState() => _EducationDetailsState();
}

class _EducationDetailsState extends State<EducationDetails> {
  CustomVideoPlayerController? _customVideoPlayerController;
  CachedVideoPlayerController? _cachedVideoPlayerController;
  bool _videoInitialized = false;
  int _selectedIndex = 0;
  double _progress = 0.0;
  List<Course> _videos = [];
  Course? _currentVideo;

  @override
  void initState() {
    super.initState();
    fetchVideos();
  }

  Future<void> fetchVideos() async {
    _videos = await EducationService()
        .fetchCourseVideo(widget.educationId, widget.asyncEducationId);
    if (_videos.isNotEmpty) {
      _currentVideo = _videos.firstWhere((video) => !video.isWatched,
          orElse: () => _videos.first);
      initializeVideoPlayer(_currentVideo!.videoUrl);
    } else {
      setState(() {
        _videoInitialized = true;
      });
    }
    await _calculateProgress();
  }

  Future<void> initializeVideoPlayer(String? videoUrl) async {
    if (videoUrl != null && videoUrl.isNotEmpty) {
      _cachedVideoPlayerController =
          CachedVideoPlayerController.network(videoUrl);
      await _cachedVideoPlayerController!.initialize();
      if (mounted) {
        _customVideoPlayerController = CustomVideoPlayerController(
          context: context,
          videoPlayerController: _cachedVideoPlayerController!,
        );
      }
      _cachedVideoPlayerController!.pause();
      setState(() {
        _videoInitialized = true;
      });

      _cachedVideoPlayerController!.addListener(() async {
        if (_cachedVideoPlayerController!.value.position ==
            _cachedVideoPlayerController!.value.duration) {
          final videoId =
              _videos.firstWhere((video) => video.videoUrl == videoUrl).id;
          await EducationService().updateWatchStatus(
              widget.educationId, widget.asyncEducationId, videoId, true);
          await _calculateProgress();
        }
      });
    } else {
      setState(() {
        _videoInitialized = true;
      });
    }
  }

  Future<void> _calculateProgress() async {
    int totalVideos = _videos.length;
    int watchedVideos = 0;

    for (var video in _videos) {
      bool isWatched = await EducationService().getWatchStatus(
          widget.educationId, widget.asyncEducationId, video.id);
      if (isWatched) {
        watchedVideos++;
      }
    }

    setState(() {
      _progress = totalVideos > 0 ? watchedVideos / totalVideos : 0.0;
    });
  }

  @override
  void dispose() {
    _customVideoPlayerController?.dispose();
    _cachedVideoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: FixedAppbar(
        isLeading: false,
        title: Text(
          "Eğitimlerim",
          style: TobetoTextStyle.poppins(context).subHeadlinePurpleBold28,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_videoInitialized && _customVideoPlayerController != null)
            AspectRatio(
              aspectRatio: _cachedVideoPlayerController!.value.aspectRatio,
              child: CustomVideoPlayer(
                customVideoPlayerController: _customVideoPlayerController!,
              ),
            ),
          if (!_videoInitialized)
            const Center(child: CircularProgressIndicator()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.course.title,
                    style:
                        TobetoTextStyle.poppins(context).subtitleBlackBold20),
                const SizedBox(height: 8.0),
                Container(
                  height: 10.0, // Progress bar height
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inverseSurface,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: LinearProgressIndicator(
                    value: _progress,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(TobetoColor.purple),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: _selectedIndex == 0
                              ? TobetoColor.purple
                              : (Theme.of(context).colorScheme.inverseSurface),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10.0),
                        child: Center(
                          child: Text(
                            'Liste',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: _selectedIndex == 0
                                  ? Colors.white
                                  : TobetoColor.purple,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: _selectedIndex == 1
                              ? TobetoColor.purple
                              : (Theme.of(context).colorScheme.inverseSurface),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10.0),
                        child: Center(
                          child: Text(
                            'Detay',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: _selectedIndex == 1
                                  ? Colors.white
                                  : TobetoColor.purple,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: _selectedIndex == 0
                ? _buildVideoList()
                : _buildDetails(isDarkMode),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoList() {
    if (_videos.isEmpty) {
      return const Center(child: Text('Henüz video yok.'));
    }
    return ListView.builder(
      itemCount: _videos.length,
      itemBuilder: (context, index) {
        final video = _videos[index];
        return ListTile(
          leading: const Icon(
            Icons.play_circle_fill,
            color: TobetoColor.purple,
          ),
          title: Text('Video ${index + 1}',
              style: TobetoTextStyle.poppins(context).captionBlackBold18),
          onTap: () {
            setState(() {
              _currentVideo = video;
            });
            initializeVideoPlayer(video.videoUrl);
          },
        );
      },
    );
  }

  Widget _buildDetails(bool isDarkMode) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildDetailItem(Icons.access_time,
                  '${_currentVideo!.videoDuration} dakika', isDarkMode),
              _buildDetailItem(Icons.subscriptions_outlined,
                  '${_currentVideo!.videoPoints} puan', isDarkMode),
              _buildDetailItem(
                  Icons.language, widget.course.language, isDarkMode),
            ],
          ),
          const SizedBox(height: 16.0),
          const Text('Eğitim İçeriği',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(
            color: Colors.black,
            thickness: 2,
          ),
          const SizedBox(height: 8.0),
          Text(
            _currentVideo!.content,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16.0),
          _buildInfoRow('Kategori:', _currentVideo!.videoCategory, isDarkMode),
        ],
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String text, bool isDarkMode) {
    return Container(
      width: 70,
      height: 70,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inverseSurface,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon,
              size: 20,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black),
          const SizedBox(height: 4.0),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          text: '$label ',
          style: TobetoTextStyle.poppins(context).bodyBlackBold16,
          children: <TextSpan>[
            TextSpan(
              text: value,
              style: TobetoTextStyle.poppins(context).captionBlackBold15,
            ),
          ],
        ),
      ),
    );
  }
}
