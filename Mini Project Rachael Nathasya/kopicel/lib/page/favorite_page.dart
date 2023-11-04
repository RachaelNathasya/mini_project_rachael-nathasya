import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorit',
          style: GoogleFonts.inter(
            color: Color(0xff1d222d),
          ),
        ),
        backgroundColor: Color(0xff967259),
        centerTitle: true,
      ),
      body: Container(
          color: Colors.white,
          child: Center(
            child: Text('Belum ada item favorit.'),
          )),
    );
  }
}
