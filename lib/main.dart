import 'package:flutter/material.dart';
import 'package:meels/pages/main_page.dart';
import 'package:meels/pages/hamburger_page.dart';
import 'package:meels/pages/pizza_page.dart';
import 'package:meels/pages/typing_page.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.redAccent,
  ),
  initialRoute: '/',
  routes: {
    '/': (context) => MainPage(),
    '/fast-food': (context) => HamburgerPage(),
    '/pizza': (context) => PizzaPage(),
    '/typing': (context) => TypingPage(),
  },
));