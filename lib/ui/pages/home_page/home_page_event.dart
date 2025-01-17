import 'dart:async';

import 'package:equatable/equatable.dart';

abstract class CoinEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadCoinsEvent extends CoinEvent {}

class UpdateSearchQueryEvent extends CoinEvent {
  final String query;

  UpdateSearchQueryEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class UpdateSelectedCurrencyEvent extends CoinEvent {
  final String? currency;

  UpdateSelectedCurrencyEvent(this.currency);

  @override
  List<Object?> get props => [currency];
}

class LoadCryptoList extends CoinEvent {
  LoadCryptoList({
    this.completer,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}

class ToggleDataSourceEvent extends CoinEvent {
  final bool useNetwork;

  ToggleDataSourceEvent(this.useNetwork);

  @override
  List<Object?> get props => [useNetwork];
}
