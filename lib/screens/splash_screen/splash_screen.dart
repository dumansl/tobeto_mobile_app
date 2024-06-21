import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/connect_bloc/connection_bloc.dart';
import 'package:tobeto_mobile_app/blocs/connect_bloc/connection_event.dart';
import 'package:tobeto_mobile_app/blocs/connect_bloc/connection_state.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/services/shared_preferences_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferencesService _sharedPreferencesService;

  @override
  void initState() {
    super.initState();
    _sharedPreferencesService = SharedPreferencesService();
    _internetConnectState();
  }

  _internetConnectState() async {
    await Future.delayed(
      const Duration(seconds: 5),
      () {
        if (mounted) {
          context.read<NetConnectBloc>().add(CheckInternetEvent());
        }
      },
    );
  }

  _navigateToNextScreen() async {
    if (_sharedPreferencesService.isFirstTime()) {
      await _sharedPreferencesService.setFirstTime(false);
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const IntroScreen(),
          ),
        );
      }
    } else if (_sharedPreferencesService.isLoggedIn()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<NetConnectBloc, NetConnectState>(
        listener: (context, state) {
          if (state is ConnectedState) {
            _navigateToNextScreen();
          } else if (state is NotConnectedState) {
            _connectionWarning(context);
          }
        },
        child: _animatedGif(context),
      ),
    );
  }

  _animatedGif(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenPadding.screenpadding),
      width: ScreenUtil.getWidth(context),
      height: ScreenUtil.getHeight(context),
      child: Image.asset(
        ImagePath.splashScreenGif,
        fit: BoxFit.contain,
      ),
    );
  }

  _connectionWarning(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            TobetoText.internetConnectionIssue,
          ),
          content: Text(
            TobetoText.internetConnectionTitle,
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                context.read<NetConnectBloc>().add(CheckInternetEvent());
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: TobetoColor.purple,
              ),
              child: Text(
                TobetoText.internetConnectionButton,
                style: TextStyle(color: TobetoColor.text.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
