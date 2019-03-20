import 'package:flutter/material.dart';

class LogoCreatePage extends StatefulWidget {
  final Function addLogo;

  LogoCreatePage(this.addLogo);

  @override
  State<StatefulWidget> createState() {
    return _LogoCreatePageState();
  }
}

class _LogoCreatePageState extends State<LogoCreatePage> {
  String _titleValue = '';
  String _descValue = '';
  double _priceValue;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Logo Title'),
              onChanged: (String value) {
                setState(() {
                  _titleValue = value;
                });
              },
            ),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(labelText: 'Logo Description'),
              onChanged: (String value) {
                setState(() {
                  _descValue = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Logo Price'),
              keyboardType: TextInputType.number,
              onChanged: (String value) {
                setState(() {
                  _priceValue = double.parse(value);
                });
              },
            ),

            SizedBox(height: 10.0),
            RaisedButton(
              child: Text('Save'),
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              onPressed: () {
                final Map<String, dynamic> logo = {
                  'title': _titleValue,
                  'desc': _descValue,
                  'price': _priceValue,
                  'image': 'assets/logotelkom.png'
                };
                widget.addLogo(logo);
                Navigator.pushReplacementNamed(context, '/');
              },
            )
          ],
        ));
  }
}
