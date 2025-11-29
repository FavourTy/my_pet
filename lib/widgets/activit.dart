import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';


// 1. Pet Grid Card (Screen 25)
class PetGridCard extends StatelessWidget {
  final String label;
  final bool isAdd; // "moving house"
  final bool isWelcome; // "welcome" placeholder

  const PetGridCard({
    super.key,
    required this.label,
    this.isAdd = false,
    this.isWelcome = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            // Add = Dark Grey, Welcome = Dark Grey, Normal = Light Grey
            color: isAdd || isWelcome
                ? const Color(0xFF555555)
                : const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: isAdd
              ? const Center(
                  child: Icon(
                    Icons.info_outline,
                    color: AppColors.primaryYellow,
                  ),
                )
              : isWelcome
              ? const Center(
                  child: Text(
                    "welcome",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : null,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}

// 2. Walking Course Button (Screen 28)
class CourseButton extends StatelessWidget {
  final String label;
  final String? subLabel; // Red text
  final String? blueLabel; // Blue text (for Ticket info)
  final String? topLabel; // Label above button (e.g. "event venue")
  final VoidCallback onTap;

  const CourseButton({
    super.key,
    required this.label,
    required this.onTap,
    this.subLabel,
    this.blueLabel,
    this.topLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (topLabel != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              topLabel!,
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9), // Grey background
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                if (blueLabel != null)
                  Text(
                    blueLabel!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 8,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                if (subLabel != null)
                  Text(
                    subLabel!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 8,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// 3. Competition Button (Screen 30)
class CompetitionButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const CompetitionButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
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

// 4. Bring Item Slot (Screen 28)
class BringItemSlot extends StatelessWidget {
  const BringItemSlot({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Positioned(
          top: -5,
          right: -5,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.primaryYellow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "!",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
