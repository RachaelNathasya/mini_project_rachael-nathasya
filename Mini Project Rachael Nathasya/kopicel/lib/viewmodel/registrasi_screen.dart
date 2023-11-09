import 'package:flutter/material.dart';
import 'package:kopicel/view/home_page.dart';
import 'package:kopicel/view/login_screen.dart';
import 'package:kopicel/services/user_service.dart';

class RegistrasiScreen extends StatefulWidget {
  static String id = "Registrasi_Screen";

  const RegistrasiScreen({super.key});

  @override
  _RegistrasiScreenState createState() => _RegistrasiScreenState();
}

class _RegistrasiScreenState extends State<RegistrasiScreen> {
  bool showSpinner = false;
  String email = '';
  String name = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration: const InputDecoration(hintText: 'Enter your email '),
            ),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.name,
              onChanged: (value) {
                name = value;
              },
              decoration: const InputDecoration(hintText: 'Enter your name '),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              decoration:
                  const InputDecoration(hintText: 'Enter your password '),
            ),
            const SizedBox(
              height: 24.0,
            ),
            ElevatedButton(
                child: const Text('Register'),
                onPressed: () => registerButtonHandler(context))
          ],
        ),
      ),
    );
  }

  void registerButtonHandler(BuildContext context) async {
    await UserApi.createUser(name, email, password);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
