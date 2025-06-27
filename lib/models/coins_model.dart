// class CoinsData {
//   final String symbol;
//   final double price;

//   CoinsData({required this.symbol, required this.price});

//   // factory CoinsData.from(String symbol, Map<String, dynamic> map) {
//   //   return CoinsData(
//   //     symbol: symbol,
//   //     price: map['USD']?.toDouble() ?? 0.0,
//   //   );
//   // }

//   @override
//   String toString() {
//     return '$symbol, $price';
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_app/models/detail.dart';

class CoinsData {
  final String symbol;
  final CoinDetail coinDetail;

  CoinsData({required this.symbol, required this.coinDetail});

  @override
  String toString() {
    debugPrint("$symbol, $coinDetail");
    return "$symbol, $coinDetail";
  }
}
