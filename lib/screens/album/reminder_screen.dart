import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';
import 'package:my_pet/widgets/album.dart';


class ReminderListScreen extends StatefulWidget {
  const ReminderListScreen({super.key});

  @override
  State<ReminderListScreen> createState() => _ReminderListScreenState();
}

class _ReminderListScreenState extends State<ReminderListScreen> {
  // 0 = List, 1 = Add (Yellow Circle), 2 = Calendar
  int _navIndex = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF454545),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(color: AppColors.primaryYellow, shape: BoxShape.circle),
                          child: const Icon(Icons.arrow_back, size: 16, color: Colors.black54),
                        ),
                      ),
                      const Expanded(
                        child: Center(
                          child: Text("Reminder/Alarm", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(width: 40),
                    ],
                  ),
                ),

                // Tabs (Reminder | Alarm)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      _buildTopTab("reminder", true),
                      _buildTopTab("alarm", false),
                    ],
                  ),
                ),

                // White Container Content
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        // Sub-header icons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(Icons.favorite_border, color: AppColors.primaryYellow),
                            const SizedBox(width: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                              decoration: BoxDecoration(color: AppColors.primaryYellow, borderRadius: BorderRadius.circular(20)),
                              child: const Text("Edit", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(width: 10),
                            const Icon(Icons.info_outline, color: AppColors.primaryYellow),
                          ],
                        ),
                        const SizedBox(height: 20),
                        
                        // List Items (Screen 27)
                        Expanded(
                          child: ListView(
                            children: const [
                              ReminderTile(time: "2027/08/21 14:10", repeat: "every day", text: "dummy text dummy text"),
                              ReminderTile(time: "2027/08/21 14:10", repeat: "", text: "Reservation for meals"),
                              ReminderTile(time: "2027/08/21 14:10", repeat: "Wednesday", text: "work tasks"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Bottom Sheet Overlay (Screen 28 - Logic for Add Button)
            // For this demo, I'll just put the Bottom Navigation Bar
            Positioned(
              bottom: 0, left: 0, right: 0,
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                  color: Color(0xFF454545),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavBarItem(Icons.list, "List", 0),
                    // Big Yellow Add Button
                    GestureDetector(
                      onTap: () => _showAddMenu(context),
                      child: Container(
                        width: 60, height: 60,
                        margin: const EdgeInsets.only(bottom: 30),
                        decoration: const BoxDecoration(color: AppColors.primaryYellow, shape: BoxShape.circle),
                        child: const Icon(Icons.add, size: 30, color: Colors.white),
                      ),
                    ),
                    _buildNavBarItem(Icons.calendar_today, "calendar", 2),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopTab(String label, bool isActive) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primaryYellow : Colors.grey[400],
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        ),
        child: Center(child: Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: isActive ? Colors.black : Colors.white70))),
      ),
    );
  }

  Widget _buildNavBarItem(IconData icon, String label, int index) {
    final isSel = _navIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _navIndex = index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isSel ? AppColors.primaryYellow : Colors.grey),
          Text(label, style: TextStyle(fontSize: 10, color: isSel ? AppColors.primaryYellow : Colors.grey)),
        ],
      ),
    );
  }

  // Screen 28: Bottom Sheet Logic
  void _showAddMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color(0xFF333333),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Display list", style: TextStyle(color: Colors.white, fontSize: 10)),
            const SizedBox(height: 10),
            _buildMenuItem(Icons.favorite, "With favorites", true),
            _buildMenuItem(null, "Show remaining tasks", false),
            _buildMenuItem(null, "Show all (including completed tasks)", false),
            const Divider(color: Colors.grey),
            const Text("Create new task", style: TextStyle(color: Colors.white, fontSize: 10)),
            const SizedBox(height: 40), // Spacing for the yellow button
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData? icon, String label, bool isHighlighted) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: isHighlighted ? const Color(0xFF8B8000) : Colors.transparent, // Dark yellow for highlight
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          if (icon != null) ...[Icon(icon, color: Colors.white, size: 16), const SizedBox(width: 8)],
          Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }
}