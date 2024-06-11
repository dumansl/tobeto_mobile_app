import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class EducationDetails extends StatefulWidget {
  final String imageUrl;
  final String videoName;
  final int videoDuration;
  final int videoPoints;
  final String videoLanguage;
  final String educationContent;

  const EducationDetails({
    super.key,
    required this.imageUrl,
    required this.videoName,
    required this.videoDuration,
    required this.videoPoints,
    required this.videoLanguage,
    required this.educationContent,
  });

  @override
  _EducationDetailsState createState() => _EducationDetailsState();
}

class _EducationDetailsState extends State<EducationDetails> {
  int _selectedIndex = 0;
  int _selectedVideoIndex = -1;
  bool _isLiked = false;
  bool _isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TobetoText.bottomIconEducation, style: TobetoTextStyle.poppins.subHeadlineBlackBold28),
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              widget.imageUrl,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Text('Resim yüklenemedi.');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(widget.videoName, style: TobetoTextStyle.poppins.subtitleBlackBold20),
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
                          color: _selectedIndex == 0 ? TobetoColor.purple : Colors.grey[200],
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
                              fontFamily: 'Poppins',
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
                          color: _selectedIndex == 1 ? TobetoColor.purple : Colors.grey[200],
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
                              fontFamily: 'Poppins',
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
            child: _selectedIndex == 0 ? _buildVideoList() : _buildDetails(),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoList() {
    return ListView.builder(
      itemCount: 7,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(
            Icons.play_circle_fill,
            color: _selectedVideoIndex == index ? TobetoColor.purple : Colors.grey,
          ),
          title: Text('Video $index', style: TobetoTextStyle.poppins.captionBlackNormal18),
          subtitle: Text('Açıklama açıklama açıklama açıklama', style: TobetoTextStyle.poppins.captionGrayLightLight15),
          onTap: () {
            setState(() {
              _selectedVideoIndex = index;
            });
          },
        );
      },
    );
  }

  Widget _buildDetails() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildDetailItem(Icons.access_time, '${widget.videoDuration} dakika'),
              _buildDetailItem(Icons.subscriptions_outlined, '${widget.videoPoints} puan'),
              _buildDetailItem(Icons.language, widget.videoLanguage),
            ],
          ),
          const SizedBox(height: 16.0),
          Text('Eğitim İçeriği', style: TobetoTextStyle.poppins.captionBlackBold18),
          const Divider(
            color: Colors.black,
            thickness: 2,
          ),
          const SizedBox(height: 8.0),
          Text(
            widget.educationContent,
            style: TobetoTextStyle.poppins.captionGrayThin18,
          ),
        ],
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
              style: const TextStyle(fontFamily: 'Poppins', fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
