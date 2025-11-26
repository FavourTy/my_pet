import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

// 1. Simple Photo Tile (Square)
class PhotoTile extends StatelessWidget {
  final bool isSelected;
  final bool showCheck;
  final VoidCallback onTap;

  const PhotoTile({
    super.key,
    this.isSelected = false,
    this.showCheck = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              image: const DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1586023492125-27b2c045efd7?q=80&w=400'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (showCheck)
            Positioned(
              bottom: 5,
              right: 5,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryYellow : Colors.black26,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
                child: const Icon(Icons.check, size: 12, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}

// 2. Utility List Tile (Dark Grey Button)
class UtilityTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const UtilityTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 15),
            Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

// 3. Memory/Album Horizontal Item
class MemoryTile extends StatelessWidget {
  final String date;
  final String count;

  const MemoryTile({super.key, required this.date, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1586023492125-27b2c045efd7?q=80&w=400'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(date, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10)),
          Text(count, style: const TextStyle(color: Colors.white70, fontSize: 8)),
        ],
      ),
    );
  }
}

// 4. Reminder List Tile (Yellow outline circle)
class ReminderTile extends StatelessWidget {
  final String time;
  final String repeat;
  final String text;
  final bool isChecked;

  const ReminderTile({
    super.key,
    required this.time,
    required this.repeat,
    required this.text,
    this.isChecked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Check Circle
          Container(
            margin: const EdgeInsets.only(top: 5),
            width: 20, height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryYellow, width: 1.5),
              color: isChecked ? AppColors.primaryYellow : Colors.transparent,
            ),
          ),
          const SizedBox(width: 15),
          
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 12, color: AppColors.primaryYellow),
                    const SizedBox(width: 4),
                    Text("$time $repeat", style: const TextStyle(color: AppColors.primaryYellow, fontSize: 10)),
                  ],
                ),
                const SizedBox(height: 5),
                Text(text, style: const TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),
          
          // Heart Icon
          const Icon(Icons.favorite_border, color: AppColors.primaryYellow, size: 16),
        ],
      ),
    );
  }
}
```eof

### 2. Album Screens (`lib/screens/album_screens.dart`)
Handles Screen 22 (Album Home) and Screen 24/25 (Photo List).

```dart:Album Screens:lib/screens/album_screens.dart
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/stats_widgets.dart'; // Reusing DarkStatsScaffold
import '../widgets/album_widgets.dart';

class AlbumHomeScreen extends StatelessWidget {
  const AlbumHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DarkStatsScaffold(
      title: "Photo list",
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Top Photo Grid (Preview)
            SizedBox(
              height: 200,
              child: GridView.builder(
                padding: const EdgeInsets.all(0),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemCount: 8,
                itemBuilder: (c, i) => PhotoTile(onTap: () => _navToList(context)),
              ),
            ),
            
            // 2. Utility Section
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("utility", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                  const SizedBox(height: 10),
                  UtilityTile(icon: Icons.videocam, label: "video", onTap: () {}),
                  UtilityTile(icon: Icons.favorite, label: "favorite", onTap: () {}),
                  UtilityTile(icon: Icons.delete, label: "Recently deleted items", onTap: () {}),
                ],
              ),
            ),

            // 3. Memory Section
            _buildHorizontalSection("memory", 4),
            const SizedBox(height: 20),
            
            // 4. Album Section
            _buildHorizontalSection("album", 4),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalSection(String title, int count) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10),
          child: Row(
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
              const Icon(Icons.chevron_right, color: AppColors.primaryYellow, size: 16),
            ],
          ),
        ),
        SizedBox(
          height: 140,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            itemCount: count,
            itemBuilder: (c, i) => const MemoryTile(date: "2027/08/21", count: "10 photos"),
          ),
        ),
      ],
    );
  }

  void _navToList(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const FullPhotoListScreen()));
  }
}

// --- SCREEN 24/25: FULL PHOTO LIST ---
class FullPhotoListScreen extends StatefulWidget {
  const FullPhotoListScreen({super.key});

  @override
  State<FullPhotoListScreen> createState() => _FullPhotoListScreenState();
}

class _FullPhotoListScreenState extends State<FullPhotoListScreen> {
  bool _selectionMode = false;
  final Set<int> _selectedIndices = {};

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
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(color: AppColors.primaryYellow, shape: BoxShape.circle),
                      child: const Icon(Icons.arrow_back, size: 16, color: Colors.black54),
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Column(
                        children: [
                          Text("Photo list", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          Text("Total 50 sheets/100 sheets", style: TextStyle(color: Colors.white70, fontSize: 10)),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      _selectionMode = !_selectionMode;
                      _selectedIndices.clear();
                    }),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: _selectionMode ? Colors.grey : AppColors.primaryYellow,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(_selectionMode ? "Cancel" : "selection", style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),

            // Grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(2),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemCount: 24,
                itemBuilder: (context, index) {
                  final isSel = _selectedIndices.contains(index);
                  return PhotoTile(
                    showCheck: _selectionMode,
                    isSelected: isSel,
                    onTap: () {
                      if (_selectionMode) {
                        setState(() {
                          if (isSel) _selectedIndices.remove(index);
                          else _selectedIndices.add(index);
                        });
                      }
                    },
                  );
                },
              ),
            ),

            // Bottom Bar
            if (_selectionMode)
              Container(
                height: 60,
                color: Colors.black26,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.upload, color: Colors.white),
                    const Icon(Icons.favorite_border, color: Colors.white),
                    const Icon(Icons.save_alt, color: Colors.white),
                    Text("${_selectedIndices.length} selected", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    const Icon(Icons.delete, color: Colors.white),
                  ],
                ),
              )
            else
              Container(
                height: 60,
                color: Colors.black26,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildBottomIcon(Icons.info_outline),
                    _buildBottomPill("By year"),
                    _buildBottomPill("By month"),
                    _buildBottomPill("favorite"),
                    _buildBottomPill("all", isYellow: true),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(8)),
      child: Icon(icon, color: Colors.white, size: 16),
    );
  }

  Widget _buildBottomPill(String text, {bool isYellow = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isYellow ? AppColors.primaryYellow : Colors.white24,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: isYellow ? Colors.black : Colors.white)),
    );
  }
}
```eof

### 3. Reminder Screens (`lib/screens/reminder_screens.dart`)
Handles Screen 27 & 28 (Reminder/Alarm list with the custom bottom bar).

```dart:Reminder Screens:lib/screens/reminder_screens.dart
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/stats_widgets.dart'; // Reusing DarkStatsScaffold
import '../widgets/dialog_widgets.dart'; // For TabbedDialog style
import '../widgets/alarm_widgets.dart';  // Reuse alarm styles
import '../widgets/album_widgets.dart'; // Reuse ReminderTile

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
