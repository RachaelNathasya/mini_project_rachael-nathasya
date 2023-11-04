import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kopicel/home.dart';
import 'package:kopicel/screens/login_screen.dart';
import 'package:kopicel/page/profile_page.dart';
import 'package:kopicel/page/home_page.dart';

// import 'package:kopicel/page/login_page.dart';
// import 'package:kopicel/page/registration_page.dart';

// class WelcomeScreen extends StatefulWidget {
//   static String id = "welcome_screen";

//   const WelcomeScreen({super.key});

//   @override
//   _WelcomeScreenState createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<WelcomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           color: Colors.black,
//           image: DecorationImage(
//             image: AssetImage("assets/ws.jpg"),
//             fit: BoxFit.cover,
//             colorFilter: ColorFilter.mode(
//               Colors.black.withOpacity(0.6),
//               BlendMode.dstATop,
//             ),
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Align(
//                 alignment: Alignment.center,
//                 child: Text(
//                   "KopiCel",
//                   style: GoogleFonts.caveat(
//                     fontSize: 80,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 48.0,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: ((context) => const LoginPage()),
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.brown,
//                 ),
//                 child: const Text('Log in'),
//               ),
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: ((context) => const RegistrationPage()),
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.brown,
//                 ),
//                 child: const Text('Register'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
