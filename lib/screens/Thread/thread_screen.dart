import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';

// Assuming you have the AppColors class from the previous step.
// If not, ensure you include the AppColors class defined previously.

class ThreadScreen extends StatefulWidget {
  const ThreadScreen({Key? key}) : super(key: key);

  @override
  _ThreadScreenState createState() => _ThreadScreenState();
}

class _ThreadScreenState extends State<ThreadScreen> {
  // 0 = Reply (Screen 27), 1 = Bookmark (Screen 28)
  int _selectedTab = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // --- Header (Same style as Bulletin Board) ---
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[200], // Light grey header bg
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: AppColors.primaryYellow,
            child: const Icon(Icons.arrow_back, color: Colors.black54, size: 20),
          ),
        ),
        title: const Text(
          "thread",
          style: TextStyle(
            color: Colors.grey, 
            fontSize: 16, 
            fontWeight: FontWeight.bold, 
            letterSpacing: 1.2
          ),
        ),
        centerTitle: true,
        actions: [
          CircleAvatar(
            backgroundColor: AppColors.primaryYellow,
            radius: 15,
            child: const Text("AA", style: TextStyle(fontSize: 10, color: Colors.black54)),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.search, color: Colors.grey, size: 28),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          // --- Tabs Section ---
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: Colors.white,
            child: Row(
              children: [
                _buildTab("Reply", 0),
                const SizedBox(width: 10), // Small gap between tabs
                _buildTab("bookmark", 1),
              ],
            ),
          ),

          const Divider(height: 1),

          // --- List Content ---
          Expanded(
            child: Stack(
              children: [
                ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: 2, // Showing 2 items as per screenshot
                  separatorBuilder: (ctx, i) => const Divider(height: 30),
                  itemBuilder: (context, index) {
                    return _buildThreadItem(index);
                  },
                ),
                
                // --- Footer "Reload" & FAB ---
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      const Text("Loaded the latest comments", 
                        style: TextStyle(fontSize: 10, color: Colors.grey)),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 12, height: 12,
                            decoration: const BoxDecoration(
                              color: AppColors.primaryYellow,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Text("reload", style: TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: CircleAvatar(
                    backgroundColor: AppColors.primaryYellow,
                    radius: 20,
                    child: const Icon(Icons.arrow_drop_down, color: Colors.white, size: 30),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _buildTab(String text, int index) {
    bool isSelected = _selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTab = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryYellow : Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? AppColors.primaryBrown : Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildThreadItem(int index) {
    // In Screen 28 (Bookmark tab), the hearts are yellow (filled).
    // In Screen 27 (Reply tab), the hearts are outlined.
    bool isBookmarked = _selectedTab == 1; 

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header: Avatar + Name + Heart
        Row(
          children: [
            Container(
              width: 35, height: 35,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                margin: const EdgeInsets.all(2),
                color: Colors.grey[300], // Inner fill
              ),
            ),
            const SizedBox(width: 8),
            Container(
               width: 20, height: 20,
               decoration: BoxDecoration(
                 color: Colors.grey[300],
                 borderRadius: BorderRadius.circular(4)
               ),
            ),
            const SizedBox(width: 8),
            const Text("xxxx", style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold)),
            const Spacer(),
            Icon(
              isBookmarked ? Icons.favorite : Icons.favorite_border,
              color: isBookmarked ? AppColors.primaryYellow : Colors.grey,
              size: 20,
            ),
          ],
        ),
        
        const SizedBox(height: 10),
        
        // Body Text
        const Text(
          "dummy text dummy text dummy text dummy text\ndummy text",
          style: TextStyle(fontSize: 12, color: AppColors.textDark),
        ),
        
        const SizedBox(height: 10),
        
        // Image Placeholders
        Row(
          children: [
            Container(width: 50, height: 50, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(8))),
            const SizedBox(width: 8),
            Container(width: 50, height: 50, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(8))),
          ],
        ),
        
        const SizedBox(height: 10),
        
        // Footer: Date + Check Button
        Row(
          children: [
            const Text("2021/10/01 (Mon) 12:00", style: TextStyle(fontSize: 10, color: Colors.grey)),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.primaryYellow,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "Check",
                style: TextStyle(
                  color: AppColors.primaryBrown,
                  fontWeight: FontWeight.bold,
                  fontSize: 11
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}