import 'package:flutter/material.dart';
import 'package:venqueue/features/home/model/bank_model.dart';
import 'package:venqueue/features/home/widget/bank_card.dart';
import 'package:venqueue/features/queue/presentation/screens/queuelink.dart';

class QueueScreen extends StatefulWidget {
  const QueueScreen({super.key});

  @override
  State<QueueScreen> createState() => _QueueScreenState();
}

class _QueueScreenState extends State<QueueScreen> {
  final TextEditingController searchController = TextEditingController();
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
      letter: "D",
      name: "Canadia Bank",
      services: "4 services available",
      waiting: "18 waiting",
      color: const Color(0xFF64B5F6),
    ),
  ];

  List<Bank> filteredBanks = [];

  @override
  void initState() {
    super.initState();
    filteredBanks = banks;
  }

  void searchBank(String query) {
    final result = banks.where((bank) {
      final nameLower = bank.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return nameLower.contains(searchLower);
    }).toList();

    setState(() {
      filteredBanks = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),

      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 60,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1E88E5), Color(0xFF64B5F6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Queue List",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Choose a bank to view queue",
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 15),

                TextField(
                  controller: searchController,
                  onChanged: searchBank,
                  decoration: InputDecoration(
                    hintText: "Search bank...",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                Text(
                  "Available Banks",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          Expanded(
            child: filteredBanks.isEmpty
                ? const Center(
                    child: Text(
                      "No Bank Found",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: banks.length,
                    itemBuilder: (context, index) {
                      final bank = banks[index];

                      return Container(
                        margin: const EdgeInsets.only(bottom: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: BankCard(
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
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
