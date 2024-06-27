import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/announcement_bloc/announcement_bloc.dart';

import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';
import 'package:tobeto_mobile_app/model/announcement_model.dart';

class AnnouncementCard extends StatelessWidget {
  final Announcement announcement;
  final FocusNode focusNode;

  const AnnouncementCard(
      {super.key, required this.announcement, required this.focusNode});

  String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }

  void _showDetails(BuildContext context) {
    context
        .read<AnnouncementBloc>()
        .add(MarkAsRead(announcement.copyWith(isRead: true)));
    focusNode.unfocus();
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.8,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      announcement.title,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    //Text(announcement.description),
                    Text(
                      announcement.description.replaceAll('\\n', '\n'),
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.calendar_today,
                                size: 16, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(
                              'Tarih: ${_formatDate(announcement.date)}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.getHeight(context) * 0.2,
                    )
                  ],
                ),
              ),
            );
          },
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
          color: announcement.isRead
              ? Theme.of(context).colorScheme.inverseSurface
              : Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(16.0),
          border: Border(
              left: BorderSide(color: TobetoColor.card.lightGreen, width: 7)),
        ),
        child: Padding(
          padding: EdgeInsets.all(ScreenPadding.padding16px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(TobetoText.announcement,
                      style: TobetoTextStyle.poppins(context)
                          .captionBlackNormal12
                          .copyWith(color: TobetoColor.card.lightGreen)),
                  Text(
                    TobetoText.announcementik,
                    style: TobetoTextStyle.poppins(context)
                        .captionBlackNormal12
                        .copyWith(color: TobetoColor.card.lightGreen),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Text(
                announcement.title,
                style: TobetoTextStyle.poppins(context).captionBlackBold18,
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.calendar_month,
                          size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        'Tarih: ${_formatDate(announcement.date)}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    TobetoText.announcementread,
                    style: TobetoTextStyle.poppins(context).captionGrayThin12,
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
