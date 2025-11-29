import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/bulletin_widgets.dart'; // Reusing PostCard
import '../widgets/common_widgets.dart'; // Reusing Buttons

// ============================================================================
// SCREEN 7: FEED WITH CONTEXT
// ============================================================================
class BulletinFeedDetail extends StatelessWidget {
  const BulletinFeedDetail({super.key});

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
                  const Expanded(child: Center(child: Text("Looking for pairs", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)))),
                  const CircleAvatar(backgroundColor: AppColors.primaryYellow, radius: 15, child: Text("AA", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black54))),
                  const SizedBox(width: 10),
                  const Icon(Icons.search, color: Colors.black54),
                ],
              ),
            ),

            // Feed
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  // Deleted Comment Placeholder
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, width: 0.2))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("This comment has been deleted.", style: TextStyle(fontSize: 12, color: Colors.grey)),
                        Icon(Icons.delete_outline, size: 16, color: Colors.grey),
                      ],
                    ),
                  ),
                  PostCard(name: "xxxx", time: "2027/10/01 (Mon) 12:09", text: "dummy text dummy text dummy text dummy text\ndummy text dummy text", hasImages: true, onMoreTap: () => _showDeleteDialog(context)),
                  PostCard(name: "xxxx", time: "2027/10/01 (Mon) 12:09", text: "dummy text dummy text dummy text dummy text", hasImages: false, onMoreTap: () {}),
                ],
              ),
            ),
            
            // Bottom Bar
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => _showCommentInput(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      decoration: BoxDecoration(color: AppColors.primaryYellow.withOpacity(0.5), borderRadius: BorderRadius.circular(20)),
                      child: const Text("Leave a comment", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 12)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const CircleAvatar(backgroundColor: AppColors.primaryYellow, radius: 18, child: Icon(Icons.keyboard_arrow_down, color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- SCREEN 8: DELETE DIALOG ---
  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Permanently remove from the bulletin board.", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.check_box_outline_blank, size: 16, color: Colors.grey),
                      SizedBox(width: 5),
                      Text("Delete all comments at once", style: TextStyle(fontSize: 10)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(child: _buildBtn("No", false, () => Navigator.pop(context))),
                      const SizedBox(width: 10),
                      Expanded(child: _buildBtn("yes", true, () => Navigator.pop(context))),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: -15, left: -5,
              child: const CircleAvatar(backgroundColor: AppColors.primaryYellow, child: Icon(Icons.close, size: 20, color: Colors.black54)),
            ),
          ],
        ),
      ),
    );
  }

  // --- SCREEN 11: COMMENT INPUT ---
  void _showCommentInput(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // For keyboard
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: const Color(0xFFD9D9D9),
              alignment: Alignment.center,
              child: const Text("enter a comment", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Up to 250 characters", style: TextStyle(color: Colors.grey, fontSize: 10)),
                  const SizedBox(height: 100), // Input area placeholder
                  Row(
                    children: [
                      Container(width: 2, height: 20, color: AppColors.primaryYellow), // Cursor simulation
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Center(child: _buildBtn("Post", true, () => _showDraftDialog(context))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- SCREEN 12: SAVE DRAFT DIALOG ---
  void _showDraftDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("This page has not yet been posted\nWould you like to save your comment?", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(child: _buildBtn("destroy", false, () => Navigator.pop(context))),
                      const SizedBox(width: 10),
                      Expanded(child: _buildBtn("save", true, () => _showSavedCommentDialog(context))),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: -15, left: -5,
              child: const CircleAvatar(backgroundColor: AppColors.primaryYellow, child: Icon(Icons.close, size: 20, color: Colors.black54)),
            ),
          ],
        ),
      ),
    );
  }

  // --- SCREEN 9: SAVED COMMENT FOUND ---
  void _showSavedCommentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("There is a comment you saved last time\nWould you like to meet again with this content?", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(8)),
                    child: const Text("dummy text dummy text dummy text\ntext dummy text dummy text", style: TextStyle(fontSize: 10, color: Colors.black54)),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(child: _buildBtn("No", false, () => Navigator.pop(context))),
                      const SizedBox(width: 10),
                      Expanded(child: _buildBtn("yes", true, () => Navigator.pop(context))),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: -15, left: -5,
              child: const CircleAvatar(backgroundColor: AppColors.primaryYellow, child: Icon(Icons.close, size: 20, color: Colors.black54)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBtn(String label, bool isYellow, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isYellow ? AppColors.primaryYellow : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child: Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: isYellow ? Colors.black54 : Colors.grey[600]))),
      ),
    );
  }
}