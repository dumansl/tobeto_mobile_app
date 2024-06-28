import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tobeto_mobile_app/model/course_model.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/text.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';
import 'education_details.dart';

class EducationAbout extends StatefulWidget {
  final Course course;

  const EducationAbout({Key? key, required this.course}) : super(key: key);

  @override
  _EducationAboutState createState() => _EducationAboutState();
}

class _EducationAboutState extends State<EducationAbout> {
  bool _isLiked = false;
  bool _isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.course.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
                    return const Text('Resim yüklenemedi.');
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
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          _isLiked ? Icons.favorite : Icons.favorite_border,
                          color: _isLiked ? Colors.red : null,
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
                          color: _isBookmarked ? Colors.yellow : null,
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
              const Divider(
                color: Colors.black,
                thickness: 2,
              ),
              const SizedBox(height: 8.0),
              _buildInfoRow('Eğitim Türü:', widget.course.type),
              _buildInfoRow('Kategori:', widget.course.category),
              _buildInfoRow('Üretici Firma:', widget.course.producer),
              _buildInfoRow('Video:', widget.course.videoNumber.toString()),
              _buildInfoRow('Başlangıç Tarihi:', DateFormat('dd-MM-yyyy').format(widget.course.startTime)),
              _buildInfoRow('Bitiş Tarihi:', DateFormat('dd-MM-yyyy').format(widget.course.endTime)),
              const SizedBox(height: 8.0),
              Text(
                widget.course.content,
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 2),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EducationDetails(
                        course: widget.course,
                        educationId: 'HRp6G8T2HcpZMjQMApaA',
                        asyncEducationId: 'g5RGqVOgtFU3rdU7j0gc',
                        videoId: 'video1',
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
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 20),
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
