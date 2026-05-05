import 'package:flutter/material.dart';

class BankCard extends StatelessWidget {
  final String letter;
  final String bankName;
  final String services;
  final String waiting;
  final Color color;
  final VoidCallback? onTap;

  const BankCard({
    super.key,
    required this.letter,
    required this.bankName,
    required this.services,
    required this.waiting,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.15),
              child: Text(letter, style: TextStyle(color: color)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(bankName), Text(services)],
              ),
            ),
            Text(waiting),
          ],
        ),
      ),
    );
  }
}
