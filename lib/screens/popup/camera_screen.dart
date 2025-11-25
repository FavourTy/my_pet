import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';
import 'package:my_pet/widgets/tools.dart';


class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  // Simulated state
  int _selectedMode = 1; // 0=Auto, 1=Pro, 2=Zoom

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 1. Main Camera Preview (Simulated with 3D rabbit image)
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?q=80&w=2000',
              fit: BoxFit.cover,
            ),
          ),

          // 2. Top Bar (Modes)
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CameraModeChip(
                  label: "Auto lens",
                  isSelected: _selectedMode == 0,
                ),
                const SizedBox(width: 10),
                CameraModeChip(
                  label: "Free lens",
                  isSelected: _selectedMode == 1,
                ),
                const SizedBox(width: 10),
                CameraModeChip(
                  label: "Zoom lens",
                  isSelected: _selectedMode == 2,
                ),
              ],
            ),
          ),

          // 3. Right Side Controls
          Positioned(
            right: 20,
            top: 200,
            bottom: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CameraSideBtn(
                  label: "reset",
                  icon: Icons.refresh,
                  onTap: () {},
                ),
                CameraSideBtn(
                  label: "Observation",
                  icon: Icons.visibility,
                  onTap: () {},
                ),
                CameraSideBtn(
                  label: "height",
                  icon: Icons.height,
                  onTap: () {},
                ),
                CameraSideBtn(
                  label: "rotation",
                  icon: Icons.rotate_right,
                  onTap: () {},
                ),
              ],
            ),
          ),

          // 4. Zoom Indicator (0.5, 1, 2)
          Positioned(
            bottom: 140,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildZoomCircle("0.5"),
                const SizedBox(width: 10),
                _buildZoomCircle("1", isSelected: true),
                const SizedBox(width: 10),
                _buildZoomCircle("2"),
              ],
            ),
          ),

          // 5. Bottom Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 120,
            child: Container(
              color: Colors.black.withOpacity(0.3),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  // Gallery Preview
                  GestureDetector(
                    onTap: () => Navigator.pop(context), // Back button logic
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryYellow,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const Spacer(),

                  // Shutter Button
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                    ),
                  ),

                  const Spacer(),

                  // Inner Cam
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.cameraswitch, color: Colors.white, size: 30),
                      Text(
                        "Inner cam",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // 6. Photo/Video Switcher (Above Bottom Bar)
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildModeText("photo", true),
                const SizedBox(width: 20),
                _buildModeText("Video", false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildZoomCircle(String text, {bool isSelected = false}) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: isSelected
            ? Colors.black.withOpacity(0.7)
            : Colors.black.withOpacity(0.3),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }

  Widget _buildModeText(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryYellow : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
