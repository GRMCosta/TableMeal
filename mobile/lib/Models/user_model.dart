import 'dart:convert';
import 'package:mobile/JModels/signup_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobile/JServices/client_services.dart';

class UserModel extends Model {
  Map<String, dynamic> userData = Map();

  bool isLoading = false;
  bool isLoggedIn = false;

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

    await createClient(post).then((response) {
      userData = jsonDecode(response.body);
      isLoggedIn = true;
      onSuccess();
      isLoading = false;
      notifyListeners();
    }).catchError((error) {
      print(error);
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  Future signIn(
      {@required int cpf,
      @required String pass,
      @required VoidCallback onSuccess,
      @required VoidCallback onFail}) async {
    isLoading = true;
    notifyListeners();

    await getClient(cpf, pass).then((response) {
      print("vai");
      print(response.body);
      print(response.statusCode);
      userData = Map<String, dynamic>.from(jsonDecode(response.body));
      print("foi?");
      isLoggedIn = true;
      onSuccess();
      isLoading = false;
      notifyListeners();
    }).catchError((error) {
      print(error);
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  void signOut() async {
    userData = Map();
    isLoggedIn = false;
    notifyListeners();
  }

  void recoverPass() {}

/*
  criar função para verificar o usuario que está logado e enviar os dados dele
  Future<Null> _loadCurrentUser() async{
  if(firebaseUser == nul)
  firebaseUser = await.firebase.currentUser();
  if(firebaseUser != null){
  Document.snapshot docUser =
  await Firestore.blablabla

  colocar ela no signIn e quando o app abre(dando override no addListener
  notifylistaners():
*/
}
