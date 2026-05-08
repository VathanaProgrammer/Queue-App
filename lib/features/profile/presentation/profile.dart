import 'package:flutter/material.dart';
import 'package:venqueue/features/profile/widget/profile_item.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),

      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E3A8A), Color(0xFF2563EB)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage("https://ibb.co/sdng2qF9"),
                  ),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sieng Vathana",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "+855 11 779 155",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListView(
                  children: [
                    ProfileItem(
                      icon: Icons.person_outline,
                      title: "My Account",
                      onTap: () {
                        debugPrint("Go to My Account");
                      },
                    ),
                    ProfileItem(
                      icon: Icons.history,
                      title: "Queue History",
                      onTap: () {
                        debugPrint("Go to History");
                      },
                    ),
                    ProfileItem(
                      icon: Icons.favorite_border,
                      title: "Favorite Services",
                      onTap: () {},
                    ),
                    ProfileItem(
                      icon: Icons.notifications_none,
                      title: "Notifications",
                      badge: "3",
                      onTap: () {},
                    ),
                    ProfileItem(
                      icon: Icons.credit_card,
                      title: "Payment Methods",
                      onTap: () {},
                    ),
                    ProfileItem(
                      icon: Icons.help_outline,
                      title: "Help & Support",
                      onTap: () {},
                    ),
                    ProfileItem(
                      icon: Icons.settings,
                      title: "Settings",
                      onTap: () {},
                    ),
                    ProfileItem(
                      icon: Icons.logout,
                      title: "Log Out",
                      isLogout: true,
                      onTap: () {
                        // 👉 logout logic here
                        debugPrint("Logout clicked");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
