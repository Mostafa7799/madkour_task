import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madkour_task/core/color_manager.dart';
import 'package:madkour_task/screens/input_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Madkour App',
      theme: ThemeData(
        scaffoldBackgroundColor: ColorsManager.backGroundColor,
        textTheme: GoogleFonts.abyssinicaSilTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const InputScreen(),
    );
  }
}
