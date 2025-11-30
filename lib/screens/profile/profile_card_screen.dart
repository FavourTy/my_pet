import 'package:flutter/material.dart';
import 'package:my_pet/screens/profile/photo_studio_screen.dart';
import 'package:my_pet/screens/profile/profile_card.dart';
import 'package:my_pet/screens/profile/qr_scan_screen.dart';
import 'package:my_pet/utils/colors.dart';

class ProfileCardScreen extends StatelessWidget {
  const ProfileCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: AppColors.primaryYellow, 
            child: GestureDetector(
              onTap: ()=>Navigator.pop(context),
              child: const Icon(Icons.close, color: Colors.black54, size: 18)
            )
          ),
        ),
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
          // --- Reused Card ---
          const Center(child: ProfileCardWidget()),
          
          const Spacer(),
          
          // --- Bottom Actions ---
          Padding(
            padding: const EdgeInsets.only(bottom: 40, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _actionBtn(Icons.qr_code_scanner, "Qr reading", () {
                   Navigator.push(context, MaterialPageRoute(builder: (_) => const QRScanScreen())); // Go to Screen 9
                }),
                
                // Save (Edit) Button - Highlighted with Pencil
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (_) => const PhotoStudioScreen())); // Go to Screen 10
                      },
                      child: Transform.rotate(
                        angle: -0.5, // Tilted pencil
                        child: const Icon(Icons.edit, color: AppColors.primaryYellow, size: 40),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text("save", style: TextStyle(fontSize: 10, color: Colors.black54, fontWeight: FontWeight.bold)),
                  ],
                ),
                
                _actionBtn(Icons.share, "share", () {}),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _actionBtn(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.primaryYellow, size: 30),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 10, color: Colors.black54, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}