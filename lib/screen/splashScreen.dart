// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_little_pony/screen/signInScreen.dart';

import '../bloc/splashScreen/splash_screen_bloc.dart';
import '../widget/splashScreenWidget.dart';
import 'homeScreen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  BlocProvider<SplashScreenBloc> _buildBody(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SplashScreenBloc(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.orangeAccent,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/images/splash_screen.png'),
        //     fit: BoxFit.fill
        //   )
        // ),
        child: Center(
          child: BlocBuilder<SplashScreenBloc, SplashScreenState>(
            builder: (context, state) {
              if ((state is Initial) || (state is Loading)) {
                return SplashScreenWidget(greeting: state.toString());
              }
              return StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return const HomeScreen();
                    }
                    return SignInScreen();
                  });
            },
          ),
        ),
      ),
    );
  }
}
