import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:scool/app/data/provider/login_provider.dart';

class ProfileTabPage extends StatefulWidget {
  @override
  _ProfileTabPageState createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {
  LoginProvider lp = LoginProvider();
  String name = 'Ifit';
  String photo = '';

  @override
  void initState() {
    getName();
    super.initState();
  }

  void getName() {
    if (lp.user != null) {
      name = lp.user.displayName;
      photo = lp.user.photoURL;
      name = '  ' + name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GFAvatar(
                          backgroundImage: NetworkImage(photo),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                            GestureDetector(
                              child: Text(
                                '   Ver seu perfil',
                                style: TextStyle(
                                  color: Colors.black38,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Colors.black38,
                    ),
                  ],
                ),
              ),
              Divider(thickness: 1),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.shopping_bag_outlined),
                        SizedBox(width: 14),
                        Text(
                          "Minhas Compras",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Colors.black38,
                    ),
                  ],
                ),
              ),
              Divider(thickness: 1),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.wallet_travel),
                        SizedBox(width: 14),
                        Text(
                          "Minha Carteira",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Colors.black38,
                    ),
                  ],
                ),
              ),
              Divider(thickness: 1),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.favorite_border),
                        SizedBox(width: 14),
                        Text(
                          "Favoritos",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Colors.black38,
                    ),
                  ],
                ),
              ),
              Divider(thickness: 1),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.settings_outlined),
                        SizedBox(width: 14),
                        Text(
                          "Configurações",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Colors.black38,
                    ),
                  ],
                ),
              ),
              Divider(thickness: 1),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.help),
                        SizedBox(width: 14),
                        Text(
                          "Ajuda",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Colors.black38,
                    ),
                  ],
                ),
              ),
              Divider(thickness: 1),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: GestureDetector(
                  onTap: () {
                    lp.singOut();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.exit_to_app_rounded),
                          SizedBox(width: 14),
                          Text(
                            "Sair",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                        color: Colors.black38,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(thickness: 1),
            ],
          ),
        ),
      ),
    );
  }
}
