import 'package:flutter/material.dart';
import 'package:myapp/features/courses_page.dart';
import 'package:myapp/features/providers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppProviders(
      child: MaterialApp(
        home: CoursePage(),
      ),
    );
  }
}
