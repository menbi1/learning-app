import 'package:flutter/material.dart';

import 'package:splash_screen_view/SplashScreenView.dart';
import 'login_screen.dart';

class welcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget example1 = SplashScreenView(
      navigateRoute: loginScreen(),
      duration: 5000,
      imageSize: 130,
      imageSrc: "assets/icons/logo.jpg",
      text: "Ghioon Learning",

      textStyle: TextStyle(
        color:Colors.blue[900],
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),

      backgroundColor: Colors.white,
    );

    return MaterialApp(
      home: example1,
    );
  }
}
