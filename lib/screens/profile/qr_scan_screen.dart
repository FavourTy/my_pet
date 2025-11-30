import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';

class QRScanScreen extends StatelessWidget {
  const QRScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Simulating camera view
      body: Stack(
        children: [
          // Background Image (Simulated Camera Feed)
          Positioned.fill(
            child: Opacity(
              opacity: 0.3,
              child: Image.network("https://via.placeholder.com/800x1200", fit: BoxFit.cover), // Placeholder
            ),
          ),
          
          // Top Buttons
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(backgroundColor: AppColors.primaryYellow, child: Icon(Icons.close, size: 20, color: Colors.black54)),
                  ),
                  const CircleAvatar(backgroundColor: AppColors.primaryYellow, child: Icon(Icons.help_outline, size: 20, color: Colors.black54)),
                ],
              ),
            ),
          ),

          // Center Scanning Area
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 280,
                  height: 280,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryYellow, width: 4),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white10, // Slight transparency inside
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "By reading the QR code\nYou can search for other owners",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}