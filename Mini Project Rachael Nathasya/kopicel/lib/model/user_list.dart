import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_provider.dart';

class UsersListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    // Membaca data pengguna
    final users = userProvider.users;

    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Pengguna'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user.email),
            // Tambahkan tombol untuk menghapus atau memperbarui user
          );
        },
      ),
    );
  }
}
