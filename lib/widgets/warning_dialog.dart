import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';

class WarningDialog extends StatelessWidget {
  final String message;
  
  const WarningDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Close button top left
            Align(
              alignment: Alignment.topLeft, 
              child: GestureDetector(
                onTap: ()=>Navigator.pop(context),
                child: const CircleAvatar(radius: 12, backgroundColor: AppColors.primaryYellow, child: Icon(Icons.close, size: 14, color: Colors.black54)),
              )
            ),
            const SizedBox(height: 15),
            
            // Message
            Text(
              message, 
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, height: 1.5, color: Colors.black87)
            ),
            
            const SizedBox(height: 25),
            
            // Buttons
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: ()=>Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(30)),
                      child: const Center(child: Text("No", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold))),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(color: AppColors.primaryYellow, borderRadius: BorderRadius.circular(30)),
                    child: const Center(child: Text("yes", style: TextStyle(color: AppColors.primaryBrown, fontWeight: FontWeight.bold))),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}