import 'package:flutter/material.dart';
import 'package:login_page/main.dart';
import 'package:login_page/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();

  final _passwordCOntroller = TextEditingController();

  bool _isDataMatched = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: ('Username')),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Value is empty';
                      } else {
                        return null;
                      }
                    }),
                const SizedBox(height: 20),
                TextFormField(
                    controller: _passwordCOntroller,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: ('Password')),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Value is empty';
                      } else {
                        return null;
                      }
                    }),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                        visible: !_isDataMatched,
                        child: Text('Username and password doesnot match')),
                    ElevatedButton.icon(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            checkLogin(context);
                          } else {
                            print('Data is empty');
                          }
                          // checkLogin(context);
                        },
                        icon: const Icon(Icons.check_box_rounded),
                        label: const Text('Login'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext context) async {
    final _username = _usernameController.text;
    final _password = _passwordCOntroller.text;

    if (_username == _password) {
      print('Username and password matches');

      final _sharedPrefs = await SharedPreferences.getInstance();
     await _sharedPrefs.setBool(SAVE_KEY_NAME, true);

      //Home
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Home(),
      ));
    } else {
      // final _errorMessage = 'Username and password doesnot match';
      print('Username and password doesnot match');
    }
    //Snackbar
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text(_errorMessage),
    //   behavior: SnackBarBehavior.floating,
    //   margin: EdgeInsets.all(8),
    // ));
    //Alert Dialog
    // showDialog(
    //     context: context,
    //     builder: (ctx) {
    //       return AlertDialog(
    //         title: Text('Error'),
    //         content: Text(_errorMessage),
    //         actions: [
    //           TextButton(
    //               onPressed: () {
    //                 Navigator.pop(context);
    //               },
    //               child: Text('Close'))
    //         ],
    //       );

    // });
    //Show Text
    //   setState(() {
    //     _isDataMatched = false;
    //   });
  }
}
