import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';

// 1. Bulletin Category Tile (Screen 1)
class BulletinCategoryTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool showArrow;
  final bool isExpanded; // For "Pair work 2025" accordion style
  final VoidCallback onTap;

  const BulletinCategoryTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.showArrow = true,
    this.isExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: const BoxDecoration(
          color: Color(0xFFF5F5F5), // Light grey background
          border: Border(bottom: BorderSide(color: Colors.white, width: 2)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  if (subtitle.isNotEmpty)
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                ],
              ),
            ),
            if (showArrow)
              Icon(
                isExpanded ? Icons.keyboard_arrow_down : Icons.arrow_forward,
                size: 16,
                color: Colors.grey,
              ),
          ],
        ),
      ),
    );
  }
}

// 2. Post Card (Screen 2, 3, 4, 5, 6)
class PostCard extends StatelessWidget {
  final String name;
  final String time;
  final String text;
  final bool hasImages;
  final bool isEdited;
  final VoidCallback onMoreTap;

  const PostCard({
    super.key,
    required this.name,
    required this.time,
    required this.text,
    required this.onMoreTap,
    this.hasImages = true,
    this.isEdited = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.black54),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(4),
                ),
              ), // Pet icon
              const SizedBox(width: 8),
              Text(
                name,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
              const Spacer(),
              const Icon(Icons.favorite_border, size: 16, color: Colors.grey),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: onMoreTap,
                child: const Icon(
                  Icons.more_horiz,
                  size: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Text Body
          Text(
            text,
            style: const TextStyle(fontSize: 12, color: Colors.black87),
          ),

          const SizedBox(height: 10),

          // Images Grid (2x2 placeholder)
          if (hasImages)
            Row(
              children: [
                _buildImg(),
                const SizedBox(width: 5),
                _buildImg(),
                const SizedBox(width: 5),
                _buildImg(),
                const SizedBox(width: 5),
                _buildImg(),
              ],
            ),

          const SizedBox(height: 10),

          // Footer (Time + Icons)
          Row(
            children: [
              if (hasImages)
                const Text(
                  "See Google Translate",
                  style: TextStyle(fontSize: 8, color: Colors.grey),
                ), // Placeholder text
              const Spacer(),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    time,
                    style: TextStyle(fontSize: 10, color: Colors.grey[400]),
                  ),
                  if (isEdited) ...[
                    const SizedBox(width: 10),
                    const Icon(Icons.check, size: 10, color: Colors.black),
                    const Text(
                      "Edited",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.chat_bubble_outline, size: 14, color: Colors.grey),
                  SizedBox(width: 4),
                  Text("0", style: TextStyle(fontSize: 10, color: Colors.grey)),
                  SizedBox(width: 10),
                  Icon(Icons.favorite_border, size: 14, color: Colors.grey),
                  SizedBox(width: 4),
                  Text("0", style: TextStyle(fontSize: 10, color: Colors.grey)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImg() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

// 3. "Leave a comment" Button (Floating)
class CommentButton extends StatelessWidget {
  final VoidCallback onTap;

  const CommentButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.primaryYellow,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: const Center(
          child: Text(
            "Leave a comment",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}

// 4. Yellow Refresh Button (Small Circle)
class RefreshFab extends StatelessWidget {
  const RefreshFab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: const BoxDecoration(
              color: AppColors.primaryYellow,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            "reload",
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

// 5. Header Search Bar (Screen 4)
class BulletinSearchBar extends StatelessWidget {
  const BulletinSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
