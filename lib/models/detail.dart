import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detail.g.dart';

@JsonSerializable()
class CoinDetail {
  @JsonKey(name: 'PRICE')
  final double? price;

  @JsonKey(name: 'IMAGEURL')
  final String? image;

  @JsonKey(name: 'HIGH24HOUR')
  final double? highHour;

  @JsonKey(name: 'LOW24HOUR')
  final double? lowHour;

  CoinDetail({
    required this.price,
    required this.image,
    required this.highHour,
    required this.lowHour,
  });

  @override
  String toString() {
    debugPrint("$price, $highHour, $lowHour");
    return "$price, $highHour, $lowHour";
  }

  String get fullImageUrl => image != null
      ? 'https://www.cryptocompare.com$image'
      : 'https://via.placeholder.com/150';

  factory CoinDetail.fromJson(Map<String, dynamic> json) =>
      _$CoinDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CoinDetailToJson(this);
}
