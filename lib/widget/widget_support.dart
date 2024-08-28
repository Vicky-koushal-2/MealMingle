
import 'dart:ui';

import 'package:flutter/material.dart';

class AppWidget{
  static TextStyle boldText(){
    return  TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold);
  }

  static TextStyle headlineText(){
    return  TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold);
  }
  static TextStyle LightText(){
    return  TextStyle(
        color: Colors.black38,
        fontSize: 18,
        fontWeight: FontWeight.w300);
  }
  static TextStyle semiLightText(){
    return  TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w300);
  }
}