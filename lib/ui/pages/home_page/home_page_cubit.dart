import 'package:flutter_app/repository/getData/load_data_factory.dart';
import 'package:flutter_app/ui/pages/home_page/home_page_event.dart';
import 'package:flutter_app/ui/pages/home_page/home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  final LoadDataFactory loadDataFactory;
  String _searchQuery = '';
  String? selectedCurrency;

  CoinBloc(this.loadDataFactory) : super(CoinState()) {
    on<LoadCoinsEvent>(_onLoadCoins);
    on<UpdateSearchQueryEvent>(_onUpdateSearchQuery);
    on<UpdateSelectedCurrencyEvent>(_onUpdateSelectedCurrency);
    on<ToggleDataSourceEvent>((event, emit) {
      emit(state.copyWith(useNetwork: event.useNetwork));
    });
  }

  Future<void> _onLoadCoins(
      LoadCoinsEvent event, Emitter<CoinState> emit) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 2));
    try {
      final repository = state.useNetwork
          ? loadDataFactory.getNetworkRepository()
          : loadDataFactory.getLocalRepository();
      final coins = await repository.getData();
      emit(
          state.copyWith(coins: coins, filteredCoins: coins, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  void _onUpdateSearchQuery(
      UpdateSearchQueryEvent event, Emitter<CoinState> emit) {
    _searchQuery = event.query;
    _applyFilters(emit);
  }

  void _onUpdateSelectedCurrency(
      UpdateSelectedCurrencyEvent event, Emitter<CoinState> emit) {
    selectedCurrency = event.currency;
    _applyFilters(emit);
  }

  void _applyFilters(Emitter<CoinState> emit) {
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
