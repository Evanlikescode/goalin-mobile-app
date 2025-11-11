import 'package:flutter/material.dart';
import 'package:goalin/screens/action_menu.dart';
import 'package:goalin/utils/goalin_colors.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Goalin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: appColors['background']!),
      ),
      home: MyHomePage(),
    );
  }
}
