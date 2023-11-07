import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/loginForm.dart';

import 'package:flutter_application_1/pages/home_page.dart';
import 'package:page_transition/page_transition.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
          primarySwatch: Colors.green,
          backgroundColor: Colors.black,
          scaffoldBackgroundColor: Colors.black,
          colorScheme: ColorScheme.dark(),
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 24, color: Colors.white),
            headline6: TextStyle(fontSize: 16, color: Colors.green),
          )),
      home: MySplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/98432-loading.json'),
      backgroundColor: Color.fromARGB(255, 36, 36, 36),
      nextScreen: LoginForm(),
      splashIconSize: 250,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds: 1),
    );
  }
}
