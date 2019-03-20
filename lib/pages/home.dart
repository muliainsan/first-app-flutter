import 'package:flutter/material.dart';

import '../logo_manager.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> logos;

  HomePage(this.logos);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        drawer: Drawer(
          child: Column(
              children: <Widget>[
                AppBar(
                  automaticallyImplyLeading: false,
                  title: Text('choose menu'),
                ),
                ListTile(
                  leading: Icon(Icons.shop),                 
                  title: Text('Manage Product'),
                  onTap: () {
                    Navigator.pushNamed(context, '/admin');
                  },
                )
              ]
          ),
        ),
        appBar: AppBar(
          title: Text('Fisrt App'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.favorite),
            onPressed: (){},)
          ],
        ),
        body: LogoManager(logos));
  }
}
