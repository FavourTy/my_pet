import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';

class ItemDetailDialog extends StatelessWidget {
  const ItemDetailDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: AppColors.white,
      insetPadding: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("basket wear 10", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textDark)),
            const SizedBox(height: 20),
            
            // Image Area
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFDE7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.checkroom, size: 80, color: Colors.redAccent), // Placeholder
            ),
            
            const SizedBox(height: 20),
            
            // Options Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(children: const [
                  Icon(Icons.check_circle, color: Colors.grey, size: 20),
                  SizedBox(width: 5),
                  Text("Get clothes", style: TextStyle(fontSize: 12, color: Colors.grey))
                ]),
                Row(children: const [
                  Icon(Icons.favorite_border, color: Colors.grey, size: 20),
                  SizedBox(width: 5),
                  Text("wish list", style: TextStyle(fontSize: 12, color: Colors.grey))
                ]),
              ],
            ),
            
            const SizedBox(height: 20),
            const Text("basket wear 10", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 5),
            const Text("Number of possessions: 0 In use: 0", style: TextStyle(fontSize: 10, color: Colors.grey)),
            const SizedBox(height: 10),
            const Text(
              "dummy text dummy text dummy text dummy text\ndummy text dummy text dummy text dummy text",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            
            const SizedBox(height: 25),
            
            // Buttons
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

  Widget _yellowButton(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.primaryYellow,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(label, style: const TextStyle(color: AppColors.primaryBrown, fontWeight: FontWeight.bold, fontSize: 12)),
    );
  }
}