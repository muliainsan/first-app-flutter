import 'package:flutter/material.dart';
import './logos.dart';


class LogoManager extends StatelessWidget {
  final List<Map<String, dynamic>> logos;

  LogoManager(this.logos);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      Expanded(child: Logos(logos))
    ]);
  }
}