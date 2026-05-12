import 'package:flutter/material.dart';

class QueueStat extends StatelessWidget {
  final String number;
  final String label;

  const QueueStat({
    super.key,
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}