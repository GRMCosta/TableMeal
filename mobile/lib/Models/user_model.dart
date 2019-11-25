import 'package:mobile/JModels/register_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobile/JServices/register_services.dart';

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

    Register post = Register(name: name, email: email, password: pass, cpf: cpf);

    createPost(post).then((response) {
      if (response.statusCode > 200) {
        isLoading = false;
        notifyListeners();
        onSuccess();
      }
    }).catchError((error) {
      print(error);
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  Future signIn(
      {@required String email,
      @required String pass,
      @required VoidCallback onSuccess,
      @required VoidCallback onFail}) async {
    isLoading = true;
    notifyListeners();

    Register post = Register(email: email, password: pass);

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
