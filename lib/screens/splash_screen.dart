import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/screens/pages.dart';
import '../blocs/connect_bloc/connection_bloc.dart';
import '../blocs/connect_bloc/connection_event.dart';
import '../blocs/connect_bloc/connection_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () async {
      context.read<NetConnectBloc>().add(CheckInternetEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<NetConnectBloc, NetConnectState>(
          listener: (context, state) async {
            if (state is ConnectedState) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            } else {
              await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('İnternet Bağlantısı'),
                    content: const Text('İnternet bağlantınızı kontrol edin.'),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            context
                                .read<NetConnectBloc>()
                                .add(CheckInternetEvent());
                            Navigator.pop(context);
                          },
                          child: const Text('Tamam')),
                    ],
                  );
                },
              );
            }
          },
          child: Image.asset("assets/gifs/splash_screen.gif"),
        ),
      ),
    );
  }
}
