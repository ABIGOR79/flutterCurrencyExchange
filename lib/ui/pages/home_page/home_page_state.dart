import 'package:flutter_app/models/coins_model.dart';

class CoinState {
  final bool isLoading;
  final List<CoinsData> coins;
  final List<CoinsData> filteredCoins;

  CoinState({
    this.isLoading = false,
    this.coins = const [],
    this.filteredCoins = const [],
  });

  CoinState copyWith({
    bool? isLoading,
    List<CoinsData>? coins,
    List<CoinsData>? filteredCoins,
  }) {
    return CoinState(
      isLoading: isLoading ?? this.isLoading,
      coins: coins ?? this.coins,
      filteredCoins: filteredCoins ?? this.filteredCoins,
    );
  }
}
