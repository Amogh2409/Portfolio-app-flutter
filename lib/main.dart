import 'package:flutter/material.dart';
import 'package:portfolio_app/about.dart';
import 'package:portfolio_app/home.dart';


void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'about',
    routes: {
      'home':(context) => MyHome(),
      'about':(context) => About(),
      // 'about':(context) => About(),
    },
  ));
}