import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kirabot/res/assets_res.dart';


import 'mainScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (contect)=>ChatScreen()));
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Image.asset("assets/Logo.png"),
              Column(
              children: [ Text(
                "Powered by ChatGPT",
                style: TextStyle(
                    color: Color.fromRGBO(166, 196, 177, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),Text(
                "Made by",
                style: TextStyle(
                  color: Color.fromRGBO(166, 196, 177, 1),
                  fontSize: 16,
                ),
              ),Text(
                "Mohammed.A.Ezz",
                style: TextStyle(
                  color: Color.fromRGBO(166, 196, 177, 1),
                  fontSize: 16,
                ),
              ),]
            ),
          ],)
          ),
        ),
    );
  }
}
