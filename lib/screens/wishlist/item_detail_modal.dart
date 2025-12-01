import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';
// Ensure AppColors is imported

class ItemDetailModal extends StatelessWidget {
  const ItemDetailModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      // Adjust inset padding to match the screenshot width
      insetPadding: const EdgeInsets.symmetric(horizontal: 40), 
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Hug content height
          children: [
            // 1. Top Title
            const Text(
              "basket wear 10",
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 14, 
                color: Colors.black87
              ),
            ),
            const SizedBox(height: 20),

            // 2. Main Image
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF9C4), // Light cream/yellow background
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              // Replace Icon with your Image.asset(...)
              child: const Icon(Icons.checkroom, size: 80, color: Colors.blueGrey), 
            ),
            const SizedBox(height: 20),

            // 3. Status Icons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _statusRow(Icons.check_circle, "Get clothes", isGrey: true),
                _statusRow(Icons.favorite_border, "wish list", isGrey: false),
              ],
            ),
            const SizedBox(height: 20),

            // 4. Large Item Name
            const Text(
              "basket wear 10",
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 18, 
                color: Colors.black54
              ),
            ),
            const SizedBox(height: 6),

            // 5. Stats Line
            const Text(
              "Number of possessions: 0 In use: 0",
              style: TextStyle(fontSize: 11, color: Colors.grey),
            ),
            const SizedBox(height: 12),

            // 6. Description Text
            const Text(
              "dummy text dummy text dummy text dummy text\ndummy text dummy text dummy text dummy text",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11, color: Colors.grey, height: 1.2),
            ),
            const SizedBox(height: 25),

            // 7. Action Buttons
            Row(
              children: [
                Expanded(child: _yellowButton("give a present")),
                const SizedBox(width: 10),
                Expanded(child: _yellowButton("exchange gifts")),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Helper for the small icon+text rows
  Widget _statusRow(IconData icon, String label, {required bool isGrey}) {
    Color color = isGrey ? Colors.grey[400]! : Colors.grey;
    return Row(
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 11, 
            fontWeight: FontWeight.bold, 
            color: color
          ),
        )
      ],
    );
  }

  // Helper for the bottom yellow buttons
  Widget _yellowButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryYellow, 
        borderRadius: BorderRadius.circular(30),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.brown, // Matches the brown text in screenshot
          fontWeight: FontWeight.bold,
          fontSize: 11
        ),
      ),
    );
  }
}