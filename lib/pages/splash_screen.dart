import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:tobeto_mobile_app/blocs/connect_internet/net_connect_bloc.dart';
import 'package:tobeto_mobile_app/blocs/connect_internet/net_connect_event.dart';
import 'package:tobeto_mobile_app/blocs/connect_internet/net_connect_state.dart';
import 'package:tobeto_mobile_app/pages/pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showGif = false;

  @override
  void initState() {
    super.initState();
    // NetControl olayını tetikleyerek bağlantı durumunu kontrol edin
    context.read<NetConnectBloc>().add(NetControl());
  }

  void _startGifTimer() {
    setState(() {
      _showGif = true; // Hemen gif'i gösterin
    });
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _showGif = false; // 5 saniye sonra gif'i gizleyin
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<NetConnectBloc, NetConnectState>(
          listener: (context, state) {
            if (state is NetConnected) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            } else if (state is NetConnectFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('İnternet bağlantınızı kontrol ediniz'),
                ),
              );
            } else if (state is NetNotConnect) {
              _startGifTimer(); // Bağlantı durumu kontrolünden sonra gif'i göster
            }
          },
          builder: (context, state) {
            if (state is NetConnecting || _showGif) {
              return Image.asset(
                  'assets/gifs/splash_screen.gif'); // Yerel GIF dosyasını göster
            } else {
              return const Text('İnternet durumu kontrol ediliyor...');
            }
          },
        ),
      ),
    );
  }
}
