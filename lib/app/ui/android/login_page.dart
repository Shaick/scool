import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:scool/app/controller/login_controller.dart';
import 'package:scool/app/data/repository/login_repository.dart';

class LoginPage extends StatelessWidget {
  final repository = LoginRepository();
  final _formKey = GlobalKey<FormState>();
  final _loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent[700],
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
                color: Colors.blueAccent[700],
              ),
              height: 180,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "Entrar",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
            Column(
              children: [
                Form(
                  key: _formKey,
                  child: Container(
                    height: 270,
                    width: MediaQuery.of(context).size.width - 40,
                    margin: EdgeInsets.only(top: 80, left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 1,
                          color: Colors.black54,
                          offset: Offset(0.7, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 20),
                          child: TextFormField(
                            // ignore: missing_return
                            validator: (value) {
                              if (value.isEmail) {
                                return 'Digite o email corretamente!';
                              }
                            },
                            onChanged: (value) {
                              _loginController.emailTextController.text = value;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(fontSize: 8),
                              border: OutlineInputBorder(),
                              hintText: "Email",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 0),
                          child: TextFormField(
                            obscureText: true,
                            // ignore: missing_return
                            validator: (value) {
                              if (value.length < 6) {
                                return 'Senha muito peguena';
                              }
                            },
                            onChanged: (value) {
                              _loginController.passwordTextController.text =
                                  value;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(fontSize: 8),
                              border: OutlineInputBorder(),
                              hintText: "Senha",
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: GFButton(
                            onPressed: () {
                              _loginController.login();
                            },
                            text: "ENTRAR",
                            color: Colors.black87,
                            size: GFSize.MEDIUM,
                            fullWidthButton: true,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16, right: 16),
                          child: Text(
                            "Esqueceu email ou senha?",
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
