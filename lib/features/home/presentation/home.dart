import 'package:flutter/material.dart';
import 'package:venqueue/features/home/widget/bank_card.dart';
import 'package:venqueue/features/home/widget/queue_stat.dart';
import 'package:venqueue/features/home/model/bank_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ CLEAN DATA
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
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 26,
              backgroundColor: Colors.pink,
              child: Text("👧"),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔍 SEARCH
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

            // 📋 LIST
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
                      debugPrint("Clicked ${bank.name}");
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
