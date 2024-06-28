import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/model/course_model.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/services/education_service.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class EducationDetails extends StatefulWidget {
  final Course course;
  final String educationId;
  final String asyncEducationId;
  final String videoId;

  const EducationDetails({
    super.key,
    required this.course,
    required this.educationId,
    required this.asyncEducationId,
    required this.videoId,
  });

  @override
  // ignore: library_private_types_in_public_api
  _EducationDetailsState createState() => _EducationDetailsState();
}

class _EducationDetailsState extends State<EducationDetails> {
  CustomVideoPlayerController? _customVideoPlayerController;
  CachedVideoPlayerController? _cachedVideoPlayerController;
  bool _videoInitialized = false;
  int _selectedIndex = 0;
  bool _isLiked = false;
  bool _isBookmarked = false;
  Course? _courseDetails;

  @override
  void initState() {
    super.initState();
    fetchVideoDetails();
  }

  Future<void> fetchVideoDetails() async {
    Course courseDetails = await EducationService().fetchCourseVideo(
      widget.educationId,
      widget.asyncEducationId,
      widget.videoId,
    );
    setState(() {
      _courseDetails = courseDetails;
    });
    initializeVideoPlayer(courseDetails.videoUrl);
  }

  Future<void> initializeVideoPlayer(String? videoUrl) async {
    if (videoUrl != null && videoUrl.isNotEmpty) {
      _cachedVideoPlayerController = CachedVideoPlayerController.network(videoUrl);
      await _cachedVideoPlayerController!.initialize();
      _customVideoPlayerController = CustomVideoPlayerController(
        // ignore: use_build_context_synchronously
        context: context,
        videoPlayerController: _cachedVideoPlayerController!,
      );
      _cachedVideoPlayerController!.pause();
      setState(() {
        _videoInitialized = true;
      });
    } else {
      setState(() {
        _videoInitialized = true;
      });
    }
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

    if (_courseDetails == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(_courseDetails!.title, style: TobetoTextStyle.poppins(context).subtitleBlackBold20),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        _isLiked ? Icons.favorite : Icons.favorite_border,
                        color: _isLiked ? Colors.red : (isDarkMode ? Colors.white : null),
                      ),
                      onPressed: () {
                        setState(() {
                          _isLiked = !_isLiked;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                        color: _isBookmarked ? Colors.yellow : (isDarkMode ? Colors.white : null),
                      ),
                      onPressed: () {
                        setState(() {
                          _isBookmarked = !_isBookmarked;
                        });
                      },
                    ),
                  ],
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
                          color:
                              _selectedIndex == 0 ? TobetoColor.purple : (Theme.of(context).colorScheme.inverseSurface),
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
                          color:
                              _selectedIndex == 1 ? TobetoColor.purple : (Theme.of(context).colorScheme.inverseSurface),
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
    );
  }

  Widget _buildVideoList() {
    return ListView.builder(
      itemCount: _courseDetails!.playlist.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(
            Icons.play_circle_fill,
            color: TobetoColor.purple,
          ),
          title: Text('Video ${index + 1}', style: TobetoTextStyle.poppins(context).captionBlackBold18),
          onTap: () {
            initializeVideoPlayer(_courseDetails!.playlist[index]);
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
              _buildDetailItem(Icons.access_time, '${_courseDetails!.videoDuration} dakika', isDarkMode),
              _buildDetailItem(Icons.subscriptions_outlined, '${_courseDetails!.videoPoints} puan', isDarkMode),
              _buildDetailItem(Icons.language, _courseDetails!.language, isDarkMode),
            ],
          ),
          const SizedBox(height: 16.0),
          const Text('Eğitim İçeriği', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(
            color: Colors.black,
            thickness: 2,
          ),
          const SizedBox(height: 8.0),
          Text(
            _courseDetails!.content,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16.0),
          _buildInfoRow('Kategori:', _courseDetails!.videoCategory, isDarkMode),
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
          Icon(icon, size: 20, color: Theme.of(context).colorScheme.onSecondary),
          const SizedBox(height: 4.0),
          Flexible(
            child: Text(
              text,
              style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.onSecondary),
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
