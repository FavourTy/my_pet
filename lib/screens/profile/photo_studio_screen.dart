import 'package:flutter/material.dart';
import 'package:my_pet/screens/profile/photo_preview_screen.dart';
import 'package:my_pet/screens/profile/profile_card.dart';
import 'package:my_pet/screens/profile/warning_dialog.dart';
import 'package:my_pet/utils/colors.dart';

class PhotoStudioScreen extends StatelessWidget {
  const PhotoStudioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800], // Dark studio background
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 40),
                // Card Preview
                const Center(child: ProfileCardWidget()),
                const Spacer(),
                
                // Bottom Control Area
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    children: [
                      // Toggles Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _togglePill("icon\non/off"),
                          _togglePill("room\non/off"),
                          _togglePill("pet\non/off"),
                        ],
                      ),
                      const SizedBox(height: 20),
                      
                      // Shutter Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           // Back Button
                           GestureDetector(
                             onTap: () {
                               // Trigger Warning Dialog (Screen 11)
                               showDialog(context: context, builder: (_) => const ShootingWarningDialog());
                             },
                             child: const CircleAvatar(backgroundColor: AppColors.primaryYellow, child: Icon(Icons.arrow_back, color: Colors.black54)),
                           ),
                           
                           // Shutter Button
                           GestureDetector(
                             onTap: () {
                               // Navigate to Preview (Screen 12)
                               Navigator.push(context, MaterialPageRoute(builder: (_) => const PhotoPreviewScreen()));
                             },
                             child: Container(
                               width: 70, height: 70,
                               decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 border: Border.all(color: Colors.white, width: 4),
                                 color: Colors.white38
                               ),
                               child: Center(
                                 child: Container(
                                   width: 55, height: 55,
                                   decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                                 ),
                               ),
                             ),
                           ),
                           
                           // Star/Decoration Button
                           Column(
                             mainAxisSize: MainAxisSize.min,
                             children: const [
                               Icon(Icons.star_border, color: AppColors.primaryYellow, size: 30),
                               Text("decoration", style: TextStyle(color: AppColors.primaryYellow, fontSize: 10))
                             ],
                           )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _togglePill(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, textAlign: TextAlign.center, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black54)),
    );
  }
}