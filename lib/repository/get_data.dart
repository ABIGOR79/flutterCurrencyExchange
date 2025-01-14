import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/coins_model.dart';
import 'package:flutter_app/models/detail.dart';
import 'package:flutter_app/repository/abstract_coins_repository.dart';

class GetData implements AbstractCoinRepositoty {
  final Dio dio;

  GetData({required this.dio});

  @override
  Future<List<CoinsData>> getData() async {
    try {
      final response = await dio.get(
          'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AVAX,CAG,DOV,SOL&tsyms=USD');
      final dataCoin = response.data as Map<String, dynamic>;
      final dataRaw = dataCoin['RAW'] as Map<String, dynamic>;

      final currencyList = dataRaw.entries.map((entry) {
        final currencyDataUsd = entry.value['USD'];
        final coinDetail = CoinDetail.fromJson(currencyDataUsd);
        return CoinsData(symbol: entry.key, coinDetail: coinDetail);
      }).toList();
      return currencyList;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
