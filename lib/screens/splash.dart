import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:login_page/main.dart';
import 'package:login_page/screens/home.dart';
import 'package:login_page/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    gotoLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/11.webp'),
      ),
    );
  }

  Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenLogin()));
  }

  Future<void> checkUserLoggedIn() async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    final _userloggedIn = _sharedPrefs.getBool(SAVE_KEY_NAME);
    if (_userloggedIn == null || _userloggedIn == false) {
      gotoLogin();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    }
  }
}
