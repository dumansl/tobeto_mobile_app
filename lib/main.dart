import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/announcement_bloc/announcement_bloc.dart';
import 'package:tobeto_mobile_app/blocs/exam_bloc/exams_bloc.dart';
import 'package:tobeto_mobile_app/blocs/export_bloc.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_bloc.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_event.dart';
import 'package:tobeto_mobile_app/blocs/review_bloc/review_bloc.dart';
import 'package:tobeto_mobile_app/blocs/video_bloc/video_bloc.dart';
import 'package:tobeto_mobile_app/screens/catalog_screen/catalog_details.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
import 'package:tobeto_mobile_app/services/announcement_service.dart';
import 'package:tobeto_mobile_app/services/video_repositort.dart';
import 'package:tobeto_mobile_app/utils/themes/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const TobetoMobileApp());
}

class TobetoMobileApp extends StatelessWidget {
  const TobetoMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NetConnectBloc>(create: (context) => NetConnectBloc()),
        BlocProvider<CourseBloc>(create: (context) => CourseBloc()),
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<UserBloc>(
            create: (context) => UserBloc()..add(LoadUserData())),
        BlocProvider<ExamBloc>(create: (context) => ExamBloc()),
        BlocProvider<ReviewBloc>(create: (context) => ReviewBloc()),
        BlocProvider<AnnouncementBloc>(
            create: (context) => AnnouncementBloc(AnnouncementService())),
        BlocProvider<VideoBloc>(
          create: (context) =>
              VideoBloc(VideoRepository(FirebaseStorage.instance)),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            theme: lightTheme,
            themeMode: state,
            darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            home: const CatalogDetail(),
          );
        },
      ),
    );
  }
}
