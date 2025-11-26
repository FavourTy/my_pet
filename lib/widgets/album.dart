import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';


// 1. Simple Photo Tile (Square)
class PhotoTile extends StatelessWidget {
  final bool isSelected;
  final bool showCheck;
  final VoidCallback onTap;

  const PhotoTile({
    super.key,
    this.isSelected = false,
    this.showCheck = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              image: const DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1586023492125-27b2c045efd7?q=80&w=400'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (showCheck)
            Positioned(
              bottom: 5,
              right: 5,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryYellow : Colors.black26,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
                child: const Icon(Icons.check, size: 12, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}

// 2. Utility List Tile (Dark Grey Button)
class UtilityTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const UtilityTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 15),
            Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

// 3. Memory/Album Horizontal Item
class MemoryTile extends StatelessWidget {
  final String date;
  final String count;

  const MemoryTile({super.key, required this.date, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1586023492125-27b2c045efd7?q=80&w=400'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(date, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10)),
          Text(count, style: const TextStyle(color: Colors.white70, fontSize: 8)),
        ],
      ),
    );
  }
}

// 4. Reminder List Tile (Yellow outline circle)
class ReminderTile extends StatelessWidget {
  final String time;
  final String repeat;
  final String text;
  final bool isChecked;

  const ReminderTile({
    super.key,
    required this.time,
    required this.repeat,
    required this.text,
    this.isChecked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Check Circle
          Container(
            margin: const EdgeInsets.only(top: 5),
            width: 20, height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryYellow, width: 1.5),
              color: isChecked ? AppColors.primaryYellow : Colors.transparent,
            ),
          ),
          const SizedBox(width: 15),
          
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 12, color: AppColors.primaryYellow),
                    const SizedBox(width: 4),
                    Text("$time $repeat", style: const TextStyle(color: AppColors.primaryYellow, fontSize: 10)),
                  ],
                ),
                const SizedBox(height: 5),
                Text(text, style: const TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),
          
          // Heart Icon
          const Icon(Icons.favorite_border, color: AppColors.primaryYellow, size: 16),
        ],
      ),
    );
  }
}

