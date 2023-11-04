import 'package:flutter/material.dart';
import 'package:kopicel/home.dart';
import 'package:kopicel/model/user_provider.dart';
import 'package:kopicel/page/chat_page.dart';
import 'package:kopicel/screens/login_screen.dart';
import 'package:kopicel/page/profile_page.dart';
import 'package:kopicel/page/cart_page.dart';
import 'package:kopicel/page/favorite_page.dart';
import 'package:kopicel/page/home_page.dart';
import 'package:kopicel/screens/welcome_screen.dart';
import 'package:provider/provider.dart';
// import 'package:kopicel/page/login_page.dart';
// import 'package:kopicel/page/registration_page.dart';
// import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
