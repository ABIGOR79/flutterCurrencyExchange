// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinDetail _$CoinDetailFromJson(Map<String, dynamic> json) => CoinDetail(
      price: (json['PRICE'] as num?)?.toDouble(),
      image: json['IMAGEURL'] as String?,
      highHour: (json['HIGH24HOUR'] as num?)?.toDouble(),
      lowHour: (json['LOW24HOUR'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoinDetailToJson(CoinDetail instance) =>
    <String, dynamic>{
      'PRICE': instance.price,
      'IMAGEURL': instance.image,
      'HIGH24HOUR': instance.highHour,
      'LOW24HOUR': instance.lowHour,
    };
