import 'package:flutter/material.dart';
import './pages/auth.dart';
import './pages/home.dart';
import './pages/logo.dart';
import './pages/logo_admin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  List<Map<String, dynamic>> _logos = [];

  void _addLogo(Map<String, dynamic> logo) {
    setState(() {
      _logos.add(logo);
    });
  }

  void _deleteLogo(int index) {
    setState(() {
      _logos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.purple,
          accentColor: Colors.purpleAccent),
//      home: AuthPage(),
      routes: {
        '/': (BuildContext context) => HomePage(_logos),
        '/admin': (BuildContext context) =>
            LogoAdminPage(_addLogo, _deleteLogo),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'logo') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) =>
                LogoPage(_logos[index]['title'], _logos[index]['image'],_logos[index]['desc'],index,_deleteLogo),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings setting) {
        return MaterialPageRoute(
            builder: (BuildContext context) => HomePage(_logos));
      },
    );
  }
}
