import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/course_bloc/course_bloc.dart';
import 'package:tobeto_mobile_app/blocs/theme_bloc/theme_bloc.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
import 'package:tobeto_mobile_app/utils/themes/theme.dart';
import 'blocs/connect_bloc/connection_bloc.dart';
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
      ],
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            theme: lightTheme,
            themeMode: state,
            darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            home: const RegisterScreen(), // Kendinize göre değiştirin
          );
        },
      ),
    );
  }
}
