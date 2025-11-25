import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'common_widgets.dart'; // For CircularActionButton

// 1. Generic Tabbed Dialog (Handles the Yellow/Grey tabs)
class TabbedDialog extends StatefulWidget {
  final String tab1Label;
  final String tab2Label;
  final Widget tab1Content;
  final Widget tab2Content;
  final IconData icon;

  const TabbedDialog({
    super.key,
    required this.tab1Label,
    required this.tab2Label,
    required this.tab1Content,
    required this.tab2Content,
    required this.icon,
  });

  @override
  State<TabbedDialog> createState() => _TabbedDialogState();
}

class _TabbedDialogState extends State<TabbedDialog> {
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(15),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          // Main Card
          Container(
            width: double.infinity,
            // Remove top padding because tabs sit flush
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20), // Space for the floating icon
                
                // Tabs Row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      _buildTabButton(0, widget.tab1Label),
                      _buildTabButton(1, widget.tab2Label),
                    ],
                  ),
                ),
                
                // Content Area
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: _currentTab == 0 ? widget.tab1Content : widget.tab2Content,
                ),
              ],
            ),
          ),

          // Floating Icon (Top Left)
          Positioned(
            top: -15,
            left: 0,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: AppColors.primaryYellow,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, color: Colors.black54, size: 20),
              ),
            ),
          ),

          // Help Icon (Top Right)
          Positioned(
            top: -15,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: AppColors.primaryYellow,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.question_mark, color: Colors.black54, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(int index, String label) {
    final bool isActive = _currentTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _currentTab = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isActive ? AppColors.primaryYellow : const Color(0xFFE0E0E0),
            borderRadius: BorderRadius.only(
              topLeft: index == 0 ? const Radius.circular(10) : Radius.zero,
              topRight: index == 1 ? const Radius.circular(10) : Radius.zero,
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.black87 : Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// 2. Step Counter Widget (Screen 16)
class StepCounterWidget extends StatelessWidget {
  const StepCounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Circular Progress
        SizedBox(
          height: 180,
          width: 180,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: CircularProgressIndicator(
                  value: 0.15, // 1234 / 8000
                  strokeWidth: 8,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.black54),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text("today", style: TextStyle(fontSize: 10, color: Colors.grey)),
                  SizedBox(height: 4),
                  Text("1234 steps", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black54)),
                  Text("/8000", style: TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
            ],
          ),
        ),
        
        // Stats Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStat("123", "m"),
            _buildStat("123", "Kcal"),
          ],
        ),
        
        const SizedBox(height: 20),
        
        // Achievement Bar
        const Align(alignment: Alignment.centerLeft, child: Text("Achievement bonus", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))),
        const SizedBox(height: 5),
        Stack(
          children: [
            Container(height: 8, decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(4))),
            FractionallySizedBox(widthFactor: 0.6, child: Container(height: 8, decoration: BoxDecoration(color: AppColors.primaryYellow, borderRadius: BorderRadius.circular(4)))),
          ],
        ),
        
        const SizedBox(height: 20),
        
        // Grey Info Box
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: const Color(0xFFE0E0E0), borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Points to be earned today", style: TextStyle(fontSize: 10)),
              Text("100 points", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        
        const SizedBox(height: 20),
        const Text("<Convert to points>", style: TextStyle(fontSize: 12, color: Colors.grey)),
        const Text("123+100 → 223(+100)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        CircularActionButton(label: "convert", onTap: () {}, isWarning: false), // Reused widget
      ],
    );
  }

  Widget _buildStat(String val, String unit) {
    return Column(
      children: [
        Text(val, style: const TextStyle(fontSize: 20, color: Colors.black54)),
        Text(unit, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}

// 3. Points Conversion List (Screen 14)
class PointsListWidget extends StatelessWidget {
  const PointsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("<Current points>", style: TextStyle(fontSize: 12, color: Colors.grey)),
        const Text("12345", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black54)),
        const Divider(height: 30),
        const Text("Convert points to coins", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black54)),
        const SizedBox(height: 20),
        
        _buildConvertRow("10 -> 20"),
        _buildConvertRow("10 -> 20"),
        _buildConvertRow("10 -> 20"),
        _buildConvertRow("10 -> 20"),
      ],
    );
  }

  Widget _buildConvertRow(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: const TextStyle(fontSize: 16, color: Colors.black54)),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.primaryYellow,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text("convert", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black54)),
            ),
          ),
        ],
      ),
    );
  }
}

// 4. Love Years Widget (Screen 12)
class LoveYearsWidget extends StatelessWidget {
  const LoveYearsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text("<Current number of years of love>", style: TextStyle(fontSize: 10, color: Colors.grey)),
        const Text("Thank you for your love", style: TextStyle(fontSize: 10, color: Colors.grey)),
        const SizedBox(height: 10),
        const Text("12 years 1 month", style: TextStyle(fontSize: 28, color: Colors.black54)),
        const Divider(height: 40),
        const Text("<Next love years reward>", style: TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60, height: 60,
              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(8)),
            ),
            const SizedBox(width: 15),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("dummy text dummy text", style: TextStyle(fontSize: 12, color: Colors.black54)),
                Text("x1", style: TextStyle(fontSize: 12, color: Colors.black54)),
              ],
            )
          ],
        )
      ],
    );
  }
}

// 5. HP Info Widget (Screen 13)
class HPInfoWidget extends StatelessWidget {
  const HPInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text("<Current HP>", style: TextStyle(fontSize: 12, color: Colors.grey)),
        const Text("123/1000", style: TextStyle(fontSize: 32, color: Colors.black54)),
        const Divider(height: 40),
        const Text("<HP recovery>", style: TextStyle(fontSize: 12, color: Colors.grey)),
        const Text("123+100 → 223(+100)", style: TextStyle(fontSize: 16, color: Colors.black54)),
        const SizedBox(height: 20),
        
        // Using the common circular button but overriding size in a row or just mimicking style
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 150,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.primaryYellow,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Center(child: Text("Recover HP", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54))),
          ),
        ),
      ],
    );
  }
}




//calling the function in hud 


void _showStepsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const TabbedDialog(
        tab1Label: "number of steps",
        tab2Label: "points",
        icon: Icons.close,
        tab1Content: StepCounterWidget(),
        tab2Content: PointsListWidget(),
      ),
    );
  }

  void _showLoveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const TabbedDialog(
        tab1Label: "years of love",
        tab2Label: "HP information",
        icon: Icons.close,
        tab1Content: LoveYearsWidget(),
        tab2Content: HPInfoWidget(),
      ),
    );
  }