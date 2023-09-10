import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madkour_task/core/color_manager.dart';
import 'package:madkour_task/screens/input/input_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner in the top-right corner in production.
      debugShowCheckedModeBanner: false,
      title: 'Madkour App',
      theme: ThemeData(
        // Set the background color for the entire app.
        scaffoldBackgroundColor: ColorsManager.backGroundColor,

        appBarTheme: const AppBarTheme(
          // Customize the app bar's background color and elevation.
          backgroundColor: Colors.white,
          elevation: 0,
        ),

        // Customize the text theme using Google Fonts.
        textTheme: GoogleFonts.abyssinicaSilTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const InputScreen(),
    );
  }
}
