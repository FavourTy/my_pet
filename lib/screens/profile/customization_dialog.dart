import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';

class CustomizationDialog extends StatefulWidget {
  const CustomizationDialog({Key? key}) : super(key: key);

  @override
  _CustomizationDialogState createState() => _CustomizationDialogState();
}

class _CustomizationDialogState extends State<CustomizationDialog> {
  int _selectedTab = 0; // 0: icon, 1: frame

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(onTap: ()=>Navigator.pop(context), child: const CircleAvatar(radius: 12, backgroundColor: AppColors.primaryYellow, child: Icon(Icons.close, size: 14, color: Colors.black54))),
                  const Text("customization", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
                  GestureDetector(
                    // TRIGGER SCREEN 5 (Warning)
                    onTap: () => showDialog(context: context, builder: (_) => const DestructionDialog()), 
                    child: const CircleAvatar(radius: 12, backgroundColor: AppColors.primaryYellow, child: Icon(Icons.help_outline, size: 14, color: Colors.black54))
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Preview
            Container(width: 80, height: 80, decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 2), borderRadius: BorderRadius.circular(10))),
            const SizedBox(height: 5),
            const Text("xxxx", style: TextStyle(fontSize: 10, color: Colors.grey)),
            const SizedBox(height: 15),

            // Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _buildTab("icon", 0),
                  _buildTab("frame", 1),
                ],
              ),
            ),

            // Grid Content
            Container(
              height: 300,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white, // In screenshot it looks like white card overlapping
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
                itemCount: 12,
                itemBuilder: (context, index) {
                  if (index == 11) {
                     return Container(
                       alignment: Alignment.center,
                       decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(8)),
                       child: const Text("original image\nediting", textAlign: TextAlign.center, style: TextStyle(fontSize: 8, color: Colors.black54)),
                     );
                  }
                  return Container(
                    decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(8)),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              decoration: BoxDecoration(color: AppColors.primaryYellow, borderRadius: BorderRadius.circular(20)),
              child: Text(_selectedTab == 0 ? "change icon" : "change frame", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    bool isSelected = _selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTab = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryYellow : Colors.grey[300],
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
          child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, color: isSelected ? Colors.black54 : Colors.grey)),
        ),
      ),
    );
  }
}

// SCREEN 5: DESTRUCTION DIALOG
class DestructionDialog extends StatelessWidget {
  const DestructionDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(alignment: Alignment.topLeft, child: CircleAvatar(radius: 12, backgroundColor: AppColors.primaryYellow, child: GestureDetector(onTap: ()=>Navigator.pop(context), child: const Icon(Icons.close, size: 14, color: Colors.black54)))),
            const SizedBox(height: 10),
            const Text(
              "Icon change not completed\nEdited content will be discarded\nIs that okay?", 
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