import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/cripto_app.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/repository/abstract_coins_repository.dart';
import 'package:flutter_app/repository/get_data.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingleton<AbstractCoinRepositoty>(GetData(dio: Dio()));
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('users');
  runApp(const MyApp());
}
