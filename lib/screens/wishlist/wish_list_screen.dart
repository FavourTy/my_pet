import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  int _currentTab = 1; // 0: In Use, 1: Wish List, 2: Duplicate
  bool _isSelectionMode = false; // Toggles Screen 23 look

  // Tabs Configuration
  final List<String> _tabs = ["in use", "wish list", "Duplicate"];
  final List<String> _filters = [
    "everything",
    "room",
    "Room wear",
    "Going out",
  ];
  int _selectedFilter = 0;

  @override
  Widget build(BuildContext context) {
    // Determine screen mode based on tab
    bool isDuplicateTab = _currentTab == 2;
    // Screen 23 is visually triggered by selection mode in Wishlist
    bool showCheckmarks = _currentTab == 1 && _isSelectionMode;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // --- Header (Reused from previous screens) ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      backgroundColor: AppColors.primaryYellow,
                      radius: 15,
                      child: Icon(Icons.close, size: 16, color: Colors.black54),
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "wish list",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const CircleAvatar(
                    backgroundColor: AppColors.primaryYellow,
                    radius: 15,
                    child: Icon(
                      Icons.help_outline,
                      size: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),

            // --- Entry Procedure Button ---
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16, bottom: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryYellow,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.tune, size: 14, color: Colors.black54),
                      SizedBox(width: 4),
                      Text(
                        "Entry procedure",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // --- Custom Tabs ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: List.generate(_tabs.length, (index) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentTab = index;
                          // Reset selection mode when changing tabs
                          _isSelectionMode = (index == 1 && _isSelectionMode);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: _currentTab == index
                              ? AppColors.primaryYellow
                              : Colors.grey[300],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          _tabs[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: _currentTab == index
                                ? Colors.black54
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            // --- Main Content Area ---
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  // In the screenshot, the white card flows down from the tabs
                  border: Border(
                    top: BorderSide(color: Colors.white, width: 0),
                  ),
                ),
                child: Column(
                  children: [
                    // --- Screen 24 Specific: Public/Private Buttons ---
                    if (isDuplicateTab) ...[
                      Row(
                        children: [
                          Expanded(
                            child: _pillBtn("make everything public", true),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: _pillBtn("make everything private", true),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],

                    // --- Screen 23 Trigger (Hidden feature to toggle checkmarks) ---
                    if (_currentTab == 1)
                      GestureDetector(
                        onTap: () => setState(
                          () => _isSelectionMode = !_isSelectionMode,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            _isSelectionMode
                                ? "Exit Selection Mode"
                                : "Tap here to simulate Screen 23 (Selection)",
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),

                    // --- Filters ---
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(_filters.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: FilterChip(
                              label: Text(_filters[index]),
                              selected: _selectedFilter == index,
                              onSelected: (val) =>
                                  setState(() => _selectedFilter = index),
                              backgroundColor: Colors.grey[300],
                              selectedColor: AppColors.primaryYellow,
                              labelStyle: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 0,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // --- Grid ---
                    Expanded(
                      child: GridView.builder(
                        itemCount: 20,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5, // 5 columns as per screenshot
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 0.8,
                            ),
                        itemBuilder: (context, index) {
                          return _buildGridItem(
                            index,
                            showCheckmarks,
                            isDuplicateTab,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Grid Item Builder ---
  Widget _buildGridItem(int index, bool showCheckmarks, bool isDuplicateTab) {
    // Screen 24: Randomize public/private for demo
    bool isPublic = index % 2 == 0;

    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              // 1. The Clothes Image Background
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF9C4), // Light yellow bg
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.checkroom,
                  color: Colors.brown,
                ), // Placeholder
              ),

              // 2. Screen 23: Checkmark Overlay
              if (showCheckmarks)
                const Positioned(
                  bottom: 2,
                  right: 2,
                  child: Icon(
                    Icons.check_circle,
                    color: AppColors.primaryYellow,
                    size: 18,
                  ),
                ),

              // 3. Screen 24: Public/Private Pill Overlay
              if (isDuplicateTab)
                Positioned(
                  bottom: 5,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: isPublic
                            ? AppColors.primaryYellow
                            : Colors.grey[600],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        isPublic ? "public" : "Private",
                        style: const TextStyle(
                          fontSize: 6,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _pillBtn(String text, bool isYellow) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.primaryYellow,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primaryYellow),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 10,
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
