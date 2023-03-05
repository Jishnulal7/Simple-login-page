import 'package:flutter/material.dart';
import 'package:login_page/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

const SAVE_KEY_NAME = 'UserLogin';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Login Form',
      home: ScreenSplash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
