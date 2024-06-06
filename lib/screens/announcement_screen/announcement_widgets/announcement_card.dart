import 'package:flutter/material.dart';
import '../announcement_screen.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class AnnouncementCard extends StatefulWidget {
  final Announcement announcement;
  final FocusNode focusNode;

  const AnnouncementCard({super.key, required this.announcement, required this.focusNode});

  @override
  State<AnnouncementCard> createState() => _AnnouncementCardState();
}

class _AnnouncementCardState extends State<AnnouncementCard> {
  String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }

  void _showDetails(BuildContext context) {
    setState(() {
      widget.announcement.markAsRead();
    });

    widget.focusNode.unfocus();

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.announcement.title,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(widget.announcement.description),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          'Tarih: ${_formatDate(widget.announcement.date)}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDetails(context),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: widget.announcement.isRead ? TobetoColor.card.lightGrey : TobetoColor.card.cream,
          borderRadius: BorderRadius.circular(16.0),
          border: Border(left: BorderSide(color: TobetoColor.card.lightGreen, width: 7)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Duyuru',
                    style: TobetoTextStyle.poppins.captionBlackNormal12.copyWith(color: TobetoColor.card.lightGreen),
                  ),
                  Text(
                    'İstanbul Kodluyor',
                    style: TobetoTextStyle.poppins.captionBlackNormal12.copyWith(color: TobetoColor.card.lightGreen),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Text(
                widget.announcement.title,
                style: TobetoTextStyle.poppins.captionBlackBold18,
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.calendar_month, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        'Tarih: ${_formatDate(widget.announcement.date)}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Devamını Oku',
                    style: TobetoTextStyle.poppins.captionGrayThin12,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
