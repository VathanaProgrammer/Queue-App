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

            // ================= HEADER =================
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E3A8A), Color(0xFF2563EB)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      "https://i.ibb.co/BVyr13CV/photo-2026-01-26-03-14-24.jpg",
                    ),
                  ),

                  const SizedBox(width: 16),

                  // FIX: prevent overflow + better layout
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Sieng Vathana",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "+855 11 779 155",
                          style: TextStyle(color: Colors.white70, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ================= LIST =================
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                children: [
                  _buildSection([
                    ProfileItem(
                      icon: Icons.person_outline,
                      title: "My Account",
                      onTap: () {},
                    ),
                    ProfileItem(
                      icon: Icons.history,
                      title: "Queue History",
                      onTap: () {},
                    ),
                    ProfileItem(
                      icon: Icons.favorite_border,
                      title: "Favorite Services",
                      onTap: () {},
                    ),
                  ]),

                  const SizedBox(height: 16),

                  _buildSection([
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
                  ]),

                  const SizedBox(height: 16),

                  _buildSection([
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
                  ]),

                  const SizedBox(height: 16),

                  _buildSection([
                    ProfileItem(
                      icon: Icons.logout,
                      title: "Log Out",
                      isLogout: true,
                      onTap: () {},
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildSection(List<Widget> items) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.04),
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
      ],
    ),
    child: Column(children: items),
  );
}
