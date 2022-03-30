import 'package:flutter/material.dart';

class SearchDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 110,
          left: 20,
          right: 20,
          child: Card(
            child: TextFormField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Atividade ou evento',
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.grey[700],
                    onPressed: () {
                      //Navigator.of(context).pop();
                    },
                  )),
              onFieldSubmitted: (text) {
                // Navigator.of(context).pop(text);
              },
            ),
          ),
        )
      ],
    );
  }
}
