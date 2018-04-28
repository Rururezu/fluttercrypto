import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_crypto/data/crypto_data.dart';

class ProdCryptoRepository implements CryptoRepository {

  String cryptoUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=50";

  @override
  Future<List<Crypto>> fetchCurrencies() async {
    http.Response res = await http.get(cryptoUrl);
    final List resBody = json.decode(res.body);
    final statusCode = res.statusCode;
    if(statusCode != 200 || resBody == null) throw new FetchDataException("An error occured: [Code: $statusCode");
    return resBody.map((c)=>new Crypto.fromMap(c)).toList();
  }
}