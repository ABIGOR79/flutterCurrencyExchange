import 'package:flutter_app/ui/pages/coin_detail/coin_detail_page.dart';
import 'package:flutter_app/ui/pages/home_page/home_page.dart';
import 'package:flutter_app/ui/pages/splash/splash_page.dart';

final routes = {
  '/': (context) => const SplashPage(),
  '/home': (context) => const MyHomePage(),
  '/coin': (context) => const CoinItemDetail(),
};
