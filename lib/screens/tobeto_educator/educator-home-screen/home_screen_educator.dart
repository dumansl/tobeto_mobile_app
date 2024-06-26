import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/educator_announcement_bloc/educator_announcement_bloc.dart';
import 'package:tobeto_mobile_app/blocs/educator_announcement_bloc/educator_announcement_event.dart';
import 'package:tobeto_mobile_app/blocs/educator_announcement_bloc/educator_announcement_state.dart';
import 'package:tobeto_mobile_app/blocs/theme_bloc/theme_bloc.dart';

import 'package:tobeto_mobile_app/screens/home_screen/widgets/nested_scroll.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class HomeScreenEducator extends StatefulWidget {
  const HomeScreenEducator({super.key});

  @override
  State<HomeScreenEducator> createState() => _HomeScreenEducatorState();
}

class _HomeScreenEducatorState extends State<HomeScreenEducator> {
  final ScrollController _scrollController = ScrollController();
  bool _isTopRight = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset >= 100) {
        setState(() {
          _isTopRight = true;
        });
      } else {
        setState(() {
          _isTopRight = false;
        });
      }
    });

    // Fetch announcements when the screen is initialized
    context.read<EducatorAnnouncementBloc>().add(FetchEducatorAnnouncements());
  }

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenPadding.padding12px),
        child: NestedScroll(
          currentScreen: ListView(
            scrollDirection: Axis.vertical,
            children: [
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFF372D55), Color(0xFF88468B)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: Text(
                  TobetoText.educatorHomeMain1,
                  style: TobetoTextStyle.poppins(context)
                      .headlineBlackBold32
                      .copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Switch(
                value: context.read<ThemeBloc>().state == ThemeMode.dark,
                onChanged: (value) {
                  context.read<ThemeBloc>().add(ThemeChanged(value));
                },
              ),
              const EducatorExamplesCard(),
            ],
          ),
          scrollController: _scrollController,
          isTopRight: _isTopRight,
          bucket: bucket,
        ),
      ),
    );
  }
}

class EducatorExamplesCard extends StatelessWidget {
  const EducatorExamplesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EducatorAnnouncementBloc, EducatorAnnouncementState>(
      builder: (context, state) {
        if (state is EducatorAnnouncementLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is EducatorAnnouncementLoaded) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...state.announcements.map((announcement) {
                    return Card(
                      color: Theme.of(context).colorScheme.onPrimary,
                      elevation: 8,
                      child: Padding(
                        padding: EdgeInsets.all(ScreenPadding.padding8px),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              announcement.header,
                              style: TobetoTextStyle.poppins(context)
                                  .captionBlackBold18,
                            ),
                            SizedBox(height: ScreenPadding.padding4px),
                            Text(
                              announcement.content,
                              style: TobetoTextStyle.poppins(context)
                                  .bodyBlackNormal16,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          );
        } else if (state is EducatorAnnouncementError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('No announcements available.'));
        }
      },
    );
  }
}
