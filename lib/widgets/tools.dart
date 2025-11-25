import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';

// 1. Tool Grid Item (Square Icon + Label) - Screen 8
class ToolGridItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool isRedText;

  const ToolGridItem({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    this.isRedText = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9), // Grey placeholder bg
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 32),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isRedText ? Colors.red : Colors.black54,
              fontWeight: isRedText ? FontWeight.bold : FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// 2. Present List Item (Headquarters / Friend Request) - Screen 6 & 7
class PresentTile extends StatelessWidget {
  final String title;
  final String description;
  final String dateOrLimit;
  final bool isRequest; // Changes button style slightly

  const PresentTile({
    super.key,
    required this.title,
    required this.description,
    required this.dateOrLimit,
    this.isRequest = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Grey Box Image
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 15),

          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
                Text(
                  dateOrLimit,
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ),

          // Action Button
          Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryYellow,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "receive",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              if (isRequest) ...[
                const SizedBox(height: 5),
                const Text(
                  "xx days left",
                  style: TextStyle(fontSize: 10, color: Colors.black54),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

// 3. Camera Side Button (Circle with Icon + Text) - Screen 9 & 10
class CameraSideBtn extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const CameraSideBtn({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5), // Semi-transparent black
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 24),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// 4. Camera Top Mode Chip (Pill shape)
class CameraModeChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const CameraModeChip({
    super.key,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? Colors.white.withOpacity(0.3)
            : Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
        border: isSelected ? Border.all(color: AppColors.primaryYellow) : null,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? AppColors.primaryYellow : Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
