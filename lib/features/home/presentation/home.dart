import 'package:flutter/material.dart';
import 'package:venqueue/features/home/widget/bank_card.dart';
import 'package:venqueue/features/home/widget/queue_stat.dart';
import 'package:venqueue/features/home/model/bank_model.dart';
import 'package:venqueue/features/queue/presentation/screens/queuelink.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Bank> banks = [
      Bank(
        letter: "A",
        name: "ACLEDA Bank",
        services: "5 services available",
        waiting: "32 waiting",
        color: const Color(0xFF1E88E5),
      ),
      Bank(
        letter: "B",
        name: "ABA Bank",
        services: "3 services available",
        waiting: "12 waiting",
        color: const Color(0xFF42A5F5),
      ),
      Bank(
        letter: "C",
        name: "Canadia Bank",
        services: "4 services available",
        waiting: "18 waiting",
        color: const Color(0xFF64B5F6),
      ),
      Bank(
        letter: "C",
        name: "Canadia Bank",
        services: "4 services available",
        waiting: "18 waiting",
        color: const Color(0xFF64B5F6),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F6FA),
        surfaceTintColor: const Color(0xFFF4F6FA),
        shadowColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,

        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Ven",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "Queue",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Color(0xFF1E88E5),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Choose your bank",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ],
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 26,
              backgroundColor: const Color(0xFF64B5F6),
              backgroundImage: const NetworkImage(
                'https://i.ibb.co/BVyr13CV/photo-2026-01-26-03-14-24.jpg',
              ),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search bank or service...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1E88E5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today's Queue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Live waiting overview across branches",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      QueueStat(number: "44", label: "Waiting"),
                      QueueStat(number: "15", label: "Services"),
                      QueueStat(number: "12m", label: "Avg wait"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Available Banks",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: banks.length,
                itemBuilder: (context, index) {
                  final bank = banks[index];

                  return BankCard(
                    letter: bank.letter,
                    bankName: bank.name,
                    services: bank.services,
                    waiting: bank.waiting,
                    color: bank.color,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QueueLink(
                            bankName: bank.name,
                            bankLetter: bank.letter,
                            bankColor: bank.color,
                            services: bank.services,
                            waiting: bank.waiting,
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
