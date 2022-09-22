// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth/auth_bloc.dart';

class DashBoardScreen extends StatelessWidget {
  final String displayName;
  final String email;
  final String photoURL;

  const DashBoardScreen({Key? key,
    required this.displayName,
    required this.email,
    required this.photoURL})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashBoardScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Email: \n ${email}',
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            photoURL != null
                ? Image.network("${photoURL}")
                : Container(),
            displayName != null
                ? Text("${displayName}")
                : Container(),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Sign Out'),
              onPressed: () {
                // Signing out the user
                context.read<AuthBloc>().add(SignOutRequested());
              },
            ),
          ],
        ),
      ),
    );
  }
}
