import 'package:flutter/material.dart';

class TobetoHomeScreen extends StatelessWidget {
  const TobetoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guest Home'),
      ),
      body: const Center(
        child: Text('Welcome Guest!'),
      ),
    );
  }
}
