import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/theme_bloc/theme_bloc.dart';

class DarkLightThema extends StatelessWidget {
  const DarkLightThema({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          
        ],
      ),
    );
  }
}
