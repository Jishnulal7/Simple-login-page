import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:login_page/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                signout(context);
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: SafeArea(child: Center(child: Text('Home'))),
    );
  }

  signout(BuildContext context) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => ScreenLogin()),
        (route) => false);
  }
}
