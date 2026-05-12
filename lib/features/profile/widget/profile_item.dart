import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? badge;
  final bool isLogout;
  final VoidCallback? onTap;

  const ProfileItem({
    super.key,
    required this.icon,
    required this.title,
    this.badge,
    this.isLogout = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: Colors.blue.withValues(alpha: 0.1),
        child: Icon(icon, color: Colors.blue),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isLogout ? Colors.red : Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: badge != null
          ? Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                badge!,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            )
          : const Icon(Icons.chevron_right),
    );
  }
}
