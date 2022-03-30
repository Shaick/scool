import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:scool/app/controller/appData_controller.dart';

class HomeTabPage extends StatefulWidget {
  @override
  _HomeTabPageState createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  final List<String> imageList = [
    "https://firebasestorage.googleapis.com/v0/b/ifit2021.appspot.com/o/Carousel%2Fnt.png?alt=media&token=c560e7d3-c9ec-4fb5-8779-58e865be2b4c",
    "https://firebasestorage.googleapis.com/v0/b/ifit2021.appspot.com/o/Carousel%2Fc.jpg?alt=media&token=f041464d-ca22-4381-a291-f81457543d2d",
    "https://firebasestorage.googleapis.com/v0/b/ifit2021.appspot.com/o/Carousel%2Fm.jpg?alt=media&token=548127dd-b2aa-4d43-9afb-9fd127e54478",
    "https://firebasestorage.googleapis.com/v0/b/ifit2021.appspot.com/o/Carousel%2Fimg_900x508%242020_09_15_08_27_09_975815.jpg?alt=media&token=d87148ef-886d-48a4-b2cb-bee9cce4545c",
    "https://firebasestorage.googleapis.com/v0/b/ifit2021.appspot.com/o/Carousel%2Fnd.png?alt=media&token=ed1008cb-c8e9-4912-9d5d-a749318a3706"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AppData>(
        init: AppData(),
        builder: (_) {
          return SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 50, right: 22, left: 22, bottom: 0),
                  child: Center(
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.blueAccent[700],
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _.pickUpLocation != null
                                  ? _.placeAddress
                                  : "Seu Local",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.blueAccent[700],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Card(
                    child: TextFormField(
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Buscar atividade ou evento',
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 15),
                        prefixIcon: IconButton(
                          icon: Icon(Icons.search),
                          color: Colors.grey[700],
                          onPressed: () {
                            //Navigator.of(context).pop();
                          },
                        ),
                      ),
                      onFieldSubmitted: (text) {
                        // Navigator.of(context).pop(text);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Modalidades',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'VER TUDO',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.blueAccent[700]),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: GFCarousel(
                    height: 240,
                    items: imageList.map(
                      (url) {
                        return Container(
                          margin: EdgeInsets.all(0),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            child: Image.network(url,
                                fit: BoxFit.fitHeight, width: 210),
                          ),
                        );
                      },
                    ).toList(),
                    onPageChanged: (index) {
                      setState(() {
                        print(index);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Próximos Eventos',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'VER TUDO',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.blueAccent[700]),
                      ),
                    ],
                  ),
                ),
                Column(),
              ],
            ),
          );
        },
      ),
    );
  }
}
