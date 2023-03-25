import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'views/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.pink
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.grey[800],
      ),
      home: const SplashScreen(title: 'Share References'),
    );
  }
}
