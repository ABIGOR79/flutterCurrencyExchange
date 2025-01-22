import 'package:flutter_app/ui/pages/coin_detail/coin_detail_page.dart';
import 'package:flutter_app/ui/pages/home_page/home_page.dart';
import 'package:flutter_app/ui/pages/profile/profile_page.dart';
import 'package:flutter_app/ui/pages/register/register_page.dart';
import 'package:flutter_app/ui/pages/splash/splash_page.dart';
import 'package:flutter_app/ui/pages/test_page/test_page.dart';

final routes = {
  '/': (context) => const SplashPage(),
  '/home': (context) => const MyHomePage(),
  '/coin': (context) => const CoinItemDetail(),
  '/registration': (context) => RegistrationPage(),
  '/profile': (context) => ProfileScreen(),
  '/test': (context) => TestPage(),
};
