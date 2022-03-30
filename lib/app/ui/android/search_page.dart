import 'package:flutter/material.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';
import 'widgets/search_dialog.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
                color: Colors.blueAccent[700],
              ),
              height: 180,
              child: SearchDialog(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                child: Text(
                  'Buscar',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Modalidades sugeridas',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: GFImageOverlay(
                      image: AssetImage('assets/images/nt.png'),
                      height: 80,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(16, 16),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '    Natação',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: GFImageOverlay(
                      image: AssetImage('assets/images/f.jpg'),
                      height: 80,
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(16, 16),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            'Treinamento\nFucional',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: GFImageOverlay(
                      image: AssetImage('assets/images/c.jpg'),
                      height: 80,
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(16, 16),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            'Treinamento\nPediatra',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: GFImageOverlay(
                      image: AssetImage('assets/images/m.jpg'),
                      height: 80,
                      // width: 150,
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(16, 16),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            'Treinamento\nde Corrida',
                            style: TextStyle(
                                backgroundColor: Colors.black12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
