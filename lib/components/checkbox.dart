import 'package:flutter/material.dart';

class SomethingContainer extends StatelessWidget {
  final int value;
  final Function(int value) onchganged;
  final int groupValue;

  const SomethingContainer({
    super.key,
    required this.groupValue,
    required this.onchganged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    bool ischecked = value == groupValue;
    return Container(
      color: ischecked ? Colors.green : Colors.yellow,
      width: double.infinity,
      child: Row(
        children: [
          InkWell(
            splashColor: ischecked ? Colors.black : Colors.brown,
            onTap: () => onchganged(value),
            child: const Text('First'),
          ),
        ],
      ),
    );
  }
}
