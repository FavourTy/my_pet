import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/shop_widgets.dart';

class RoomEditScreen extends StatefulWidget {
  const RoomEditScreen({super.key});

  @override
  State<RoomEditScreen> createState() => _RoomEditScreenState();
}

class _RoomEditScreenState extends State<RoomEditScreen> {
  int _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Room Background (Full Screen)
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?q=80&w=2000', 
              fit: BoxFit.cover,
            ),
          ),
          
          // 2. Top Bar
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              children: [
                // Close Button
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(color: AppColors.primaryYellow, shape: BoxShape.circle),
                    child: const Icon(Icons.close, size: 20, color: Colors.black54),
                  ),
                ),
                const Spacer(),
                // Room Label
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(20)),
                  child: const Text("living room", style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ],
            ),
          ),

          // 3. Right Side Tools
          const Positioned(
            right: 20,
            top: 150,
            child: Column(
              children: [
                EditToolBtn(label: "reset", icon: Icons.refresh),
                EditToolBtn(label: "Orientation", icon: Icons.rotate_90_degrees_ccw),
                EditToolBtn(label: "height", icon: Icons.height),
                EditToolBtn(label: "rotation", icon: Icons.rotate_right),
              ],
            ),
          ),
          
          // 4. Bottom Sheet (Furniture Inventory)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 350,
              color: Colors.white,
              child: Column(
                children: [
                  // "This is OK" Button (Floating above sheet)
                  Transform.translate(
                    offset: const Offset(0, -25),
                    child: Container(
                      width: 200,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.primaryYellow,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))],
                      ),
                      child: const Center(child: Text("This is OK", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black54))),
                    ),
                  ),
                  
                  // Tabs
                  SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildTab("Favorite", 0),
                        _buildTab("Under placement", 1),
                        _buildTab("everything", 2),
                        _buildTab("Interior", 3),
                        _buildTab("accessories", 4),
                      ],
                    ),
                  ),
                  
                  // Grid
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(10),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5, 
                        childAspectRatio: 1,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemCount: 20,
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5E6CA),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        // Placeholder furniture image
                        child: const Center(child: Icon(Icons.chair, color: Colors.brown)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Bottom Left/Right controls
          Positioned(
            bottom: 380, // Above the sheet
            left: 20,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(color: AppColors.primaryYellow, shape: BoxShape.circle),
              child: const Icon(Icons.undo, color: Colors.black54),
            ),
          ),
           Positioned(
            bottom: 380,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(color: AppColors.primaryYellow, shape: BoxShape.circle),
              child: const Icon(Icons.redo, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, int index) {
    final isSelected = _selectedCategory == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedCategory = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        color: isSelected ? AppColors.primaryYellow : Colors.grey[300],
        child: Text(label, style: TextStyle(fontSize: 10, color: isSelected ? Colors.black : Colors.grey[600])),
      ),
    );
  }
}