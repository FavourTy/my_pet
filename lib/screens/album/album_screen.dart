import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';
import 'package:my_pet/widgets/album.dart';
import 'package:my_pet/widgets/stats_components.dart';

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
                itemBuilder: (c, i) =>
                    PhotoTile(onTap: () => _navToList(context)),
              ),
            ),

            // 2. Utility Section
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "utility",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 10),
                  UtilityTile(
                    icon: Icons.videocam,
                    label: "video",
                    onTap: () {},
                  ),
                  UtilityTile(
                    icon: Icons.favorite,
                    label: "favorite",
                    onTap: () {},
                  ),
                  UtilityTile(
                    icon: Icons.delete,
                    label: "Recently deleted items",
                    onTap: () {},
                  ),
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
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: AppColors.primaryYellow,
                size: 16,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 140,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            itemCount: count,
            itemBuilder: (c, i) =>
                const MemoryTile(date: "2027/08/21", count: "10 photos"),
          ),
        ),
      ],
    );
  }

  void _navToList(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const FullPhotoListScreen()),
    );
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
                      decoration: const BoxDecoration(
                        color: AppColors.primaryYellow,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "Photo list",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Total 50 sheets/100 sheets",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 10,
                            ),
                          ),
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: _selectionMode
                            ? Colors.grey
                            : AppColors.primaryYellow,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        _selectionMode ? "Cancel" : "selection",
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                          if (isSel)
                            _selectedIndices.remove(index);
                          else
                            _selectedIndices.add(index);
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
                    Text(
                      "${_selectedIndices.length} selected",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(8),
      ),
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
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: isYellow ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
