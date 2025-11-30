import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';

class ShootingWarningDialog extends StatelessWidget {
  const ShootingWarningDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topLeft, 
              child: GestureDetector(
                onTap: ()=>Navigator.pop(context),
                child: const CircleAvatar(radius: 12, backgroundColor: AppColors.primaryYellow, child: Icon(Icons.close, size: 14, color: Colors.black54)),
              )
            ),
            const SizedBox(height: 10),
            const Text(
              "Shooting not completed\nEdited content will be discarded\nIs that okay?", 
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, height: 1.5)
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
                  child: const Text("Return to shooting", style: TextStyle(fontSize: 10, color: Colors.grey)),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  decoration: BoxDecoration(color: AppColors.primaryYellow, borderRadius: BorderRadius.circular(20)),
                  child: const Text("destroy", style: TextStyle(fontSize: 10, color: Colors.black54, fontWeight: FontWeight.bold)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}