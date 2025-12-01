import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';

class SaveConfirmationDialog extends StatelessWidget {
  const SaveConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Close Button
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const CircleAvatar(
                  radius: 12,
                  backgroundColor: AppColors.primaryYellow,
                  child: Icon(Icons.close, size: 14, color: Colors.black54),
                ),
              ),
            ),

            const SizedBox(height: 10),
            const Text(
              "Save confirmation",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 15),

            const Text(
              "in your device's images folder\nYou can save it.\nPlease select the type of image to save.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 25),

            // Buttons
            _buildYellowBtn("profile card"),
            const SizedBox(height: 10),
            _buildYellowBtn("QR code only"),
          ],
        ),
      ),
    );
  }

  Widget _buildYellowBtn(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryYellow,
        borderRadius: BorderRadius.circular(30),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
