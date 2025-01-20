import 'package:flutter_app/models/coins_model.dart';
import 'package:flutter_app/models/detail.dart';
import 'package:flutter_app/repository/getData/abstract_coins_repository.dart';

class GetLocalData extends AbstractCoinRepositoty {
  @override
  Future<List<CoinsData>> getData() async {
    final localData = <CoinsData>[
      CoinsData(
          symbol: 'MYBTS',
          coinDetail: CoinDetail(
              price: 100.19, image: null, highHour: 111.2, lowHour: 100.1)),
    ];
    return localData;
  }
}
