import 'package:flutter/material.dart';
import 'package:my_first_project/Screens/Daily%20Check-In%20Screen.dart';
import 'package:my_first_project/Screens/Home%20Screen.dart';
import 'package:my_first_project/Screens/Progress%20Screen.dart';
import 'package:my_first_project/Screens/Splash%20Screen.dart';
import 'package:my_first_project/Screens/profilescreen.dart';
import 'package:my_first_project/Screens/recommendation.dart';

void main() {
  runApp(MaterialApp(
    title: 'Health Check-In Companion',
    initialRoute: '/',
    routes: {
      '/': (context) => SplashScreen(),
      '/home': (context) => HomeScreen(),
      '/checkin': (context) => CheckInScreen(),
      '/history': (context) => HistoryScreen(),
      '/recommendations': (context) => RecommendationsScreen(),
      '/profile': (context) => ProfileScreen(),
    },
  ));
}
