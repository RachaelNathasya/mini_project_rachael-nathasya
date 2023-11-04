import 'package:flutter/material.dart';
import 'package:kopicel/home.dart';
import 'package:kopicel/model/user_model.dart';
import 'package:kopicel/model/user_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;

  final validEmail = "kopicel@gmail.com";
  final validPassword = "123456";

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider
        .addUser(User(id: '1', email: 'kopicel@gmail.com', password: '123456'));
    userProvider.updateUser('1',
        User(id: '1', email: 'newemail@example.com', password: 'newpassword'));
    userProvider.deleteUser('1');

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Form(
            key: _formfield,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo.jpg",
                  height: 200,
                  width: 200,
                ),
                SizedBox(height: 50),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Color(0xff967259), // Mengubah warna label text
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(
                            0xff967259), // Mengubah warna border ketika input tidak aktif
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(
                            0xff967259), // Mengubah warna border ketika input aktif
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Color(0xff967259),
                    ),
                  ),
                  validator: (value) {
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!);
                    if (value.isEmpty) {
                      return "Enter Email";
                    } else if (!emailValid) {
                      return "Enter Valid Email";
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: passController,
                  obscureText: passToggle,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: Color(0xff967259),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff967259),
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xff967259),
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: Icon(
                        passToggle ? Icons.visibility : Icons.visibility_off,
                        color: Color(0xff967259),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Password";
                    } else if (passController.text.length < 6) {
                      return " Password Length Should be more than 6 characters";
                    }
                  },
                ),
                SizedBox(height: 60),
                InkWell(
                  onTap: () {
                    if (_formfield.currentState!.validate()) {
                      // Memeriksa email dan password
                      if (emailController.text == validEmail &&
                          passController.text == validPassword) {
                        // Jika email dan password benar, pindah ke halaman home
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                        );
                      } else {
                        // Jika email atau password salah, tampilkan pesan kesalahan
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Email atau password salah."),
                          ),
                        );
                      }
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xff967259),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                        child: Text(
                      "Log In",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account yet?",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
