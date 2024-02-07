import 'package:al_quran_app/core/utils/constant.dart';
import 'package:al_quran_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String collections = ('collections');
Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: kBackgroundColorLight,
        primaryColor: kPrimaryColor,
      ),
      home: const SplashScreen(),
    );
  }
}
