import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Screen',
        ),
      ),
      body: Center(
        child: MaterialButton(
          child: const Text('Go to Detail'),
          onPressed: () {
            Navigator.of(context).pushNamed('/detail');
          },
        ),
      ),
    );
  }
}
