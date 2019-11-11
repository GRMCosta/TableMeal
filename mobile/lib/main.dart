import 'package:flutter/material.dart';
import 'package:teste_dart/Screens/home_screen.dart';


void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TableMeal",
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
