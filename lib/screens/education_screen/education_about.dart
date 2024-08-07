import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tobeto_mobile_app/model/course_model.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/services/education_service.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';
import 'education_details.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

class EducationAbout extends StatefulWidget {
  final Course course;

  const EducationAbout({super.key, required this.course});

  @override
  // ignore: library_private_types_in_public_api
  _EducationAboutState createState() => _EducationAboutState();
}

class _EducationAboutState extends State<EducationAbout> {
  bool _isLiked = false;
  bool _isBookmarked = false;

  String? _userId;

  @override
  void initState() {
    super.initState();
    _getUserId();
    _fetchFavoriteAndBookmarkStatus();
  }

  void _getUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      _userId = user?.uid;
    });
  }

  Future<void> _fetchFavoriteAndBookmarkStatus() async {
    if (_userId != null) {
      _isLiked = await EducationService().getFavoriteStatus(_userId!, widget.course.id);
      _isBookmarked = await EducationService().getBookmarkStatus(_userId!, widget.course.id);
      setState(() {});
    }
  }

  Future<void> _updateFavoriteStatus() async {
    if (_userId != null) {
      setState(() {
        _isLiked = !_isLiked;
      });
      await EducationService().updateFavoriteStatus(_userId!, widget.course.id, _isLiked);
    }
  }

  Future<void> _updateBookmarkStatus() async {
    if (_userId != null) {
      setState(() {
        _isBookmarked = !_isBookmarked;
      });
      await EducationService().updateBookmarkStatus(_userId!, widget.course.id, _isBookmarked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FixedAppbar(
        title: Text(
          TobetoText.bottomIconEducation,
          style: TobetoTextStyle.poppins(context).subHeadlinePurpleBold28,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      widget.course.imageUrl,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Text(TobetoText.mainEducationNotificationImage);
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.course.title,
                          style: TobetoTextStyle.poppins(context).captionBlackBold24,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              _isLiked ? Icons.favorite : Icons.favorite_border,
                              color: _isLiked
                                  ? Colors.red
                                  : Theme.of(context).brightness == Brightness.dark
                                      ? Colors.white
                                      : null,
                            ),
                            onPressed: _updateFavoriteStatus,
                          ),
                          IconButton(
                            icon: Icon(
                              _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                              color: _isBookmarked
                                  ? Colors.yellow
                                  : Theme.of(context).brightness == Brightness.dark
                                      ? Colors.white
                                      : null,
                            ),
                            onPressed: _updateBookmarkStatus,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildDetailItem(Icons.access_time, '${widget.course.duration} dakika'),
                      _buildDetailItem(Icons.subscriptions_outlined, '${widget.course.points} puan'),
                      _buildDetailItem(Icons.language, widget.course.language),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Eğitim İçeriği',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                    thickness: 2,
                  ),
                  const SizedBox(height: 8.0),
                  _buildInfoRow(TobetoText.educationType, widget.course.type),
                  _buildInfoRow(TobetoText.educationCategory, widget.course.category),
                  _buildInfoRow(TobetoText.educationProducer, widget.course.producer),
                  _buildInfoRow(TobetoText.educationVideo, widget.course.videoNumber.toString()),
                  _buildInfoRow(TobetoText.educationStart, DateFormat('dd-MM-yyyy').format(widget.course.startTime)),
                  _buildInfoRow(TobetoText.educationFinish, DateFormat('dd-MM-yyyy').format(widget.course.endTime)),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EducationDetails(
                                course: widget.course,
                                educationId: widget.course.educationId,
                                asyncEducationId: widget.course.asyncEducationId,
                                userId: _userId!,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TobetoColor.purple,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          textStyle: const TextStyle(fontSize: 14),
                        ),
                        child: Text(TobetoText.mainGoEducation),
                      ),
                    ),
                  ),
                  Text(
                    widget.course.content,
                    style: TobetoTextStyle.poppins(context).bodyBlackNormal16,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String text) {
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
              style: TobetoTextStyle.poppins(context).captionBlackNormal12,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          text: '$label ',
          style: TobetoTextStyle.poppins(context).bodyBlackBold16,
          children: <TextSpan>[
            TextSpan(
              text: value,
              style: const TextStyle(fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
