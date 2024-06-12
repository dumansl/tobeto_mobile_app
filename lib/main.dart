import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/export_bloc.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_bloc.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_event.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
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
        BlocProvider<UserBloc>(create: (context) => UserBloc()..add(LoadUserData())),
      ],
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            theme: lightTheme,
            themeMode: state,
            darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(), // Kendinize göre değiştirin
          );
        },
      ),
    );
  }
}
