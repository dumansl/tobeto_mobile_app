import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/export_bloc.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
import 'package:tobeto_mobile_app/services/announcement_service.dart';
import 'package:tobeto_mobile_app/services/job_service.dart';
import 'package:tobeto_mobile_app/services/video_repositort.dart';
import 'package:tobeto_mobile_app/services/application_service.dart';
import 'package:tobeto_mobile_app/services/user_service.dart';
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
  const TobetoMobileApp({
    super.key,
  });

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
                VideoBloc(VideoRepository(FirebaseStorage.instance))),
        BlocProvider<AnnouncementBloc>(
            create: (context) => AnnouncementBloc(AnnouncementService())),
        BlocProvider<ApplicationBloc>(
            create: (context) => ApplicationBloc(ApplicationService())),
        BlocProvider<WorkLifeBloc>(
            create: (context) =>
                WorkLifeBloc(userService: UserService())..add(LoadWorkLife())),
        BlocProvider<EducationLifeBloc>(
            create: (context) => EducationLifeBloc(userService: UserService())
              ..add(LoadEducationLife())),
        BlocProvider<ClubCominitiesBloc>(
            create: (context) => ClubCominitiesBloc(userService: UserService())
              ..add(LoadClubCominities())),
        BlocProvider<ProjectsPrizeBloc>(
            create: (context) => ProjectsPrizeBloc(userService: UserService())
              ..add(LoadProjectsPrize())),
        BlocProvider<SocialMediaBloc>(
            create: (context) => SocialMediaBloc(userService: UserService())
              ..add(LoadSocialMedia())),
        BlocProvider<LanguagesBloc>(
            create: (context) => LanguagesBloc(userService: UserService())
              ..add(LoadLanguages())),
        BlocProvider<SurveyBloc>(create: (context) => SurveyBloc()),
        BlocProvider<JobBloc>(create: (context) => JobBloc(JobService())),
      ],
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            theme: lightTheme,
            themeMode: state,
            darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
