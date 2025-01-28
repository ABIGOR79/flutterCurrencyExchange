import 'package:flutter/material.dart';
import 'package:flutter_app/models/coins_model.dart';
import 'package:flutter_app/ui/pages/coin_detail/coin_detail_page.dart';
import 'package:flutter_app/ui/pages/home_page/home_page.dart';
import 'package:flutter_app/ui/pages/navigation_page/navigation_page.dart';
import 'package:flutter_app/ui/pages/profile/profile_page.dart';
import 'package:flutter_app/ui/pages/register/register_page.dart';
import 'package:flutter_app/ui/pages/splash/splash_page.dart';
import 'package:flutter_app/ui/pages/test_page/test_page.dart';
import 'package:go_router/go_router.dart';

// final routes = {
//   '/': (context) => const SplashPage(),
//   '/home': (context) => const MyHomePage(),
//   '/coin': (context) => const CoinItemDetail(),
//   '/registration': (context) => RegistrationPage(),
//   '/profile': (context) => ProfileScreen(),
//   '/test': (context) => TestPage(),
// };
//  ------- other
// part 'routes.gr.dart';

// @AutoRouterConfig()
// class AppRouter extends _$AppRouter {

//  @override
//  List<AutoRoute> get routes => [

//  ];
// }

// -- other

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'navigation',
          builder: (BuildContext context, GoRouterState state) {
            return const NavigationPage();
          },
        ),
        GoRoute(
          path: 'test',
          builder: (BuildContext context, GoRouterState state) {
            return const TestPage();
          },
        ),
        GoRoute(
          path: 'profile',
          builder: (BuildContext context, GoRouterState state) {
            return ProfileScreen();
          },
        ),
        GoRoute(
          path: 'coin',
          builder: (BuildContext context, GoRouterState state) {
            final coin = state.extra as CoinsData?;
            return CoinItemDetail(coin: coin);
          },
        ),
        GoRoute(
          path: 'register',
          builder: (BuildContext context, GoRouterState state) {
            return const RegistrationPage();
          },
        ),
      ],
    ),
  ],
);
