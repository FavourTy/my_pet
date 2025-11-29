import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

// 1. Clothing Grid Item
class ClothingItem extends StatelessWidget {
  final String imageUrl; // In real app
  final bool isSelected;
  final VoidCallback onTap;

  const ClothingItem({
    super.key,
    required this.imageUrl,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF5E6CA), // Cream background
          borderRadius: BorderRadius.circular(8),
          border: isSelected ? Border.all(color: AppColors.primaryYellow, width: 3) : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Placeholder for Shirt Image
            const Icon(Icons.checkroom, size: 40, color: AppColors.primaryBrown),
            const SizedBox(height: 5),
            if (isSelected)
              const Icon(Icons.check_circle, size: 16, color: AppColors.primaryYellow),
          ],
        ),
      ),
    );
  }
}

// 2. Wardrobe Tab (Favorite, Currently wear, etc.)
class WardrobeTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const WardrobeTab({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryYellow : Colors.grey[300],
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.black : Colors.grey[600],
          ),
        ),
      ),
    );
  }
}

// 3. Sort Button (Small pill with icon)
class SortTriggerBtn extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const SortTriggerBtn({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.primaryYellow.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.sort, size: 14, color: Colors.black54),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}