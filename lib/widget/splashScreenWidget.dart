// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/splashScreen/splash_screen_bloc.dart';

class SplashScreenWidget extends StatefulWidget {
  final String greeting;
  const SplashScreenWidget({Key? key, required this.greeting}) : super(key: key);

  @override
  _SplashScreenWidgetState createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {

  @override
  void initState() {
    super.initState();
    _dispatchEvent(
        context); // This will dispatch the navigateToHomeScreen event.
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${widget.greeting}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            Text(
              'Welcome, have a nice day',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30,
                bottom: 30,
              ),
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.purpleAccent,
            ),
          ],
        ),
      ),
    );
  }

  void _dispatchEvent(BuildContext context) {
    BlocProvider.of<SplashScreenBloc>(context).add(
      NavigateToHomeScreenEvent(),
    );
  }
}
