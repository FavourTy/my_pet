import 'package:flutter/material.dart';

class PermissionDialog extends StatelessWidget {
  const PermissionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF424242), // Dark Grey
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Add to photos with \"Pet Ribs\"\nasking for access",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 10),
            const Text(
              "Images taken using the screenshot function\nUse to save.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 10),
            ),
            const SizedBox(height: 30),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Text("not allowed", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context), // Logic to Request Perms
                  child: const Text("allow", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}