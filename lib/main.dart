import 'package:flutter/material.dart';
import 'package:loginuicolors/home.dart';
import 'package:loginuicolors/login.dart';
import 'package:loginuicolors/register.dart';
import 'package:loginuicolors/splash_screen.dart';
import 'splash_screen.dart';
void main()  {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash_screen(),
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
    },
  ));
}
