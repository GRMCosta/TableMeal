import 'package:flutter/material.dart';
import 'package:mobile/Screens/login_screen.dart';
import 'package:mobile/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {

    Widget _buildDrawerBack() => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          )
      ),
    );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only( left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text("Flutter's \nTableMeal",
                        style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Olá",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              "Entre ou cadastre-se",
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            onTap: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=>LoginScreen())
                              );
                            },
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, "Início", pageController, 0),
              DrawerTile(Icons.list, "Cardápio", pageController, 1),
              DrawerTile(Icons.location_on, "Lojas", pageController, 2),
              DrawerTile(Icons.playlist_add_check, "Meus Pedidos", pageController, 3),
            ],
          )
        ],
      ),
    );
  }
}


