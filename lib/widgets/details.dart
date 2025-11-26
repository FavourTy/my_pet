import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';

class AddPhotoBtn extends StatelessWidget {
  final VoidCallback onTap;

  const AddPhotoBtn({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.add, color: AppColors.primaryYellow, size: 20),
            SizedBox(width: 10),
            Text(
              "select photo",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 2. Yellow Search Bar (Screen 36)
class YellowSearchBar extends StatelessWidget {
  const YellowSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.primaryYellow,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: const [
          Spacer(),
          Icon(Icons.search, color: Colors.black54, size: 20),
        ],
      ),
    );
  }
}

// 3. Dropdown Pill (Screen 36)
class DropdownPill extends StatelessWidget {
  final String label;

  const DropdownPill({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.primaryYellow,
            size: 16,
          ),
        ],
      ),
    );
  }
}

// 4. Locked Content Tile (Screen 36)
class LockedContentTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isLocked;
  final String? lockText; // e.g., "Opening in 5 days"

  const LockedContentTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.isLocked = false,
    this.lockText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Image / Lock Overlay
          Container(
            width: 120,
            height: 100,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?q=80&w=400',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: isLocked
                ? Container(
                    color: Colors.black54,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (lockText != null)
                          Text(
                            lockText!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        const SizedBox(height: 5),
                        const Icon(Icons.lock, color: Colors.white, size: 24),
                      ],
                    ),
                  )
                : null,
          ),

          // Text Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.white70, fontSize: 10),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        isLocked ? Icons.favorite_border : Icons.favorite,
                        size: 14,
                        color: AppColors.primaryYellow,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        isLocked ? "Unopened" : "Viewed",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 5. Action Pill (Small yellow buttons like "add photo")
class ActionPill extends StatelessWidget {
  final IconData? icon;
  final String label;
  final VoidCallback onTap;
  final bool isOutline;

  const ActionPill({
    super.key,
    this.icon,
    required this.label,
    required this.onTap,
    this.isOutline = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isOutline ? Colors.transparent : AppColors.primaryYellow,
          borderRadius: BorderRadius.circular(20),
          border: isOutline ? Border.all(color: Colors.white) : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 14,
                color: isOutline ? Colors.white : Colors.black54,
              ),
              const SizedBox(width: 4),
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: isOutline ? Colors.white : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
