import 'package:equatable/equatable.dart';
import 'package:flutter_app/models/coins_model.dart';

class CoinState extends Equatable {
  final bool isLoading;
  final List<CoinsData> coins;
  final List<CoinsData> filteredCoins;
  final String? searchQuery;
  final String? selectedCurrency;
  final bool useNetwork; // Новое поле

  const CoinState({
    this.isLoading = false,
    this.coins = const [],
    this.filteredCoins = const [],
    this.searchQuery,
    this.selectedCurrency,
    this.useNetwork = true,
  });

  CoinState copyWith({
    bool? isLoading,
    List<CoinsData>? coins,
    List<CoinsData>? filteredCoins,
    String? searchQuery,
    String? selectedCurrency,
    bool? useNetwork,
  }) {
    return CoinState(
      isLoading: isLoading ?? this.isLoading,
      coins: coins ?? this.coins,
      filteredCoins: filteredCoins ?? this.filteredCoins,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedCurrency: selectedCurrency ?? this.selectedCurrency,
      useNetwork: useNetwork ?? this.useNetwork,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        coins,
        filteredCoins,
        searchQuery,
        selectedCurrency,
        useNetwork
      ];
}
