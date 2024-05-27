import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/connect_bloc/connection.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/constant/screen_util.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
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

  _navigateToLogin() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<NetConnectBloc, NetConnectState>(
        listener: (context, state) async {
          if (state is ConnectedState) {
            _navigateToLogin();
          } else if (state is NotConnectedState) {
            _connectionWarning(context);
          }
        },
        child: _animatedGif(context),
      ),
    );
  }

  Widget _animatedGif(BuildContext context) {
    return SizedBox(
      width: ScreenUtil.getWidth(context),
      height: ScreenUtil.getHeight(context),
      child: Image.asset(
        ImagePath.splashScreenGif,
        fit: BoxFit.fill,
      ),
    );
  }

  Future<dynamic> _connectionWarning(BuildContext context) async {
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
