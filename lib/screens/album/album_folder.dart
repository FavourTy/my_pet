import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/creation_widgets.dart'; // Reuse AlbumFolderCard

class AlbumFoldersScreen extends StatelessWidget {
  const AlbumFoldersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF454545),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      backgroundColor: AppColors.primaryYellow,
                      radius: 15,
                      child: Icon(Icons.arrow_back, size: 16, color: Colors.black54),
                    ),
                  ),
                  const Expanded(
                    child: Center(child: Text("album", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16))),
                  ),
                  const SizedBox(width: 30), // Balance header
                ],
              ),
            ),

            // Actions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildActionTile(Icons.favorite, "favorite"),
                  const SizedBox(height: 10),
                  _buildActionTile(Icons.delete, "Recently deleted items"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Sort Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("album", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  Row(
                    children: const [
                      Icon(Icons.sort, color: Colors.white70, size: 16),
                      SizedBox(width: 5),
                      Text("Sort by title", style: TextStyle(color: Colors.white70, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Grid
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(20),
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 15,
                childAspectRatio: 0.8,
                children: const [
                  AlbumFolderCard(title: "new album", isNew: true),
                  AlbumFolderCard(title: "25 years Korea trip", count: "40"),
                  AlbumFolderCard(title: "25 years Korea trip", count: "40"),
                  AlbumFolderCard(title: "25 years Korea trip", count: "40"),
                  AlbumFolderCard(title: "25 years Korea trip", count: "40"),
                  AlbumFolderCard(title: "25 years Korea trip", count: "40"),
                ],
              ),
            ),

            // Bottom Bar
            Container(
              height: 60,
              color: Colors.black26,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.upload, color: Colors.white),
                  Icon(Icons.favorite_border, color: Colors.white),
                  Icon(Icons.info_outline, color: Colors.white),
                  Icon(Icons.delete, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionTile(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 18),
          const SizedBox(width: 10),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}