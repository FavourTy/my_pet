import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:my_pet/screens/shop/shop_popups.dart';
import 'package:my_pet/utils/colors.dart';
import 'package:my_pet/widgets/shop.dart';
import 'package:my_pet/widgets/wardrobe.dart';

class WardrobeScreen extends StatefulWidget {
  const WardrobeScreen({super.key});

  @override
  State<WardrobeScreen> createState() => _WardrobeScreenState();
}

class _WardrobeScreenState extends State<WardrobeScreen> {
  int _selectedTab = 2; // Default to "everything"
  int _selectedItemIndex = -1;
  bool _isGoingOutMode = false; // Toggle for Screen 12

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fill gaps
      body: Stack(
        children: [
          // 1. Background (Garden/Living Room)
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1585320806297-9794b3e4eeae?q=80&w=2000', // Garden-ish bg
              fit: BoxFit.cover,
            ),
          ),

          // 2. 3D Model (The Rabbit)
          Positioned.fill(
            bottom: 250, // Leave space for bottom sheet
            child: const ModelViewer(
              src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb', // Placeholder
              autoRotate: true,
              cameraControls: true,
              backgroundColor: Colors.transparent,
            ),
          ),

          // 3. Top Bar
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Close / X Button
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryYellow,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close, size: 20, color: Colors.black54),
                  ),
                ),
                
                // "Room wear" / "Going out" Switch
                GestureDetector(
                  onTap: () => setState(() => _isGoingOutMode = !_isGoingOutMode),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Text(
                          _isGoingOutMode ? "Going out" : "Room wear",
                          style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 5),
                        const Icon(Icons.keyboard_arrow_down, color: AppColors.primaryYellow, size: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 4. Right Side Tools (Reset, Height, etc.)
          Positioned(
            right: 20,
            top: 150,
            child: Column(
              children: const [
                EditToolBtn(label: "reset", icon: Icons.refresh),
                EditToolBtn(label: "Orientation", icon: Icons.rotate_90_degrees_ccw),
                EditToolBtn(label: "height", icon: Icons.height),
                EditToolBtn(label: "rotation", icon: Icons.rotate_right),
              ],
            ),
          ),

          // 5. Bottom Left/Right Paging Arrows
          Positioned(
            bottom: 350, // Just above the white sheet
            left: 20,
            child: _buildPageBtn(Icons.arrow_back),
          ),
          Positioned(
            bottom: 350,
            right: 20,
            child: _buildPageBtn(Icons.arrow_forward),
          ),

          // 6. "This is OK" Button (Floating)
          Positioned(
            bottom: 330,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 200,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.primaryYellow,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))],
                ),
                child: const Center(
                  child: Text(
                    "This is OK",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
                  ),
                ),
              ),
            ),
          ),

          // 7. Bottom Sheet (Wardrobe Inventory)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 300,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  // Sort & Tabs Row
                  Row(
                    children: [
                      const Spacer(),
                      SortTriggerBtn(
                        label: "Entry procedure", 
                        onTap: () => showSortDialog(context), // Reuse Screen 5 Dialog
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  
                  // Tabs
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        WardrobeTab(
                          label: "favorite", 
                          isSelected: _selectedTab == 0, 
                          onTap: () => setState(() => _selectedTab = 0),
                        ),
                        WardrobeTab(
                          label: "Currently wear", 
                          isSelected: _selectedTab == 1, 
                          onTap: () => setState(() => _selectedTab = 1),
                        ),
                        WardrobeTab(
                          label: "everything", 
                          isSelected: _selectedTab == 2, 
                          onTap: () => setState(() => _selectedTab = 2),
                        ),
                        WardrobeTab(
                          label: "Interior", 
                          isSelected: _selectedTab == 3, 
                          onTap: () => setState(() => _selectedTab = 3),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  
                  // Grid
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1,
                      ),
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return ClothingItem(
                          imageUrl: "", // Placeholder
                          isSelected: _selectedItemIndex == index,
                          onTap: () => setState(() => _selectedItemIndex = index),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageBtn(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: AppColors.primaryYellow,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 20, color: Colors.black54),
    );
  }
}