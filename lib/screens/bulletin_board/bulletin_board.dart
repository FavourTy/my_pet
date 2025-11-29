import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';
import 'package:my_pet/widgets/bulletin.dart';
// For PopupHeader/CircleBtn if needed

// ============================================================================
// SCREEN 1: BULLETIN BOARD CATEGORY LIST
// ============================================================================
class BulletinBoardScreen extends StatelessWidget {
  const BulletinBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              color: const Color(0xFFD9D9D9),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(backgroundColor: AppColors.primaryYellow, radius: 15, child: Icon(Icons.arrow_back, size: 16, color: Colors.black54)),
                  ),
                  const Expanded(child: Center(child: Text("bulletin board", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)))),
                  const SizedBox(width: 30),
                ],
              ),
            ),

            // List
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  BulletinCategoryTile(title: "Pair work 2025", subtitle: "Begins with love and devotion to...", onTap: () {}, isExpanded: true),
                  BulletinCategoryTile(title: "Looking for pairs", subtitle: "Looking for a partner for 2025! lovers", onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PostFeedScreen()))),
                  BulletinCategoryTile(title: "Anything (edit)", subtitle: "Chat about anything (edit)", onTap: () {}),
                  
                  // Divider Section
                  Container(padding: const EdgeInsets.all(15), color: const Color(0xFFEEEEEE), child: const Text("pet ribs", style: TextStyle(fontSize: 10, color: Colors.black54))),
                  
                  BulletinCategoryTile(title: "My shop", subtitle: "", onTap: () {}),
                  BulletinCategoryTile(title: "Looking for pairs", subtitle: "", onTap: () {}),
                  
                  const SizedBox(height: 20),
                  Container(padding: const EdgeInsets.all(15), color: const Color(0xFFEEEEEE), child: const Text("tell me", style: TextStyle(fontSize: 10, color: Colors.black54))),
                  BulletinCategoryTile(title: "Looking for pairs", subtitle: "", onTap: () {}),
                  
                  const SizedBox(height: 20),
                  Container(padding: const EdgeInsets.all(15), color: const Color(0xFFEEEEEE), child: const Text("Recruiting friends", style: TextStyle(fontSize: 10, color: Colors.black54))),
                  BulletinCategoryTile(title: "Looking for pairs", subtitle: "", onTap: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// SCREEN 2, 3, 4, 5, 6: POST FEED & INTERACTIONS
// ============================================================================
class PostFeedScreen extends StatefulWidget {
  const PostFeedScreen({super.key});

  @override
  State<PostFeedScreen> createState() => _PostFeedScreenState();
}

class _PostFeedScreenState extends State<PostFeedScreen> {
  // State for UI toggles
  bool _showSearch = false; // Screen 4
  bool _showFontSize = false; // Screen 3

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Header (Dynamic based on state)
                Container(
                  color: const Color(0xFFD9D9D9),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: _showSearch 
                    ? Row(
                        children: [
                          Expanded(child: Container(height: 36, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)))),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () => setState(() => _showSearch = false),
                            child: const CircleAvatar(backgroundColor: AppColors.primaryYellow, radius: 14, child: Icon(Icons.close, size: 14, color: Colors.black54)),
                          )
                        ],
                      )
                    : Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const CircleAvatar(backgroundColor: AppColors.primaryYellow, radius: 15, child: Icon(Icons.arrow_back, size: 16, color: Colors.black54)),
                          ),
                          const Expanded(child: Center(child: Text("Looking for pairs", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)))),
                          GestureDetector(
                            onTap: () => setState(() => _showFontSize = !_showFontSize),
                            child: const CircleAvatar(backgroundColor: AppColors.primaryYellow, radius: 14, child: Icon(Icons.text_fields, size: 14, color: Colors.black54)),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () => setState(() => _showSearch = true),
                            child: const Icon(Icons.search, color: Colors.black54),
                          ),
                        ],
                      ),
                ),

                // Font Size Slider (Screen 3)
                if (_showFontSize)
                  Container(
                    height: 120,
                    width: 250,
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black54, // Dark transparent overlay style
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Change font size", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text("A", style: TextStyle(color: Colors.white, fontSize: 10)),
                            Expanded(
                              child: SliderTheme(
                                data: SliderThemeData(activeTrackColor: Colors.white, inactiveTrackColor: Colors.grey, thumbColor: Colors.white, trackHeight: 1, thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6)),
                                child: Slider(value: 0.2, onChanged: (v){}),
                              ),
                            ),
                            const Text("A", style: TextStyle(color: Colors.white, fontSize: 16)),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                          decoration: BoxDecoration(color: AppColors.primaryYellow, borderRadius: BorderRadius.circular(20)),
                          child: const Text("change", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black54)),
                        ),
                      ],
                    ),
                  ),

                // Feed List
                Expanded(
                  child: ListView(
                    children: [
                      PostCard(name: "xxxx", time: "2027/10/01 (Mon) 12:08", text: "dummy text dummy text dummy text dummy text\ndummy text dummy text", hasImages: false, onMoreTap: () => _showContextMenu(context)),
                      PostCard(name: "xxxx", time: "2027/10/01 (Mon) 12:09", text: "dummy text dummy text dummy text dummy text", hasImages: true, isEdited: true, onMoreTap: () => _showContextMenu(context)),
                      PostCard(name: "xxxx", time: "2027/10/01 (Mon) 12:09", text: "dummy text dummy text dummy text dummy text", hasImages: false, onMoreTap: () => _showContextMenu(context)),
                      // "Loaded Latest" toast (Screen 6)
                      const SizedBox(height: 10),
                      const Center(child: RefreshFab()),
                      const SizedBox(height: 80), // Space for bottom button
                    ],
                  ),
                ),
              ],
            ),

            // Bottom "Leave a comment" Button
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: CommentButton(onTap: () {}),
              ),
            ),
            
            // Bottom Right Scroll Down Button
            Positioned(
              bottom: 20,
              right: 20,
              child: const CircleAvatar(backgroundColor: AppColors.primaryYellow, radius: 20, child: Icon(Icons.keyboard_arrow_down, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  // --- SCREEN 5: CONTEXT MENU ---
  void _showContextMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Close Button
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const CircleAvatar(backgroundColor: AppColors.primaryYellow, radius: 12, child: Icon(Icons.close, size: 14, color: Colors.black54)),
              ),
            ),
            const Text("Others", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
            const SizedBox(height: 20),
            
            _buildContextItem(Icons.copy, "Copy comment"),
            const SizedBox(height: 15),
            _buildContextItem(Icons.warning_amber, "Report comment"),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildContextItem(IconData icon, String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 10),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54)),
      ],
    );
  }
}