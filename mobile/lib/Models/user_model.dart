import 'dart:convert';
import 'package:mobile/JDatas/signup_datas.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import 'package:mobile/JServices/client_services.dart';

class UserModel extends Model {
  Map<String, dynamic> userData = Map();
  bool isLoading = false;
  bool isLoggedIn = false;

  static UserModel of(BuildContext context) =>
      ScopedModel.of<UserModel>(context);

  void signUp(
      {@required String name,
      @required String email,
      @required String pass,
      @required int cpf,
      @required VoidCallback onSuccess,
      @required VoidCallback onFail}) async {
    isLoading = true;
    notifyListeners();

    SignUp post = SignUp(name: name, email: email, password: pass, cpf: cpf);

    createClient(post).then((response) {
      print(response.body);
      print(response.statusCode);
      if (!response.body.contains("error")) {
        userData = jsonDecode(response.body);
        isLoggedIn = true;
        onSuccess();
        isLoading = false;
        notifyListeners();
      } else {
        print(response.body);
        onFail();
        isLoading = false;
        notifyListeners();
      }
    });
  }

  void signIn(
      {@required int cpf,
      @required String pass,
      @required VoidCallback onSuccess,
      @required VoidCallback onFail}) async {
    isLoading = true;
    notifyListeners();

    getClient(cpf, pass).then((response) {
      print(response.body);
      if (response.body.contains("INVÁLIDO")) {
        print(response.body);
        onFail();
        isLoading = false;
        notifyListeners();
      } else {
        userData = jsonDecode(response.body);
        isLoggedIn = true;
        onSuccess();
        isLoading = false;
        notifyListeners();
      }
    });
  }

  void signOut() async {
    userData = Map();
    isLoggedIn = false;
    notifyListeners();
  }

  void recoverPass() {}
}
