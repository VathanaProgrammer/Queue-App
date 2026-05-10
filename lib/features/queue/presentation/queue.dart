// lib/features/queue/queue.dart

import 'package:flutter/material.dart';

class QueueScreen extends StatelessWidget {
  final String bankName;
  final String bankLetter;
  final Color bankColor;
  final String services;
  final String waiting;

  const QueueScreen({
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
            // ==================================================
            // BANK SUMMARY CARD
            // ==================================================
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [bankColor, bankColor.withOpacity(0.85)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: bankColor.withOpacity(0.25),
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
                      color: Colors.white.withOpacity(0.18),
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
                      color: Colors.white.withOpacity(0.18),
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

            // ==================================================
            // SERVICES LIST
            // ==================================================
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

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String waiting;
  final String time;
  final Color bankColor;
  final VoidCallback onJoin;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.waiting,
    required this.time,
    required this.bankColor,
    required this.onJoin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          // Icon
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: bankColor.withOpacity(0.08),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: bankColor, size: 26),
          ),

          const SizedBox(width: 14),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE9F8EF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Open',
                        style: TextStyle(
                          color: Color(0xFF20A35A),
                          fontWeight: FontWeight.w600,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Text(
                      waiting,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      time,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const Spacer(),

                    SizedBox(
                      height: 34,
                      child: ElevatedButton(
                        onPressed: onJoin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: bankColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Join',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
