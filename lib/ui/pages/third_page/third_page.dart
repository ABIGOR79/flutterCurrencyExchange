import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';
import 'package:hive/hive.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  late Box<User> box;

  @override
  void initState() {
    super.initState();

    box = Hive.box<User>('users');
  }

  void clearAll() async {
    await box.clear();

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('All users have been deleted')),
    );

    Navigator.of(context).pushNamedAndRemoveUntil(
      '/registration',
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: clearAll,
          child: const Text('Delete All Users'),
        ),
      ),
    );
  }
}
