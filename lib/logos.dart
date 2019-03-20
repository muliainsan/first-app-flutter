import 'package:flutter/material.dart';
import './pages/logo.dart';
import 'package:http/http.dart' as http;

class Logos extends StatelessWidget {
  final List<Map<String, dynamic>> logos;

  Logos(this.logos);
  void coba() {
    http.post('');
  }

  Widget _buildLogoItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(logos[index]['image']),
          Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    logos[index]['title'],
                    style:
                        TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8.0),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Text(
                        '\$${logos[index]['price'].toString()}',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(6.0)),
            child: Text('Indonesia, Bandung'),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.info),
                color: Theme.of(context).accentColor,
                onPressed: () => Navigator.pushNamed<bool>(
                    context, '/logo/' + index.toString()),
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.red,
                onPressed: () => Navigator.pushNamed<bool>(
                    context, '/logo/' + index.toString()),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildLogoList() {
    Widget logoCard;
    if (logos.length > 0) {
      logoCard = ListView.builder(
          itemBuilder: _buildLogoItem, itemCount: logos.length);
    } else {
      logoCard = Center(child: Text('No logos found, please add some'));
    }
    return logoCard;
  }

  @override
  Widget build(BuildContext context) {
    return _buildLogoList();
  }
}
