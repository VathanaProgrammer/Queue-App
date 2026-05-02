import 'package:flutter/material.dart';

import '../../../../core/constant/colors.dart';

class AuthTabSelector extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onChanged;

  const AuthTabSelector({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _TabItem(
            title: "Log in",
            isSelected: selectedIndex == 0,
            onTap: () => onChanged(0),
          ),
        ),
        Expanded(
          child: _TabItem(
            title: "Sign up",
            isSelected: selectedIndex == 1,
            onTap: () => onChanged(1),
          ),
        ),
      ],
    );
  }
}

class _TabItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabItem({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: isSelected
                  ? AppColors.primary
                  : AppColors.textCaption,
            ),
          ),
          const SizedBox(height: 6),
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 3,
            width: isSelected ? 150 : 0,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}