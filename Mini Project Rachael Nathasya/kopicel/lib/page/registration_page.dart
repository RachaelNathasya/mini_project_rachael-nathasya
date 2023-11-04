// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:kopicel/constants.dart';
// import 'package:kopicel/page/home_page.dart';

// class RegistrationPage extends StatefulWidget {
//   static String id = "Registration_screen";

//   const RegistrationPage({super.key});

//   @override
//   _RegistrationPageState createState() => _RegistrationPageState();
// }

// class _RegistrationPageState extends State<RegistrationPage> {
//   bool showSpinner = false;
//   String email = '';
//   String password = '';
//   final _auth = FirebaseAuth.instance;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             const SizedBox(
//               height: 48.0,
//             ),
//             TextField(
//               textAlign: TextAlign.center,
//               keyboardType: TextInputType.emailAddress,
//               onChanged: (value) {
//                 email = value;
//               },
//               decoration:
//                   kTextFieldDecoration.copyWith(hintText: 'Enter your email '),
//             ),
//             const SizedBox(
//               height: 8.0,
//             ),
//             TextField(
//               textAlign: TextAlign.center,
//               obscureText: true,
//               onChanged: (value) {
//                 password = value;
//               },
//               decoration: kTextFieldDecoration.copyWith(
//                   hintText: 'Enter your password '),
//             ),
//             const SizedBox(
//               height: 24.0,
//             ),
//             ElevatedButton(
//                 child: const Text('Register'),
//                 onPressed: () async {
//                   setState(() {
//                     showSpinner = true;
//                   });
//                   //Create new Account
//                   try {
//                     await _auth
//                         .createUserWithEmailAndPassword(
//                             email: email, password: password)
//                         .then((value) {
//                       setState(() {
//                         showSpinner = false;
//                       });
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => HomePage()));
//                       print('Successfully Created');
//                     });
//                   } catch (e) {
//                     print(e);
//                   }
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }
