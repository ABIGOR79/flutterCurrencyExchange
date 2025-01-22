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
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => RegistrationPage()),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const TestPage()),
          (route) => false,
        );
      }
    });
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
