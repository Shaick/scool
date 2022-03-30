import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:scool/app/controller/login_controller.dart';

class SignupMemberPage extends StatelessWidget {
  final LoginController _loginController = Get.find<LoginController>();
  final _formKey = GlobalKey<FormState>();
  final accept = false.obs;

  void onPressed() {
    if (_formKey.currentState.validate()) {
      _loginController.typeController.text = "aluno";
      _loginController.register();
    }
  }

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
                "Informe seus dados\npara criar seu perfil",
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
                    height: 260,
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
                          child: SizedBox(
                            height: 45,
                            child: TextFormField(
                              // ignore: missing_return
                              validator: (value) {
                                if (value.isEmpty || value.length <= 2)
                                  return 'Nome muito pequeno';
                              },
                              controller: _loginController.nameTextController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(fontSize: 7, height: 0.1),
                                border: OutlineInputBorder(),
                                hintText: "Nome Completo",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 0),
                          child: SizedBox(
                            height: 45,
                            child: TextFormField(
                              controller: _loginController.emailTextController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Campo Obrigatório';
                                } else if (!GetUtils.isEmail(value)) {
                                  return 'Digite um Email Valido!';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(fontSize: 7, height: 0.1),
                                border: OutlineInputBorder(),
                                hintText: "Email",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 16, right: 16, bottom: 0),
                          child: SizedBox(
                            height: 45,
                            child: TextFormField(
                              controller:
                                  _loginController.passwordTextController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Digite uma Senha';
                                } else if (value.length <= 5) {
                                  return 'Senha deve ter o minimo de 6 Caracteres!';
                                }
                                return null;
                              },
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(fontSize: 7, height: 0.1),
                                suffixIcon: Icon(FontAwesomeIcons.solidEye),
                                border: OutlineInputBorder(),
                                hintText: "Senha",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16, right: 16),
                          child: Row(
                            children: [
                              Obx(() => Checkbox(
                                  value: accept.value,
                                  onChanged: (value) {
                                    accept.value = value;
                                  })),
                              Text(
                                "Aceitar os Termos e Condições?",
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Obx(
                    () => GFButton(
                      onPressed: accept.value == false ? null : onPressed,
                      text: "CRIAR",
                      color: Colors.black87,
                      size: GFSize.MEDIUM,
                      fullWidthButton: true,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
