import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:scool/app/controller/login_controller.dart';
import 'package:scool/app/data/repository/entry_repository.dart';
import 'package:scool/app/routes/app_routes.dart';

class DonePage extends StatelessWidget {
  final LoginController _loginController = Get.find<LoginController>();
  final _entryRepository = EntryRepository();
  final box = GetStorage('login_firebase');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Image.asset("assets/images/done.png"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Container(
              width: MediaQuery.of(context).size.width - 100,
              child: GFButton(
                onPressed: () {
                  if (_loginController.typeController.text == "aluno") {
                    _entryRepository.setAluno();
                    Get.toNamed(Routes.HOME);
                  } else if (_loginController.typeController.text == "prf") {
                    _entryRepository.setProf();
                    Get.toNamed(Routes.HOME);
                  } else if (_loginController.typeController.text == "cia") {
                    _entryRepository.setCia();
                    Get.toNamed(Routes.HOME);
                  }
                },
                text: "CONTINUAR",
                color: Colors.black87,
                size: GFSize.MEDIUM,
                fullWidthButton: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
