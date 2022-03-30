import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:scool/app/data/provider/login_provider.dart';
import 'package:scool/app/routes/app_routes.dart';

class InitialPage extends StatelessWidget {
  final login = LoginProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/man.jpg",
          ),
          Container(
            height: 400,
            width: double.infinity,
            color: Colors.black54,
          ),
          Center(
            child: Text(
              "Bem-vindo(a)",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 0.5,
                    blurRadius: 16,
                    color: Colors.black54,
                    offset: Offset(0.7, 0.7),
                  ),
                ],
              ),
              height: 260,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    GFButton(
                      color: Colors.blueAccent[700],
                      onPressed: () {
                        login.loginFacebook();
                        // Get.toNamed();
                      },
                      text: "CONTINUAR COM FACEBOOK",
                      icon: Icon(
                        FontAwesomeIcons.facebookF,
                        color: Colors.blueAccent[700],
                      ),
                      type: GFButtonType.outline,
                      fullWidthButton: true,
                      size: GFSize.LARGE,
                    ),
                    SizedBox(height: 10),
                    GFButton(
                      color: Colors.blueAccent[700],
                      onPressed: () {
                        Get.toNamed(Routes.LOGIN);
                      },
                      text: "Entrar",
                      type: GFButtonType.outline,
                      fullWidthButton: true,
                      size: GFSize.LARGE,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.HOW);
                          },
                          child: Text(
                            "Criar uma Conta",
                            style: TextStyle(
                                color: Colors.blueAccent[700],
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "     Ao entrar você concorda com nossos\nTermos de Serviço e Política de Privacidade",
                          style: TextStyle(
                              color: Colors.black38,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
