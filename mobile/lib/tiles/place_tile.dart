import 'package:flutter/material.dart';

class PlaceTile extends StatelessWidget {

  final List<dynamic> response;

  PlaceTile(this.response);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "ADSODN"
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
