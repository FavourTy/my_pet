import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';


// 1. The Main Circular Action Button (Used for "Convert", "Take Care", etc.)
class CircularActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isWarning; // True turns it Red (Clean Up mode)

  const CircularActionButton({
    super.key,
    required this.label,
    required this.onTap,
    this.isWarning = false,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isWarning 
        ? AppColors.errorRed.withOpacity(0.9) 
        : AppColors.primaryYellow.withOpacity(0.9);
    
    final textColor = isWarning ? Colors.white : AppColors.primaryBrown;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 4),
          boxShadow: [
            BoxShadow(
              color: bgColor.withOpacity(0.4),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}