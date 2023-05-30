import 'dart:async';
import 'package:flutter/material.dart';
import 'package:loginuicolors/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({Key? key}) : super(key: key);

  @override
  State<Splash_screen> createState() => Splash_screenState();
}

class Splash_screenState extends State<Splash_screen> {
  static const String KEYLOGIN = "Login";

  void initState() {
    super.initState();
    
    WhereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/splash_screen.png'), fit: BoxFit.cover),
      ),
    );
  }
  void WhereToGo() async {
    var sharedpref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedpref.getBool(KEYLOGIN);


    Timer(const Duration(seconds: 1), () {
      if(isLoggedIn!=null){
        if(isLoggedIn) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) => home()));
        }else{
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) => MyLogin()));
        }
      }else{
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => MyLogin()));
      }
    });
}
}


