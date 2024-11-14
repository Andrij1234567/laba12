import 'package:flutter/material.dart';
import 'package:laba12/sign_in_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            border: OutlineInputBorder(),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),)
            ),
          ),
          appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                  side: BorderSide(
                      width: 1,
                      color: Colors.black
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),)

              )

          )
      ),

      home: SignInScreen(),
    );
  }
}
