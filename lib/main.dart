import 'package:eco_connect_app/route/index.dart';
import 'package:eco_connect_app/route/login.dart';
import 'package:eco_connect_app/route/signup.dart';
import 'package:eco_connect_app/route/splash.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MaterialColor _myColor = MaterialColor(0xff403C55, <int, Color>{
    50: Color.fromRGBO(64, 60, 85, .1),
    100: Color.fromRGBO(64, 60, 85, .2),
    200: Color.fromRGBO(64, 60, 85, .3),
    300: Color.fromRGBO(64, 60, 85, .4),
    400: Color.fromRGBO(64, 60, 85, .5),
    500: Color.fromRGBO(64, 60, 85, .6),
    600: Color.fromRGBO(64, 60, 85, .7),
    700: Color.fromRGBO(64, 60, 85, .8),
    800: Color.fromRGBO(64, 60, 85, .9),
    900: Color.fromRGBO(64, 60, 85, 1),
  });
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eco-Connect',
      theme: ThemeData(
        primaryColor: _myColor,
        primarySwatch: _myColor,
        brightness: Brightness.light,
        accentColor: _myColor.shade100,
        accentColorBrightness: Brightness.dark,
      ),
      home: Login()
    );
  }
}

