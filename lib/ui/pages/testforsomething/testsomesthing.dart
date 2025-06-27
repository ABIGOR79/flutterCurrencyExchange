import 'package:flutter/material.dart';
import 'package:flutter_app/components/checkbox.dart';

class Something extends StatefulWidget {
  const Something({super.key});

  @override
  State<Something> createState() => _SomethingState();
}

class _SomethingState extends State<Something> {
  int group = 0;

  void changeColor(int value) {
    setState(() {
      group = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("To do something to change"),
            SomethingContainer(
              groupValue: group,
              onchganged: changeColor,
              value: 1,
            ),
            SizedBox(height: 20),
            SomethingContainer(
              groupValue: group,
              onchganged: changeColor,
              value: 2,
            ),
            SizedBox(height: 20),
            SomethingContainer(
              groupValue: group,
              onchganged: changeColor,
              value: 3,
            ),
          ],
        ),
      ),
    );
  }
}
