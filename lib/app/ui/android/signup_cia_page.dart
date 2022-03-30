import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:scool/app/controller/login_controller.dart';

class SignupCiaPage extends StatelessWidget {
  final _loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  final box = GetStorage('login_firebase');
  final accept = false.obs;

  void onPressed() {
    if (_formKey.currentState.validate()) {
      Map<String, dynamic> map = {
        "social": box.read("entry")["social"],
        "nome": box.read("entry")["nome"],
        "cnpj": box.read("entry")["cnpj"],
        "rp": box.read("entry")["rp"],
        "fone": box.read("entry")["fone"],
        "endereco": box.read("entry")["endereco"],
        "cidade": box.read("entry")["cidade"],
        "bairro": box.read("entry")["bairro"],
        "complemento": box.read("entry")["complemento"],
        "cep": box.read("entry")["cep"],
        "uf": box.read("entry")["uf"]
      };
      box.write("entry", map);
      _loginController.typeController.text = 'cia';
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
              child: SizedBox(
                height: 80,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 70,
                      child: GFProgressBar(
                          child: Text(
                            "3 de 3",
                            style: TextStyle(color: Colors.white),
                          ),
                          progressHeadType: GFProgressHeadType.circular,
                          padding: EdgeInsets.all(0),
                          alignment: MainAxisAlignment.start,
                          circleWidth: 8,
                          radius: 70,
                          type: GFProgressType.circular,
                          percentage: 1,
                          backgroundColor: Colors.black26,
                          progressBarColor: GFColors.WHITE),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dados da Conta",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        Text(
                          "Próximo: Conclusão",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Form(
                  key: _formKey,
                  child: Container(
                    height: 240,
                    width: MediaQuery.of(context).size.width - 40,
                    margin: EdgeInsets.only(top: 90, left: 20, right: 20),
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
                              border: OutlineInputBorder(),
                              hintText: "E-mail",
                              errorStyle: TextStyle(fontSize: 7, height: 0.1),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 0, left: 16, right: 16, bottom: 0),
                          child: TextFormField(
                            controller: _loginController.passwordTextController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Digite uma Senha';
                              } else if (value.length <= 5) {
                                return 'Senha deve ter o minimo de 6 Caracteres!';
                              }
                              return null;
                            },
                            obscureText: true,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              suffixIcon: Icon(FontAwesomeIcons.solidEye),
                              border: OutlineInputBorder(),
                              hintText: "Crie sua senha",
                              errorStyle: TextStyle(fontSize: 7, height: 0.1),
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
