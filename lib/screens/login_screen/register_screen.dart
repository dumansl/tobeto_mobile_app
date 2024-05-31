import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/theme_bloc/theme_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Switch(
            value: context.read<ThemeBloc>().state == ThemeMode.dark,
            onChanged: (value) {
              context.read<ThemeBloc>().add(ThemeChanged(value));
            },
          )
        ],
      ),
    );
  }
}
