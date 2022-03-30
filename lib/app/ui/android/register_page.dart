import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scool/app/controller/login_controller.dart';

class RegisterPage extends StatelessWidget {
  final LoginController _loginController = Get.find<LoginController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 24),
            children: [
              Center(
                child: Text(
                  'CADASTRAR',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              SizedBox(
                height: 28,
              ),
              TextFormField(
                controller: _loginController.nameTextController,
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty || value.length <= 2)
                    return 'Nome muito pequeno';
                },
                autofocus: false,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  errorStyle: TextStyle(fontSize: 8),
                  hintText: 'Nome...',
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              ),
              SizedBox(
                height: 28,
              ),
              TextFormField(
                controller: _loginController.emailTextController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo Obrigatório';
                  } else if (!GetUtils.isEmail(value)) {
                    return 'Digite um Email Valido!';
                  }
                  return null;
                },
                autofocus: false,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  errorStyle: TextStyle(fontSize: 8),
                  hintText: 'Email...',
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              TextFormField(
                controller: _loginController.passwordTextController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Digite uma Senha';
                  } else if (value.length <= 5) {
                    return 'Senha deve ter o minimo de 6 Caracteres!';
                  }
                  return null;
                },
                autofocus: false,
                obscureText: true,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  errorStyle: TextStyle(fontSize: 8),
                  hintText: 'Senha...',
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: EdgeInsets.all(12),
                  color: Get.theme.primaryColor,
                  child: Text(
                    "Cadastrar",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _loginController.register();
                    }
                  },
                ),
              ),
              FlatButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  "Voltar para Login",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
