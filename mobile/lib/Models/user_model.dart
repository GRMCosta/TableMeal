import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class UserModel extends Model {
  bool isLoading = false;
  Map<String, dynamic> userData = Map();

  void signUp() {

  }

  Future signIn() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 3));

    isLoading = false;
    notifyListeners();
  }



  void recoverPass() {}
}
