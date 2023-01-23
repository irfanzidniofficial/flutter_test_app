import 'package:flutter/material.dart';
import 'package:flutter_test_app/presentation/main_screen.dart';
import 'package:flutter_test_app/shared/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comictoon App',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: Colors.black,
              secondary: secondaryColor,
              background: Colors.white,
            ),
        textTheme: myTextTheme,
      ),
      home: const MainScreen(),
    );
  }
}
