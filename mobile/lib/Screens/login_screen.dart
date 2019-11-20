import 'package:flutter/material.dart';
import 'package:mobile/Models/user_model.dart';
import 'package:mobile/Screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static final _passController = TextEditingController();
  static final _emailController = TextEditingController();

  static final _formKey = GlobalKey<FormState>();
  static final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Entrar",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: <Widget>[
          FlatButton(
            child: Text(
              "CRIAR CONTA",
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: ScopedModelDescendant<UserModel>(builder: (context, child, model) {
        if (model.isLoading)
          return Center(
            child: CircularProgressIndicator(),
          );

        return Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(10.0),
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(hintText: "E-mail"),
                keyboardType: TextInputType.emailAddress,
                validator: (text) {
                  if (text.isEmpty || text.contains("@"))
                    return "E-mail inválido";
                  return null;
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _passController,
                decoration: InputDecoration(hintText: "Senha"),
                obscureText: true,
                validator: (text) {
                  if (text.isEmpty || text.length < 6) return "Senha Inválida";
                  return null;
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    "Esqueci minha senha",
                    textAlign: TextAlign.right,
                  ),
                  padding: EdgeInsets.zero,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 44.0,
                child: RaisedButton(
                  child: Text(
                    "Entrar",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  textColor: Colors.white,
                  color: Colors.red,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {}
                    model.signIn(
                        email: _emailController.text,
                        pass: _passController.text,
                        onSuccess: _onSuccess,
                        onFail: _onFail);
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  void _onSuccess(){
    Navigator.of(context).pop();
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Falha ao Entrar"),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 2),
    ));
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.of(context).pop();
    });
  }
}
