import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';

class PlayScreen extends StatefulWidget {
  final String mode; // 'ball' or 'touch'
  const PlayScreen({super.key, required this.mode});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  Widget build(BuildContext context) {
    // Screen 23 Background vs Screen 24 Background
    final String bgImage = widget.mode == 'ball'
        ? 'https://images.unsplash.com/photo-1548199973-03cce0bbc87b?q=80&w=2000'
        : 'https://images.unsplash.com/photo-1583511655826-05700d52f4d9?q=80&w=2000';

    return Scaffold(
      body: Stack(
        children: [
          // 1. Background
          Positioned.fill(child: Image.network(bgImage, fit: BoxFit.cover)),

          // 2. Header
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              children: [
                _buildStatBadge(Icons.favorite, Colors.white, "123/1000"),
                const SizedBox(width: 10),
                _buildStatBadge(
                  Icons.confirmation_number,
                  Colors.white,
                  "12345",
                ),
                const SizedBox(width: 10),
                _buildStatBadge(Icons.monetization_on, Colors.white, "12345"),
              ],
            ),
          ),

          // 3. Content
          if (widget.mode == 'ball') _buildBallMode(),
          if (widget.mode == 'touch') _buildTouchMode(),
        ],
      ),
    );
  }

  // SCREEN 23: BALL THROWING
  Widget _buildBallMode() {
    return Stack(
      children: [
        // The Ball (Floating)
        Positioned(
          top: 200,
          left: 100,
          child: Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.green, Colors.white, Colors.orange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 10),
                ),
              ],
            ),
          ),
        ),
        // The Dog (Placeholder)
        Positioned(
          bottom: 100,
          left: 50,
          child: Image.network(
            'https://cdn-icons-png.flaticon.com/512/616/616408.png',
            width: 100,
          ),
        ),
        // Another Dog
        Positioned(
          bottom: 150,
          right: 50,
          child: Image.network(
            'https://cdn-icons-png.flaticon.com/512/616/616408.png',
            width: 80,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  // SCREEN 24: TOUCH & CALL
  Widget _buildTouchMode() {
    return Stack(
      children: [
        // Call Button
        Positioned(
          top: 150,
          right: 30,
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: AppColors.primaryYellow,
              shape: BoxShape.circle,
            ),
            child: const Text(
              "call",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
          ),
        ),

        // Dog Lying Down
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Image.network(
            'https://images.unsplash.com/photo-1534361960057-19889db9621e?q=80&w=1000',
            height: 400,
            fit: BoxFit.cover,
          ),
        ),

        // Hand Cursor
        Positioned(
          bottom: 150,
          right: 80,
          child: Icon(
            Icons.back_hand,
            color: Colors.white.withOpacity(0.8),
            size: 50,
          ),
        ),
      ],
    );
  }

  Widget _buildStatBadge(IconData icon, Color bg, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bg.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 12, color: Colors.grey),
          const SizedBox(width: 4),
          Text(text, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        ],
      ),
    );
  }
}
