import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:tobeto_mobile_app/model/course_model.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/services/education_service.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/blocs/course_bloc/course_bloc.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

class EducationDetails extends StatefulWidget {
  final Course course;
  final String educationId;
  final String asyncEducationId;
  final String userId;

  const EducationDetails({
    super.key,
    required this.course,
    required this.educationId,
    required this.asyncEducationId,
    required this.userId,
  });

  @override
  State<EducationDetails> createState() => _EducationDetailsState();
}

class _EducationDetailsState extends State<EducationDetails> {
  VideoPlayerController? _videoPlayerController;
  bool _videoInitialized = false;
  bool _isMuted = false;
  int _selectedIndex = 0;
  double _progress = 0.0;
  List<Course> _videos = [];
  Course? _currentVideo;
  double _playbackSpeed = 1.0;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    fetchVideos();
  }

  Future<void> fetchVideos() async {
    try {
      setState(() {
        _loading = true;
      });

      _videos = await EducationService().fetchCourseVideo(widget.educationId, widget.asyncEducationId);
      if (_videos.isNotEmpty) {
        for (int i = 0; i < _videos.length; i++) {
          bool isWatched = await EducationService().getWatchStatus(widget.userId, _videos[i].id);
          _videos[i] = _videos[i].copyWith(isWatched: isWatched);
        }
        _currentVideo = _videos.firstWhere((video) => !video.isWatched, orElse: () => _videos.first);
        await initializeVideoPlayer(_currentVideo!.videoUrl);
      } else {
        setState(() {
          _videoInitialized = true;
        });
      }
      await _calculateProgress();
    } catch (e) {
      setState(() {
        _videoInitialized = true;
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  Future<void> initializeVideoPlayer(String? videoUrl) async {
    if (videoUrl != null && videoUrl.isNotEmpty) {
      try {
        _videoPlayerController = VideoPlayerController.network(videoUrl);
        await _videoPlayerController!.initialize();
        setState(() {
          _videoInitialized = true;
        });

        _videoPlayerController!.addListener(() async {
          if (_videoPlayerController!.value.position == _videoPlayerController!.value.duration) {
            final videoId = _videos.firstWhere((video) => video.videoUrl == videoUrl).id;
            await EducationService()
                .updateWatchStatus(widget.userId, videoId, widget.educationId, widget.asyncEducationId, true);
            await _calculateProgress();
            _playNextVideo();
          }
        });
      } catch (e) {
        setState(() {
          _videoInitialized = true;
        });
      }
    } else {
      setState(() {
        _videoInitialized = true;
      });
    }
  }

  void _playNextVideo() {
    if (_videos.any((video) => !video.isWatched)) {
      _currentVideo = _videos.firstWhere((video) => !video.isWatched);
    } else {
      _currentVideo = _videos.first;
    }
    initializeVideoPlayer(_currentVideo!.videoUrl);
  }

  Future<void> _calculateProgress() async {
    int totalVideos = _videos.length;
    int watchedVideos = 0;

    for (var video in _videos) {
      bool isWatched = await EducationService().getWatchStatus(widget.userId, video.id);
      if (isWatched) {
        watchedVideos++;
      }
    }

    setState(() {
      _progress = totalVideos > 0 ? watchedVideos / totalVideos : 0.0;
    });

    if (_progress == 1.0) {
      await EducationService().updateCourseCompletionStatus(
        widget.userId,
        widget.educationId,
        widget.asyncEducationId,
      );

      // CourseBloc'a güncelleme olayını gönder
      // ignore: use_build_context_synchronously
      context.read<CourseBloc>().add(UpdateCourseStatus(
            widget.userId,
            widget.educationId,
            widget.asyncEducationId,
          ));
    }
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    super.dispose();
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _videoPlayerController?.setVolume(_isMuted ? 0 : 1);
    });
  }

  void _changePlaybackSpeed(double speed) {
    setState(() {
      _playbackSpeed = speed;
      _videoPlayerController?.setPlaybackSpeed(speed);
    });
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
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (_videoInitialized && _videoPlayerController != null)
                Column(
                  children: [
                    AspectRatio(
                      aspectRatio: _videoPlayerController!.value.aspectRatio,
                      child: Stack(
                        children: [
                          VideoPlayer(_videoPlayerController!),
                        ],
                      ),
                    ),
                    VideoProgressIndicator(_videoPlayerController!, allowScrubbing: true),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            _videoPlayerController!.value.isPlaying ? Icons.pause : Icons.play_arrow,
                          ),
                          onPressed: () {
                            setState(() {
                              _videoPlayerController!.value.isPlaying
                                  ? _videoPlayerController!.pause()
                                  : _videoPlayerController!.play();
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            _isMuted ? Icons.volume_off : Icons.volume_up,
                          ),
                          onPressed: _toggleMute,
                        ),
                        PopupMenuButton<double>(
                          initialValue: _playbackSpeed,
                          onSelected: _changePlaybackSpeed,
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: 0.5,
                              child: Text("0.5x"),
                            ),
                            const PopupMenuItem(
                              value: 1.0,
                              child: Text("1.0x"),
                            ),
                            const PopupMenuItem(
                              value: 1.5,
                              child: Text("1.5x"),
                            ),
                            const PopupMenuItem(
                              value: 2.0,
                              child: Text("2.0x"),
                            ),
                          ],
                          child: Text("${_playbackSpeed}x"),
                        ),
                      ],
                    ),
                  ],
                ),
              if (!_videoInitialized) const Center(child: CircularProgressIndicator()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.course.videoName, style: TobetoTextStyle.poppins(context).subtitleBlackBold20),
                    const SizedBox(height: 8.0),
                    Container(
                      height: 10.0, // Progress bar height
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inverseSurface,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: LinearProgressIndicator(
                        value: _progress,
                        valueColor: const AlwaysStoppedAnimation<Color>(TobetoColor.purple),
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
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                            child: Center(
                              child: Text(
                                'Liste',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: _selectedIndex == 0 ? Colors.white : TobetoColor.purple,
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
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                            child: Center(
                              child: Text(
                                'Detay',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: _selectedIndex == 1 ? Colors.white : TobetoColor.purple,
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
                child: _selectedIndex == 0 ? _buildVideoList() : _buildDetails(isDarkMode),
              ),
            ],
          ),
          if (_loading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(
                  color: TobetoColor.purple,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildVideoList() {
    return ListView.builder(
      itemCount: _videos.length,
      itemBuilder: (context, index) {
        final video = _videos[index];
        return ListTile(
          leading: const Icon(
            Icons.play_circle_fill,
            color: TobetoColor.purple,
          ),
          title: Text('Video ${index + 1}', style: TobetoTextStyle.poppins(context).captionBlackBold18),
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
              _buildDetailItem(Icons.access_time, '${_currentVideo!.videoDuration} dakika', isDarkMode),
              _buildDetailItem(Icons.subscriptions_outlined, '${_currentVideo!.videoPoints} puan', isDarkMode),
              _buildDetailItem(Icons.language, widget.course.language, isDarkMode),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(TobetoText.educationContent, style: TobetoTextStyle.poppins(context).captionBlackBold18),
          const Divider(
            color: Colors.black,
            thickness: 2,
          ),
          const SizedBox(height: 8.0),
          Text(
            _currentVideo!.content,
            style: TobetoTextStyle.poppins(context).bodyBlackNormal16,
          ),
          const SizedBox(height: 16.0),
          _buildInfoRow(TobetoText.educationCategory, _currentVideo!.videoCategory, isDarkMode),
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
          Icon(icon, size: 20, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
          const SizedBox(height: 4.0),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 12, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
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
