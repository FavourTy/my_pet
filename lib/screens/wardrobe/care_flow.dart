import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';


// SCREEN 21: ADVANCED CARE MENU
class AdvancedCareMenu extends StatelessWidget {
  const AdvancedCareMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const CircleAvatar(backgroundColor: AppColors.primaryYellow, radius: 15, child: Icon(Icons.arrow_back, size: 16, color: Colors.white)),
              ),
              const Text("Take care", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54)),
              Row(
                children: [
                  Container(
                    width: 30, height: 30,
                    decoration: const BoxDecoration(color: Color(0xFFD9D9D9), shape: BoxShape.circle), // Square Icon
                  ),
                  const SizedBox(width: 10),
                  const CircleAvatar(backgroundColor: AppColors.primaryYellow, radius: 15, child: Icon(Icons.question_mark, size: 16, color: Colors.white)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Info Bars
          _buildInfoBar("Recommended nutrient", "of items 3 times a day"),
          _buildInfoBar("Stomach", "Full"),
          _buildInfoBar("Smell", "Good"),
          
          const SizedBox(height: 15),
          
          // Trimming Button
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryYellow),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(child: Text("go for trimming", style: TextStyle(fontSize: 12, color: Colors.black54))),
          ),
          
          const SizedBox(height: 20),

          // Action Grid
          Row(
            children: [
              Expanded(child: _buildCareActionCard("Change and feed water\nclean the dishes", "water")),
              const SizedBox(width: 15),
              Expanded(child: _buildCareActionCard("Replacing the toilet seat\nclean the sheets", "sheets", onTap: () => _openCleaning(context))),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(child: _buildCareActionCard("brushing", "brush")),
              const SizedBox(width: 15),
              Expanded(child: _buildCareActionCard("Tooth brushing", "tooth")),
            ],
          ),
        ],
      ),
    );
  }
  
  void _openCleaning(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const ToiletCleaningScreen()));
  }

  Widget _buildInfoBar(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          SizedBox(width: 120, child: Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey))),
          Expanded(
            child: Container(
              height: 10,
              decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(5)),
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(widthFactor: 0.7, child: Container(decoration: BoxDecoration(color: Colors.grey[400], borderRadius: BorderRadius.circular(5)))),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCareActionCard(String title, String type, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Positioned(
                top: -10, right: -5,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(color: AppColors.primaryYellow, shape: BoxShape.circle),
                  child: const Text("!", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
              const Positioned(
                top: 5, left: 5,
                child: Text("Recommended number of times: O is a day", style: TextStyle(fontSize: 6, color: Colors.black54)),
              )
            ],
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            decoration: BoxDecoration(color: AppColors.primaryYellow.withOpacity(0.5), borderRadius: BorderRadius.circular(15)),
            child: Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

// SCREEN 22: TOILET CLEANING SCREEN
class ToiletCleaningScreen extends StatelessWidget {
  const ToiletCleaningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1), // Light cream
      body: Stack(
        children: [
          // 1. Close Button
          Positioned(
            top: 50, left: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.close, size: 24, color: Colors.black54),
            ),
          ),
          
          // 2. Tool Selection (Right Side)
          Positioned(
            top: 100, right: 20,
            child: Container(
              width: 60,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFB2DFDB), // Mint green
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.amber,
                    child: Icon(Icons.soap, color: Colors.white, size: 20),
                  ),
                  const SizedBox(height: 20),
                  Transform.rotate(
                    angle: -0.5,
                    child: const Icon(Icons.shower, size: 40, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          // 3. The Tray (Center)
          Center(
            child: Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey[300]!, width: 2),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: const Offset(0, 5))],
              ),
            ),
          ),
          
          // 4. Hint Hand (Optional)
          Positioned(
            right: 50,
            bottom: 300,
            child: Icon(Icons.back_hand, color: Colors.orange[200], size: 40),
          ),
        ],
      ),
    );
  }
}