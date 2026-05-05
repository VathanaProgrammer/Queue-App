import 'package:flutter/material.dart';
import 'package:venqueue/features/home/presentation/home.dart';
import 'package:venqueue/features/profile/presentation/profile.dart';
import 'package:venqueue/features/queue/presentation/queue.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    Queuescreen(),
    Profilescreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Container(
            height: 72,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.75), // ← Improved
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: Colors.white.withOpacity(0.9),
                width: 1.2,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                double itemWidth = constraints.maxWidth / 3;

                return Stack(
                  children: [
                    // Sliding Glass Indicator
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 380),
                      curve: Curves.easeOutCubic,
                      left: _currentIndex * itemWidth,
                      child: Container(
                        width: itemWidth,
                        height: 72,
                        padding: const EdgeInsets.all(6),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(
                              0xFF1E88E5,
                            ).withOpacity(0.15), // ← Blue tint
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: const Color(0xFF1E88E5).withOpacity(0.25),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF1E88E5).withOpacity(0.2),
                                blurRadius: 12,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Navigation Items
                    Row(
                      children: [
                        _buildItem(Icons.home_rounded, "Home", 0),
                        _buildItem(
                          Icons.add_circle_rounded,
                          "Queue",
                          1,
                          isCenter: true,
                        ),
                        _buildItem(Icons.person_rounded, "Profile", 2),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(
    IconData icon,
    String label,
    int index, {
    bool isCenter = false,
  }) {
    bool isSelected = _currentIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => _currentIndex = index);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedScale(
              duration: const Duration(milliseconds: 250),
              scale: isSelected ? 1.25 : 1.0,
              child: Icon(
                icon,
                size: isCenter ? 32 : 26,
                color: isSelected ? const Color(0xFF1E88E5) : Colors.grey[600],
              ),
            ),
            const SizedBox(height: 4),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 250),
              style: TextStyle(
                color: isSelected ? const Color(0xFF1E88E5) : Colors.grey[700],
                fontSize: isSelected ? 13.5 : 12.5,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}
