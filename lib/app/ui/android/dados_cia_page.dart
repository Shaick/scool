import 'dart:ui';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/components/button/gf_button.dart';

import 'address_cia_page.dart';

class DadosCiaPage extends StatelessWidget {
  final box = GetStorage('login_firebase');
  final _formKey = GlobalKey<FormState>();
  final _editcnpj = TextEditingController();
  final _editrz = TextEditingController();
  final _editnome = TextEditingController();
  final _editrp = TextEditingController();
  final _editfone = TextEditingController();

  void onPressed() {
    if (_formKey.currentState.validate()) {
      Map<String, dynamic> map = {
        "social": _editrz.text,
        "nome": _editnome.text,
        "cnpj": _editcnpj.text,
        "rp": _editrp.text,
        "fone": _editfone.text
      };
      box.write("entry", map);
      Get.to(AddressCiaPage());
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
                            "1 de 3",
                            style: TextStyle(color: Colors.white),
                          ),
                          progressHeadType: GFProgressHeadType.circular,
                          padding: EdgeInsets.all(0),
                          alignment: MainAxisAlignment.start,
                          circleWidth: 8,
                          radius: 70,
                          type: GFProgressType.circular,
                          percentage: 0.33,
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
                          "Dados da Empresa",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        Text(
                          "Próximo: Endereço",
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
                    height: 300,
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
                          padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
                          child: SizedBox(
                            height: 45,
                            child: TextFormField(
                              // ignore: missing_return
                              validator: (value) {
                                if (value.isCnpj) return 'Digite CNPJ Válido!';
                              },
                              controller: _editcnpj,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "CNPJ",
                                errorStyle: TextStyle(fontSize: 7, height: 0.1),
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
                              //controller: Controller.emailTextController,
                              // ignore: missing_return
                              validator: (value) {
                                if (value.isEmpty || value.length < 5) {
                                  return 'Razão Social!';
                                }
                              },
                              controller: _editrz,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                errorStyle: TextStyle(fontSize: 7, height: 0.1),
                                hintText: "Razão Social",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 16, right: 16, bottom: 0),
                          child: SizedBox(
                            height: 45,
                            child: TextFormField(
                              //controller: Controller.passwordTextController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Nome da Empresa!';
                                } else if (value.length <= 2) {
                                  return 'No minimo 6 Caracteres!';
                                }
                                return null;
                              },
                              controller: _editnome,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(fontSize: 7, height: 0.1),
                                border: OutlineInputBorder(),
                                hintText: "Nome da Empresa",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 16, right: 16, bottom: 0),
                          child: SizedBox(
                            height: 45,
                            child: TextFormField(
                              //controller: Controller.passwordTextController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Registro';
                                } else if (value.length <= 5) {
                                  return 'No minimo 6 Caracteres!';
                                }
                                return null;
                              },
                              controller: _editrp,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(fontSize: 7, height: 0.1),
                                border: OutlineInputBorder(),
                                hintText: "Registro Profissional",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 16, right: 16, bottom: 0),
                          child: SizedBox(
                            height: 45,
                            child: TextFormField(
                              //controller: Controller.passwordTextController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Telefone';
                                } else if (value.length <= 8) {
                                  return 'No minimo 9 Caracteres!';
                                }
                                return null;
                              },
                              controller: _editfone,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(fontSize: 7, height: 0.1),
                                border: OutlineInputBorder(),
                                hintText: "Telefone",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: GFButton(
                    onPressed: onPressed,
                    text: "PRÓXIMO",
                    color: Colors.black87,
                    size: GFSize.MEDIUM,
                    fullWidthButton: true,
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
