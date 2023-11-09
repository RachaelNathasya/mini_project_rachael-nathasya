import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kopicel/home.dart';
import 'package:kopicel/view/login_screen.dart';
import 'package:kopicel/view/profile_page.dart';
import 'package:kopicel/view/home_page.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.only(top: 100, bottom: 40),
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/ws.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "KopiCel",
              style: GoogleFonts.caveat(
                fontSize: 80,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
