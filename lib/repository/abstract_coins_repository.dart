import 'package:flutter_app/models/coins_model.dart';

abstract class AbstractCoinRepositoty {
  Future<List<CoinsData>> getData();
}
