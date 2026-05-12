// lib/features/queue/queue.dart

import 'package:flutter/material.dart';
import 'package:venqueue/features/queue/presentation/widget/service_card.dart';

class QueueLink extends StatelessWidget {
  final String bankName;
  final String bankLetter;
  final Color bankColor;
  final String services;
  final String waiting;

  const QueueLink({
    super.key,
    required this.bankName,
    required this.bankLetter,
    required this.bankColor,
    required this.services,
    required this.waiting,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> serviceList = [
      {
        'icon': Icons.payments_outlined,
        'title': 'Cash Withdrawal',
        'subtitle': 'Withdraw money instantly',
        'waiting': '8 waiting',
        'time': '5 min',
      },
      {
        'icon': Icons.receipt_long_outlined,
        'title': 'Bill Payment',
        'subtitle': 'Pay bills and utilities',
        'waiting': '5 waiting',
        'time': '4 min',
      },
      {
        'icon': Icons.swap_horiz_rounded,
        'title': 'Money Transfer',
        'subtitle': 'Local & international transfer',
        'waiting': '12 waiting',
        'time': '7 min',
      },
      {
        'icon': Icons.person_add_alt_1_outlined,
        'title': 'Account Opening',
        'subtitle': 'Create a new bank account',
        'waiting': '7 waiting',
        'time': '12 min',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F6FA),
        surfaceTintColor: const Color(0xFFF4F6FA),
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 100,
        foregroundColor: Colors.black,
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$bankName Services",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2),
            const Text(
              "Choose one service to get queue number",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [bankColor, bankColor.withValues(alpha: 0.85)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: bankColor.withValues(alpha: 0.25),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Center(
                      child: Text(
                        bankLetter,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bankName,
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          services,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      waiting,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            Expanded(
              child: ListView.separated(
                itemCount: serviceList.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  final service = serviceList[index];

                  return ServiceCard(
                    icon: service['icon'],
                    title: service['title'],
                    subtitle: service['subtitle'],
                    waiting: service['waiting'],
                    time: service['time'],
                    bankColor: bankColor,
                    onJoin: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text(
                            'Joined ${service['title']} at $bankName',
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
