import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/theme/icons.dart';

import 'package:flutter_app/ui/pages/navigation_page/navigation_page.dart';
import 'package:flutter_app/ui/pages/register/register_page.dart';
import 'package:flutter_app/ui/pages/test_page/test_page.dart';

import 'package:hive_flutter/hive_flutter.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    final box = Hive.box<User>('users');

    Future.delayed(const Duration(seconds: 3), () {
      if (box.isEmpty) {
        if (mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => RegistrationPage()),
            (route) => false,
          );
        }
      } else {
        if (mounted) Navigator.of(context).push(_createRoute());
      }
    });
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const TestPage(),
      transitionDuration: Duration(seconds: 2),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            RasterIcons.background,
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
