import 'dart:convert';

import 'package:cryptoapp/constants/config.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../models/coin.dart';
import '../models/coindetail.dart';

final coinApiService = Provider((ref) => CoinService());

class CoinService {
  static var client = http.Client();

  Future<List<Coin>> getCoins() async {
    var url = Uri.https(Config.apiUrl, Config.coinUrl);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return coinFromJson(data);
    } else {
      return throw Exception(response.statusCode);
    }
  }

  Future<CoinDetail> getCoinDetail(String coinId) async {

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json/json;charset=UTF-8',
      'Charset': 'utf-8'
    };
    var url = Uri.https(Config.apiUrl, Config.coinUrl +"/"+ coinId);
    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return CoinDetail.fromJson(data);
    } else {
      return throw Exception(response.statusCode);
    }

  }
}
