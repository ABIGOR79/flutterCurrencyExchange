import 'package:dio/dio.dart';
import 'package:flutter_app/repository/getData/abstract_coins_repository.dart';
import 'package:flutter_app/repository/getData/get_data.dart';
import 'package:flutter_app/repository/getData/get_data_local.dart';

class LoadDataFactory {
  final AbstractCoinRepositoty networkRepository;
  final AbstractCoinRepositoty localRepository;

  LoadDataFactory()
      : networkRepository = GetData(dio: Dio()),
        localRepository = GetLocalData();

  AbstractCoinRepositoty getNetworkRepository() => networkRepository;
  AbstractCoinRepositoty getLocalRepository() => localRepository;

  AbstractCoinRepositoty getRepository({bool useNetwork = true}) =>
      useNetwork ? networkRepository : localRepository;
}
