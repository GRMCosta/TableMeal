import 'package:flutter/material.dart';
import 'package:mobile/Tabs/home_tab.dart';
import 'package:mobile/widgets/custom_drawer.dart';
import 'package:mobile/Tabs/places_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
      Scaffold(
        body: HomeTab(),
        drawer: CustomDrawer(_pageController),
      ),
        Scaffold(
          appBar: AppBar(
            title: Text("Lojas"),
            centerTitle: true,
          ),
          body: PlacesTab(),
          drawer: CustomDrawer(_pageController),
        ),
      ],
    );
  }
}
