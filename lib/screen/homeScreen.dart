// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_little_pony/screen/signInScreen.dart';

import '../bloc/auth/auth_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => SignInScreen()),
                  (route) => false,
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Email: \n ${user.email}',
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              user.photoURL != null
                  ? Image.network("${user.photoURL}")
                  : Container(),
              user.displayName != null
                  ? Text("${user.displayName}")
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
      ),
    );
  }
}
