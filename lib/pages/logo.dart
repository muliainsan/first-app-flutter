import 'package:flutter/material.dart';

class LogoPage extends StatelessWidget {
  final String title;
  final String imageurl;
  final String desc;
  final int index;
  final Function deleteLogo;
  

  LogoPage(this.title, this.imageurl, this.desc,this.index, this.deleteLogo);

  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('This action cannot be undone!'),
            actions: <Widget>[
              FlatButton(
                child: Text('Discard'),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
              FlatButton(
                child: Text('Continue'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                  deleteLogo(index);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(imageurl),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(desc),//'This is Logo Page'
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      child: Text('Delete'),
                      onPressed: () => _showWarningDialog(context)),
                )
              ],
            ),
          )),
    );
  }
}
