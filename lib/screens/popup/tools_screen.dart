import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/tools_widgets.dart';
import 'camera_screen.dart'; // We will create this next

// --- SCREEN 8: USEFUL TOOLS ---
void showUsefulToolsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          // Main Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("useful tools", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54)),
                const SizedBox(height: 30),
                
                // 2x4 Grid
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    ToolGridItem(label: "camera", icon: Icons.camera_alt, onTap: () => _openCamera(context)),
                    ToolGridItem(label: "weather", icon: Icons.wb_sunny, onTap: () {}),
                    ToolGridItem(label: "alarm", icon: Icons.alarm, onTap: () {}),
                    ToolGridItem(label: "number of steps", icon: Icons.directions_walk, onTap: () {}),
                    ToolGridItem(label: "photo", icon: Icons.photo, onTap: () {}),
                    ToolGridItem(label: "reminder", icon: Icons.note, onTap: () {}),
                    ToolGridItem(label: "album", icon: Icons.book, onTap: () {}),
                    ToolGridItem(label: "SNS post", icon: Icons.share, isRedText: true, onTap: () {}),
                  ],
                ),
              ],
            ),
          ),

          // X Button
          Positioned(top: -15, left: 0, child: _buildRoundBtn(Icons.close, () => Navigator.pop(context))),
          // ? Button
          Positioned(top: -15, right: 0, child: _buildRoundBtn(Icons.question_mark, () {})),
        ],
      ),
    ),
  );
}

void _openCamera(BuildContext context) {
  Navigator.pop(context); // Close dialog
  Navigator.push(context, MaterialPageRoute(builder: (_) => const CameraScreen()));
}

// --- SCREEN 6 & 7: PRESENT BOX (3 TABS) ---
void showPresentBoxDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const _PresentBoxDialog(),
  );
}

class _PresentBoxDialog extends StatefulWidget {
  const _PresentBoxDialog();

  @override
  State<_PresentBoxDialog> createState() => _PresentBoxDialogState();
}

class _PresentBoxDialogState extends State<_PresentBoxDialog> {
  int _currentTab = 0; // 0=Received, 1=Exchange, 2=History
  int _exchangeSubTab = 0; // 0=Received, 1=Sent

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(15),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: double.infinity,
            height: 600, // Fixed height for list
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                const SizedBox(height: 50), // Space for header
                const Text("present box", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54)),
                const SizedBox(height: 20),

                // 3 Main Tabs
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      _buildMainTab(0, "What I received"),
                      _buildMainTab(1, "exchange"),
                      _buildMainTab(2, "history"),
                    ],
                  ),
                ),

                // Content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: _buildContent(),
                  ),
                ),
                
                // Bottom Buttons (Only for Tab 0)
                if (_currentTab == 0)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    child: Row(
                      children: [
                        Expanded(child: _buildYellowBtn("give a present")),
                        const SizedBox(width: 10),
                        Expanded(child: _buildYellowBtn("Receive all at once")),
                      ],
                    ),
                  ),
                  
                // Bottom Button (Only for Tab 1)
                if (_currentTab == 1)
                   Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: _buildYellowBtn("send exchange request", width: 200),
                  ),
              ],
            ),
          ),
          
          Positioned(top: -15, left: 0, child: _buildRoundBtn(Icons.close, () => Navigator.pop(context))),
          Positioned(top: -15, right: 0, child: _buildRoundBtn(Icons.question_mark, () {})),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (_currentTab == 0) {
      // Tab 0: What I received (Empty State Example)
      return const Center(
        child: Text(
          "Make it clear that there has been an increase\nInitial screen that has never been sent",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      );
    } else if (_currentTab == 1) {
      // Tab 1: Exchange (Has Sub-tabs)
      return Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildSubTab(0, "Request received")),
              Expanded(child: _buildSubTab(1, "Request sent")),
            ],
          ),
          const SizedBox(height: 20),
          // List of requests
          PresentTile(
            title: "Headquarters", 
            description: "Dummy text about how I got it", 
            dateOrLimit: "2025/08/08",
            isRequest: true,
          ),
        ],
      );
    }
    return const Center(child: Text("History empty"));
  }

  Widget _buildMainTab(int index, String label) {
    bool isActive = _currentTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _currentTab = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isActive ? AppColors.primaryYellow : const Color(0xFFE0E0E0),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
          ),
          child: Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: isActive ? Colors.black : Colors.grey)),
        ),
      ),
    );
  }

  Widget _buildSubTab(int index, String label) {
    bool isActive = _exchangeSubTab == index;
    return GestureDetector(
      onTap: () => setState(() => _exchangeSubTab = index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        color: isActive ? AppColors.primaryYellow.withOpacity(0.5) : Colors.grey[200],
        child: Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
      ),
    );
  }
  
  Widget _buildYellowBtn(String label, {double? width}) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(color: AppColors.primaryYellow, borderRadius: BorderRadius.circular(30)),
      child: Center(child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 12))),
    );
  }
}

Widget _buildRoundBtn(IconData icon, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(color: AppColors.primaryYellow, shape: BoxShape.circle),
      child: Icon(icon, size: 20, color: Colors.black54),
    ),
  );
}