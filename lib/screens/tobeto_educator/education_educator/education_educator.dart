import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tobeto_mobile_app/blocs/calendar_bloc/calendar_bloc.dart';
import 'package:tobeto_mobile_app/blocs/calendar_bloc/calendar_event.dart';
import 'package:tobeto_mobile_app/blocs/calendar_bloc/calendar_state.dart';

import 'package:tobeto_mobile_app/model/calendar_model.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';

import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class SimpleEducationScreen extends StatefulWidget {
  const SimpleEducationScreen({super.key});

  @override
  State<SimpleEducationScreen> createState() => _SimpleEducationScreenState();
}

class _SimpleEducationScreenState extends State<SimpleEducationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalendarBloc()..add(FetchLessons()),
      child: Scaffold(
        appBar: FixedAppbar(
          title: Text(
            'Eğitimler',
            style: TobetoTextStyle.poppins(context).subHeadlinePurpleBold28,
          ),
          isLeading: false,
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<CalendarBloc, CalendarState>(
                builder: (context, state) {
                  if (state is CalendarLoaded) {
                    List<Lesson> lessons = state.lessons;
                    return ListView.builder(
                      itemCount: lessons.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Theme.of(context).colorScheme.onPrimary,
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).colorScheme.shadow,
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                lessons[index].title,
                                style: TobetoTextStyle.poppins(context)
                                    .bodyBlackBold16,
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'Instructor: ${lessons[index].instructor}',
                                style: TobetoTextStyle.poppins(context)
                                    .bodyBlackBold16,
                              ),
                              const SizedBox(height: 8.0),
                              const SizedBox(height: 8.0),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle navigation to details
                                },
                                child: Text(
                                  'Eğitime Başla',
                                  style: TobetoTextStyle.poppins(context)
                                      .bodyBlackLight16,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
