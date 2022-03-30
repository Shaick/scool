import 'dart:ui';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:scool/app/routes/app_routes.dart';
import 'package:scool/app/utils/uf.dart';

class AddressCiaPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final uff = 'Estado'.obs;

  final box = GetStorage('login_firebase');
  final _editaddress = TextEditingController();
  final _editcity = TextEditingController();
  final _editdistrict = TextEditingController();
  final _editzip = TextEditingController();
  final _editcp = TextEditingController();

  void onPressed() {
    if (_formKey.currentState.validate()) {
      if (uff.value == 'Estado') {
        Get.defaultDialog(
          title: "UF",
          content: Text('Selecione um Estado'),
          cancel: Icon(
            Icons.input,
            color: Colors.amber,
            size: 40,
          ),
        );
        return;
      }
      Map<String, dynamic> map = {
        "social": box.read("entry")["social"],
        "nome": box.read("entry")["nome"],
        "cnpj": box.read("entry")["cnpj"],
        "rp": box.read("entry")["rp"],
        "fone": box.read("entry")["fone"],
        "endereco": _editaddress.text,
        "cidade": _editcity.text,
        "bairro": _editdistrict.text,
        "cep": _editzip.text,
        "complemento": _editcp.text,
        "uf": uff.value,
      };
      box.write("entry", map);
      Get.toNamed(Routes.SIGNUPCIA);
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
                            "2 de 3",
                            style: TextStyle(color: Colors.white),
                          ),
                          progressHeadType: GFProgressHeadType.circular,
                          padding: EdgeInsets.all(0),
                          alignment: MainAxisAlignment.start,
                          circleWidth: 8,
                          radius: 70,
                          type: GFProgressType.circular,
                          percentage: 0.7,
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
                          "Endereço",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        Text(
                          "Próximo: Dados da conta",
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
                SizedBox(height: 10),
                Form(
                  key: _formKey,
                  child: Container(
                    height: 310,
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
                          padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                          child: SizedBox(
                            height: 45,
                            child: TextFormField(
                              // ignore: missing_return
                              validator: (value) {
                                if (value.isEmpty || value.length < 2)
                                  return 'Nome muito pequeno';
                              },
                              controller: _editcity,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Cidade",
                                errorStyle: TextStyle(fontSize: 7, height: 0.1),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 180,
                                child: SizedBox(
                                  height: 45,
                                  child: TextFormField(
                                    //controller: Controller.passwordTextController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'CEP!';
                                      } else if (value.length <= 5) {
                                        return 'No minimo 9 Caracteres!';
                                      }
                                      return null;
                                    },
                                    controller: _editzip,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      errorStyle:
                                          TextStyle(fontSize: 7, height: 0.1),
                                      border: OutlineInputBorder(),
                                      hintText: "Cep",
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              SizedBox(
                                width: 85,
                                height: 45,
                                child: DropdownButton(
                                  icon: Icon(Icons.flag),
                                  hint: Obx(
                                    () => Text(uff.obs.toString()),
                                  ),
                                  items: uf.map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(dropDownStringItem),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    uff.value = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 12, left: 16, right: 16, bottom: 0),
                          child: SizedBox(
                            height: 45,
                            child: TextFormField(
                              //controller: Controller.passwordTextController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Bairro!';
                                } else if (value.length <= 5) {
                                  return 'Nome do Bairro!';
                                }
                                return null;
                              },
                              controller: _editdistrict,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(fontSize: 7, height: 0.1),
                                border: OutlineInputBorder(),
                                hintText: "Bairro",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 12, left: 16, right: 16, bottom: 0),
                          child: SizedBox(
                            height: 45,
                            child: TextFormField(
                              controller: _editaddress,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Endereço';
                                } else if (value.length <= 5) {
                                  return 'Digite um Endereço!';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(fontSize: 7, height: 0.1),
                                border: OutlineInputBorder(),
                                hintText: "Endereço",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 12, left: 16, right: 16, bottom: 0),
                          child: SizedBox(
                            height: 45,
                            child: TextFormField(
                              controller: _editcp,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(fontSize: 7, height: 0.1),
                                border: OutlineInputBorder(),
                                hintText: "Complemento",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
