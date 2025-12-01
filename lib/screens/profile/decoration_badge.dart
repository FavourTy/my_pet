import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';
import 'package:my_pet/widgets/warning_dialog.dart';
// Ensure AppColors is imported

class DecorationEditorScreen extends StatefulWidget {
  const DecorationEditorScreen({Key? key}) : super(key: key);

  @override
  _DecorationEditorScreenState createState() => _DecorationEditorScreenState();
}

class _DecorationEditorScreenState extends State<DecorationEditorScreen> {
  int _selectedTab = 1; // 0: frame, 1: stamp
  List<Offset> _stamps = []; // To track added stamps (simplified for demo)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF333333), // Dark background for editor
      body: SafeArea(
        child: Column(
          children: [
            // --- Top Bar ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Trigger Warning Dialog (Screen 18)
                      showDialog(
                        context: context,
                        builder: (_) => const WarningDialog(
                          message:
                              "Editing is in progress.\nNot set as my profile card\nAre you going back?",
                        ),
                      );
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.white24,
                      child: Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  const SizedBox(width: 40), // Balance the row
                ],
              ),
            ),

            // --- Main Editing Area ---
            Expanded(
              child: Center(
                child: Container(
                  width: 300,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen[100], // Placeholder for photo
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      image: NetworkImage(
                        "https://via.placeholder.com/300x400",
                      ), // Replace with your pet image
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Active Stamp (Simulating Screen 17)
                      if (_stamps.isNotEmpty)
                        const Positioned(
                          top: 100,
                          left: 80,
                          child: DraggableStampWidget(),
                        ),
                    ],
                  ),
                ),
              ),
            ),

            // --- Bottom Editor Sheet ---
            Container(
              height: 280,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  // Title Row with SHOP button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(child: SizedBox()), // Spacer
                        const Text(
                          "XX-chan",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: AppColors.primaryYellow,
                                shape: BoxShape.circle,
                              ),
                              child: const Text(
                                "SHOP",
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Tabs
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [_buildTab("frame", 0), _buildTab("stamp", 1)],
                    ),
                  ),

                  // Grid Content
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(20),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        // The heart stamp shown in Screen 15/16/17
                        if (index == 2) {
                          return GestureDetector(
                            onTap: () =>
                                setState(() => _stamps.add(Offset.zero)),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 40,
                              ),
                            ),
                          );
                        }
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
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
          padding: const EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryYellow : Colors.grey[300],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black54 : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

// --- Helper Widget: The Draggable Stamp (Screen 17) ---
class DraggableStampWidget extends StatelessWidget {
  const DraggableStampWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // In a real app, wrap this in a GestureDetector for pan/scale
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // The Stamp Image
          const Center(
            child: Icon(Icons.favorite, color: Colors.red, size: 60),
          ),

          // Delete Handle (Top Left)
          Positioned(
            top: -10,
            left: -10,
            child: CircleAvatar(
              radius: 12,
              backgroundColor: AppColors.primaryYellow,
              child: const Icon(Icons.close, size: 14, color: Colors.black54),
            ),
          ),

          // Resize/Rotate Handle (Bottom Right)
          Positioned(
            bottom: -10,
            right: -10,
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.black54,
              child: const Icon(
                Icons.open_in_full,
                size: 14,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
