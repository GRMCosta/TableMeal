import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class UserModel extends Model {
  Map<String, dynamic> userData = Map();

  bool isLoading = false;
  bool isLoggedIn = false;

  void signUp(
      {@required Map<String, dynamic> userData,
      @required String pass,
      @required VoidCallback onSuccess,
      @required VoidCallback onFail}) async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 3));

    isLoading = false;
    notifyListeners();
    /*createUserWithEmailAndPassword(
      email: userData["email"]
      password: pass
    ).then(user){
    onSuccess();
    isLoading = false;
    isLoggedIn = true;
    notifyListeners();
    }).catchError(e){
    onFail();
    isLoading = false;
    isLoggedIn = false;
    notifyListeners();


    é assim com o firebase verificar como vai ficar usando a api do mongo
     */
  }

  Future signIn(
      {@required String email,
      @required String pass,
      @required VoidCallback onSuccess,
      @required VoidCallback onFail}) async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 3));

    isLoading = false;
    isLoggedIn = true;
    notifyListeners();

    /*loginInWithEmailAndPassword(
      email: email
      password: pass
    ).then(user){
    onSuccess();
    isLoggedIn = true;
    isLoading = false;
    notifyListeners();
    }).catchError(e){
    onFail();
    isLoading = false;
    isLoggedIn = false;
    notifyListeners();


    é assim com o firebase, verificar como vai ficar usando a api do mongo
     */
  }

  void signOut() async {
    //await sign.out;
    userData = Map();
    isLoggedIn = false;
    //user = null;
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
