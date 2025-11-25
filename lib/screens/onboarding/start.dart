import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'settings_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Background Image
          // Using a placeholder that looks like your cute 3D rabbit scene
          Image.network(
            'https://images.unsplash.com/photo-1629956208233-29ce0692f996?q=80&w=1000', 
            fit: BoxFit.cover,
            errorBuilder: (c, e, s) => Container(color: Colors.grey),
          ),
          
          // Dark overlay for text readability (optional, removed if image is perfect)
          Container(color: Colors.black.withOpacity(0.2)),

          // 2. Content
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                
                // Title Text
                const Text(
                  "Start screen",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [Shadow(blurRadius: 10, color: Colors.black45)],
                  ),
                ),
                
                const Spacer(flex: 2),

                // Start Button (Yellow Pill)
                GestureDetector(
                  onTap: () {
                    // Navigate to Game Room (Previous code)
                    // Navigator.push(context, MaterialPageRoute(builder: (_) => GameRoomScreen()));
                  },
                  child: Container(
                    width: 220,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: AppColors.primaryYellow,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "start",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),

          // 3. Settings Button (Bottom Right)
          Positioned(
            bottom: 40,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsScreen()),
                );
              },
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryYellow, // The yellow circle
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 2))
                      ],
                    ),
                    child: const Icon(Icons.settings, color: Colors.white, size: 24),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "settings",
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          
         
          const Positioned(
            bottom: 20,
            left: 20,
            child: Text(
              "company name",
              style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}