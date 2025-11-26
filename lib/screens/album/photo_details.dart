import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';
import 'package:my_pet/widgets/album.dart';
import 'package:my_pet/widgets/details.dart';
import 'package:my_pet/widgets/stats_components.dart';


class AddPhotoScreen extends StatelessWidget {
  const AddPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DarkStatsScaffold(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Input
            const Text("add title", style: TextStyle(color: Colors.white70, fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            
            // Photo Select
            const Text("add photo", style: TextStyle(color: Colors.white70, fontSize: 12)),
            const SizedBox(height: 10),
            AddPhotoBtn(onTap: () => _showPhotoPicker(context)),
          ],
        ),
      ),
    );
  }

  // This simulates navigating to Screen 34 (The Grid Picker)
  void _showPhotoPicker(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const PhotoPickerScreen()));
  }
}

// ============================================================================
// SCREEN 34: PHOTO PICKER GRID (Year/Month Sort)
// ============================================================================
class PhotoPickerScreen extends StatefulWidget {
  const PhotoPickerScreen({super.key});

  @override
  State<PhotoPickerScreen> createState() => _PhotoPickerScreenState();
}

class _PhotoPickerScreenState extends State<PhotoPickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF454545),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(backgroundColor: AppColors.primaryYellow, radius: 15, child: Icon(Icons.arrow_back, size: 16, color: Colors.black54)),
                  ),
                  const SizedBox(width: 10),
                  const Text("3 pieces", style: TextStyle(color: Colors.white, fontSize: 16)),
                  const Spacer(),
                  const Text("all photos", style: TextStyle(color: Colors.white, fontSize: 12)),
                  const SizedBox(width: 20),
                  const Text("Add", style: TextStyle(color: AppColors.primaryYellow, fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            // Year/Month Header
            Container(
              padding: const EdgeInsets.all(15),
              color: Colors.white10,
              child: Row(
                children: [
                  Container(
                    width: 20, height: 20,
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.primaryYellow)),
                  ),
                  const SizedBox(width: 10),
                  const Text("2027/08", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
            ),

            // Grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, mainAxisSpacing: 2, crossAxisSpacing: 2),
                itemCount: 20,
                itemBuilder: (c, i) => PhotoTile(
                  onTap: () {},
                  showCheck: true,
                  isSelected: i % 3 == 0, // Dummy selection
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// SCREEN 35: PHOTO DETAIL (25 Years Korea Trip)
// ============================================================================
class PhotoDetailScreen extends StatelessWidget {
  const PhotoDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DarkStatsScaffold(
      // Custom Header Content
      child: Column(
        children: [
          // Title & Meta
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("25 years Korea trip", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                const Text("2027/08", style: TextStyle(color: Colors.white70, fontSize: 12)),
                const SizedBox(height: 15),
                
                // Action Row
                Row(
                  children: [
                    ActionPill(icon: Icons.image, label: "add photo", onTap: () {}),
                    const SizedBox(width: 10),
                    ActionPill(icon: Icons.link, label: "", onTap: () {}), // Link Icon
                    const SizedBox(width: 10),
                    const CircleAvatar(radius: 15, backgroundColor: Colors.grey), // User Avatar 1
                    const SizedBox(width: 5),
                    const CircleAvatar(radius: 15, backgroundColor: Colors.transparent, child: Icon(Icons.add_circle_outline, color: Colors.white)), // Add User
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Masonry Layout (Simulated with Row of Columns)
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(flex: 2, child: _buildImage()),
                      Expanded(flex: 1, child: _buildImage()),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(flex: 1, child: _buildImage()),
                      Expanded(flex: 2, child: Container(color: const Color(0xFF454545))), // Empty space
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Bottom Toggle
          Container(
            margin: const EdgeInsets.all(20),
            height: 30,
            width: 200,
            decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Expanded(child: Container(decoration: BoxDecoration(color: AppColors.primaryYellow, borderRadius: BorderRadius.circular(15)), child: const Center(child: Text("photo", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))))),
                const Expanded(child: Center(child: Text("Video", style: TextStyle(fontSize: 10, color: Colors.white)))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      margin: const EdgeInsets.all(1),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1586023492125-27b2c045efd7?q=80&w=400'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// ============================================================================
// SCREEN 36: FILTER / SEARCH LIST
// ============================================================================
class FilterListScreen extends StatelessWidget {
  const FilterListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DarkStatsScaffold(
      child: Column(
        children: [
          // 1. Search Bar Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Expanded(flex: 2, child: YellowSearchBar()),
                const SizedBox(width: 10),
                const Expanded(flex: 1, child: DropdownPill(label: "all")),
              ],
            ),
          ),
          const SizedBox(height: 15),

          // 2. Filter Tags Horizontal List
          SizedBox(
            height: 30,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildFilterTag("everything", false),
                _buildFilterTag("basic care", true),
                _buildFilterTag("Discipline method", false),
                _buildFilterTag("health", false),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // 3. Carousel Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Frequency of feeding/type of feeding", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text("Frequency", style: TextStyle(color: Colors.white, fontSize: 10)),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Dots Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.circle, size: 8, color: AppColors.primaryYellow),
              const SizedBox(width: 4),
              Icon(Icons.circle, size: 8, color: Colors.grey[700]),
              const SizedBox(width: 4),
              Icon(Icons.circle, size: 8, color: Colors.grey[700]),
            ],
          ),
          
          const SizedBox(height: 20),
          // Sort Row
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.sort, color: AppColors.primaryYellow, size: 14),
                  SizedBox(width: 4),
                  Text("Sort by title", style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),

          // 4. List Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: const [
                LockedContentTile(
                  title: "Frequency of feeding/type\nof feeding", 
                  subtitle: "",
                  isLocked: false,
                ),
                LockedContentTile(
                  title: "Frequency of feeding/type\nof feeding", 
                  subtitle: "Article supervised by >>",
                  isLocked: true,
                  lockText: "Opening in 5 days",
                ),
                LockedContentTile(
                  title: "Frequency of feeding/type\nof feeding", 
                  subtitle: "",
                  isLocked: true,
                  lockText: "++Unlocked at PT",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTag(String text, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryYellow.withOpacity(0.8) : Colors.white24,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(text, style: TextStyle(fontSize: 10, color: isActive ? Colors.black : Colors.grey, fontWeight: FontWeight.bold)),
    );
  }
}