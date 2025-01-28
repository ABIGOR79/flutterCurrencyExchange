import 'package:flutter/material.dart';
import 'package:flutter_app/navigation/routes.dart';
import 'package:flutter_app/theme/theme.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: themeLight,
      routerConfig: router,
      // navigatorObservers: [
      //   TalkerRouteObserver(
      //     GetIt.I<Talker>(),
      //   )
      // ],
    );
  }
}
