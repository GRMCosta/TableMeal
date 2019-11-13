import 'package:flutter/material.dart';
import 'package:mobile/Models/user_model.dart';
import 'package:mobile/Screens/home_screen.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
        title: "TableMeal",
        theme: ThemeData(
          primarySwatch: Colors.red,
          primaryColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
