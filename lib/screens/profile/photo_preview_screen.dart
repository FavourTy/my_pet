import 'package:flutter/material.dart';
import 'package:my_pet/screens/profile/profile_card.dart';
import 'package:my_pet/utils/colors.dart';

class PhotoPreviewScreen extends StatelessWidget {
  const PhotoPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const SizedBox(), // No back button here, controlled by bottom buttons
        title: const Text("profile card", style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: const [
           Padding(
             padding: EdgeInsets.all(8.0),
             child: CircleAvatar(backgroundColor: AppColors.primaryYellow, child: Icon(Icons.help_outline, color: Colors.black54, size: 18)),
           )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Center(child: ProfileCardWidget()),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(30)),
                      child: const Center(child: Text("Cancel", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold))),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(color: AppColors.primaryYellow, borderRadius: BorderRadius.circular(30)),
                    child: const Center(child: Text("Set on card", style: TextStyle(color: AppColors.primaryBrown, fontWeight: FontWeight.bold))),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}