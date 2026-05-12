import 'package:flutter/material.dart';

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
            color: Colors.black.withValues(alpha: 0.04),
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
              color: bankColor.withValues(alpha: 0.08),
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
