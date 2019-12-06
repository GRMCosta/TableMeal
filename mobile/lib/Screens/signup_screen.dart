import 'package:flutter/material.dart';
import 'package:mobile/Models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  static final _nameController = TextEditingController();
  static final _emailController = TextEditingController();
  static final _passController = TextEditingController();
  static final _cpfController = TextEditingController();

  static final _formKey = GlobalKey<FormState>();
  static final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            "Criar Conta",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body:
            ScopedModelDescendant<UserModel>(builder: (context, child, model) {
          if (model.isLoading)
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(10.0),
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(hintText: "Nome Completo"),
                  validator: (text) {
                    if (text.isEmpty) return "Nome Inválido";
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _cpfController,
                  decoration: InputDecoration(hintText: "CPF"),
                  keyboardType: TextInputType.number,
                  validator: (text) {
                    if (text.isEmpty || text.length < 11) return "CPF Inválido";
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(hintText: "E-mail"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (text) {
                    if (text.isEmpty || !text.contains("@"))
                      return "E-mail Inválido";
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
                    if (text.isEmpty || text.length < 6)
                      return "Senha Inválida";
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 44.0,
                  child: RaisedButton(
                    child: Text(
                      "Criar Conta",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    textColor: Colors.white,
                    color: Color.fromARGB(255, 97, 0, 0),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        model.signUp(
                            name: _nameController.text,
                            email: _emailController.text,
                            cpf: int.parse(_cpfController.text),
                            pass: _passController.text,
                            onSuccess: _onSuccess,
                            onFail: _onFail);
                        print(model.isLoading);
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        }));
  }

  void _onSuccess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Usuário criado com sucesso"),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 1),
    ));
    Future.delayed(Duration(seconds: 1)).then((_) {
      Navigator.of(context).pop();
    });
    _clearInputs();
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Usuário já existe"),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 5),
    ));
  }

  void _clearInputs() {
    _passController.clear();
    _cpfController.clear();
    _nameController.clear();
    _emailController.clear();
  }
}
