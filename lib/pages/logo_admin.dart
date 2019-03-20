import 'package:flutter/material.dart';

import './logo_create.dart';
import './logo_list.dart';

class LogoAdminPage extends StatelessWidget {
  final Function addLogo;
  final Function deleteLogo;
  LogoAdminPage(this.addLogo, this.deleteLogo);


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            drawer: Drawer(
              child: Column(children: <Widget>[
                AppBar(
                  automaticallyImplyLeading: false,
                ),
                ListTile(
                  title: Text('All Logo'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context,'/');
                  },
                )
              ]),
            ),
            appBar: AppBar(
              title: Text('Logo Manager'),
              bottom: TabBar(tabs: <Widget>[
                Tab(icon: Icon(Icons.create), text: "Create Logo"),
                Tab(icon: Icon(Icons.list), text: "My Logo"),
              ]),
            ),
            body: TabBarView(
                children: <Widget>[LogoCreatePage(addLogo), LogoListPage()])));
  }
}
