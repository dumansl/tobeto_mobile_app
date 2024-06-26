import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/educator_announcement_bloc/educator_announcement_bloc.dart';
import 'package:tobeto_mobile_app/blocs/educator_announcement_bloc/educator_announcement_event.dart';
import 'package:tobeto_mobile_app/blocs/export_bloc.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
import 'package:tobeto_mobile_app/services/educator_announcement.dart';
import 'package:tobeto_mobile_app/services/video_repository.dart';
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
        BlocProvider<AnnouncementBloc>(create: (context) => AnnouncementBloc()),
        BlocProvider<VideoBloc>(
            create: (context) =>
                VideoBloc(VideoRepository(FirebaseStorage.instance))),
        BlocProvider<ApplicationBloc>(create: (context) => ApplicationBloc()),
        BlocProvider<WorkLifeBloc>(
            create: (context) => WorkLifeBloc()..add(LoadWorkLife())),
        BlocProvider<EducationLifeBloc>(
            create: (context) => EducationLifeBloc()..add(LoadEducationLife())),
        BlocProvider<ClubCominitiesBloc>(
            create: (context) =>
                ClubCominitiesBloc()..add(LoadClubCominities())),
        BlocProvider<ProjectsPrizeBloc>(
            create: (context) => ProjectsPrizeBloc()..add(LoadProjectsPrize())),
        BlocProvider<SocialMediaBloc>(
            create: (context) => SocialMediaBloc()..add(LoadSocialMedia())),
        BlocProvider<LanguagesBloc>(
            create: (context) => LanguagesBloc()..add(LoadLanguages())),
        BlocProvider<SurveyBloc>(create: (context) => SurveyBloc()),
        BlocProvider<JobBloc>(create: (context) => JobBloc()),
        BlocProvider<CompetenciesBloc>(
            create: (context) => CompetenciesBloc()..add(LoadSkills())),
        BlocProvider<CertificateBloc>(
            create: (context) => CertificateBloc()..add(LoadCertificate())),
        BlocProvider<ProfilePhotoBloc>(
            create: (context) => ProfilePhotoBloc()..add(LoadProfilePhoto())),
        BlocProvider<PressBloc>(
            create: (context) => PressBloc()..add(FetchPress())),
        BlocProvider<BlogBloc>(create: (context) => BlogBloc()),
        BlocProvider(
          create: (context) => EducatorAnnouncementBloc(
            announcementRepository: EducatorAnnouncementRepository(),
          )..add(FetchEducatorAnnouncements()),
        ),
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
