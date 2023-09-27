import 'package:flutter/material.dart';
import 'package:news/2_Prsesntation/pages/homepage/homepage.dart';
import './di/dependency_injection.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData();
    return MaterialApp(
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
              primary: Colors.indigo, secondary: Colors.indigoAccent)),
      debugShowCheckedModeBanner: false,
      home: const HomePageWrapper(),
    );
  }
}
