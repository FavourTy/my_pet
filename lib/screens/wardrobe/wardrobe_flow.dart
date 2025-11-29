import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';

// ... (Previous code) ...

// --- SCREEN 13: WARDROBE GRID WITH DUPLICATE TAB ---
class WardrobeScreen13 extends StatefulWidget {
  const WardrobeScreen13({super.key});

  @override
  State<WardrobeScreen13> createState() => _WardrobeScreen13State();
}

class _WardrobeScreen13State extends State<WardrobeScreen13> {
  int _mainTab = 2; // 0=In Use, 1=Wish List, 2=Duplicate
  int _subTab = 0; // 0=Everything

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 700,
            padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      "Entry procedure >",
                      style: TextStyle(fontSize: 10, color: Colors.orange),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Main Tabs
                Row(
                  children: [
                    _buildTab("in use", _mainTab == 0),
                    _buildTab("wish list", _mainTab == 1),
                    _buildTab("Duplicate", _mainTab == 2, isYellow: true),
                  ],
                ),

                // Sub Tabs
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildSubPill("everything", true),
                      _buildSubPill("room", false),
                      _buildSubPill("Room wear", false),
                      _buildSubPill("Going out", false),
                    ],
                  ),
                ),

                // Grid
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.only(top: 10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          childAspectRatio: 0.8,
                        ),
                    itemCount: 25,
                    itemBuilder: (context, index) {
                      final isSelected =
                          index == 0 ||
                          index == 12 ||
                          index == 13; // Demo selection
                      return Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5E6CA),
                          borderRadius: BorderRadius.circular(8),
                          border: isSelected
                              ? Border.all(
                                  color: AppColors.primaryYellow,
                                  width: 2,
                                )
                              : null,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            const Icon(Icons.checkroom, color: Colors.brown),
                            const Positioned(
                              bottom: 2,
                              child: Text(
                                "10",
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            if (isSelected)
                              const Positioned(
                                bottom: 2,
                                right: 2,
                                child: Icon(
                                  Icons.check_circle,
                                  color: AppColors.primaryYellow,
                                  size: 12,
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // Footer
                const Text(
                  "Selected 0/15",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryYellow.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Check",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: -15,
            left: 0,
            child: const CircleAvatar(
              backgroundColor: AppColors.primaryYellow,
              child: Icon(Icons.close, size: 20, color: Colors.black54),
            ),
          ),
          Positioned(
            top: -15,
            right: 0,
            child: const CircleAvatar(
              backgroundColor: AppColors.primaryYellow,
              child: Icon(Icons.question_mark, size: 20, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, bool isActive, {bool isYellow = false}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isActive
              ? (isYellow ? AppColors.primaryYellow : Colors.grey[400])
              : Colors.grey[300],
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isActive ? Colors.black87 : Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubPill(String label, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.primaryYellow.withOpacity(0.5)
            : Colors.grey[300],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(label, style: const TextStyle(fontSize: 10)),
    );
  }
}
