import 'package:flutter_app/repository/abstract_coins_repository.dart';
import 'package:flutter_app/ui/pages/home_page/home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinCubit extends Cubit<CoinState> {
  final AbstractCoinRepositoty repository;

  CoinCubit(this.repository) : super(CoinState());

  String _searchQuery = '';
  String? selectedCurrency;

  Future<void> loadCoins() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 2));
    try {
      final coins = await repository.getData();
      emit(
          state.copyWith(coins: coins, filteredCoins: coins, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    _applyFilters();
  }

  void updateSelectedCurrency(String? currency) {
    selectedCurrency = currency;
    _applyFilters();
  }

  void _applyFilters() {
    final filteredCoins = state.coins.where((coin) {
      final matchesSearch =
          coin.symbol.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCurrency = selectedCurrency == null ||
          selectedCurrency == 'All' ||
          coin.symbol == selectedCurrency;
      return matchesSearch && matchesCurrency;
    }).toList();

    emit(state.copyWith(filteredCoins: filteredCoins));
  }
}
