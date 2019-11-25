import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {

    Widget _buildBodyBack() => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red,
              Color.fromARGB(255, 97, 0, 0),
            ],
            begin: Alignment.center,
            end: Alignment.bottomCenter,
          )),
    );

    return Stack(
      children: <Widget>[
        _buildBodyBack(),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("TableMeal"),
                centerTitle: true,
              ),
            ),
          ],
        )
      ],
    );
  }
}
