import 'package:flutter/material.dart';

class AppColors {
  // Main Brand Colors
  static const Color primaryYellow = Color(0xFFFFF176);
  static const Color primaryBrown = Colors.brown;
  static const Color inactiveTab = Color(0xFFE0E0E0);
  static const Color textDark = Color(0xFF424242);
  static const Color textLight = Color(0xFF9E9E9E);
  // Status Colors
  static const Color lovePink = Colors.pinkAccent;
  static const Color coinAmber = Colors.amber;
  static const Color ticketBlue = Colors.blueGrey;

  // Backgrounds
  static const Color bgCream = Color(0xFFF5E6CA);
  static const Color bgDirtyOverlay = Colors.black38;

  // Functional
  static const Color errorRed = Colors.redAccent;
  static const Color successGreen = Colors.green;
  static const Color white = Colors.white;
  static const Color white90 = Color(0xE6FFFFFF); // 90% Opacity
}

class AppTextStyles {
  static const TextStyle header = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black54,
    fontFamily: 'Rounded', // Assuming you add a rounded font later
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryBrown,
  );

  static const TextStyle chipLabel = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  static const TextStyle instructionText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    shadows: [Shadow(blurRadius: 10, color: Colors.black)],
  );
}

final BorderRadius standardRadius = BorderRadius.circular(20);
