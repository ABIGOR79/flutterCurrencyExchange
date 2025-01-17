import 'package:flutter/material.dart';
import 'package:flutter_app/cripto_app.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/repository/load_data_factory.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('Talker starter debug');

  GetIt.I.registerSingleton<LoadDataFactory>(LoadDataFactory());
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('users');
  runApp(const MyApp());
}
