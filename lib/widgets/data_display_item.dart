import 'package:flutter/material.dart';

class DataDisplayItem extends StatelessWidget {
  final String name;
  final String value;

  const DataDisplayItem({super.key, required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.blue,
          ),
        ),
        Text(value)
      ],
    );
  }
}
