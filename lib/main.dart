import 'package:flutter/material.dart';
import 'package:flutter_crypto/home_page.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

void main() async {
  List currencies = await _getCurrencies();
  runApp(new MyApp(currencies));
} 

class MyApp extends StatelessWidget {

  final List _currencies;
  MyApp(this._currencies);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: new HomePage(_currencies),
    );
  }
}

Future<List> _getCurrencies() async {
  String cryptoUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
  http.Response res = await http.get(cryptoUrl);
  return json.decode(res.body);
}