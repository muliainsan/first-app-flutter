import 'package:flutter/material.dart';
import './home.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _unameValue = '';
  String _passValue = '';
  bool _rememberAccount = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Center(
            child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Username'),
              onChanged: (String value) {
                setState(() {
                  _unameValue = value;
                });
              },
            ),
            TextField(
//              keyboardType: TextInputType.,
              decoration: InputDecoration(labelText: 'Password'),
              onChanged: (String value) {
                setState(() {
                  _passValue = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Remember User'),
              value: _rememberAccount,
              onChanged: (bool value) {
                setState(() {
                  _rememberAccount=value;
                });
              },
            ),
            RaisedButton(
                child: Text('Login'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                }),
          ],
        )));
  }
}
