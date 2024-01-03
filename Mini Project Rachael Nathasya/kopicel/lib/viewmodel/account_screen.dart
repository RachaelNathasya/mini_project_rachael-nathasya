import 'package:flutter/material.dart';
import 'package:kopicel/providers/user_provider.dart';
import 'package:kopicel/view/login_screen.dart';
import 'package:kopicel/services/user_service.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: true);
    final user = userProvider.user;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
        backgroundColor: Color(0xff967259),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(user!.avatar),
            ),
            SizedBox(height: 20),
            Text(
              user!.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              user!.email,
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Edit Name',
                border: OutlineInputBorder(),
                hintText: 'Enter your name',
                icon: Icon(Icons.person),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Edit Email',
                border: OutlineInputBorder(),
                hintText: 'Enter your email',
                icon: Icon(Icons.email),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () => saveButtonHandler(userProvider),
              child: Text('Save'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => deleteButton(userProvider, context),
              child: Text('delete'),
            ),
          ],
        ),
      ),
    );
  }

  void saveButtonHandler(UserProvider provider) async {
    final name = nameController.text;
    final email = emailController.text;
    final result = await UserApi.updateUser(provider.user!.id, email, name);
    provider.user = result;
  }

  void deleteButton(UserProvider provider, BuildContext context) async {
    final result = await UserApi.deleteUser(provider.user!.id);
    if (result) {
      provider.user = null;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }
}
