import 'package:flutter/material.dart';
import 'package:my_pet/screens/inventory/item_dialog.dart';
import 'package:my_pet/utils/colors.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  int _selectedTab = 0; // 0: in use, 1: wish list, 2: duplicate
  int _selectedFilter = 0; // 0: everything, etc.
  bool _toggleValue = false; // For the toggles in Wishlist/Duplicate

  final List<String> _tabs = ["in use", "wish list", "Duplicate"];
  final List<String> _filters = ["everything", "room", "Room wear", "Going out"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5), // Simulating the overlay background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              // --- Top Bar (Screen 20) ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Row(
                  children: [
                    _circleBtn(Icons.close),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.primaryYellow,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.tune, size: 16, color: AppColors.primaryBrown),
                          SizedBox(width: 4),
                          Text("Entry procedure", 
                            style: TextStyle(color: AppColors.primaryBrown, fontWeight: FontWeight.bold, fontSize: 12)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    _circleBtn(Icons.help_outline),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // --- Custom Folder Tabs ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: List.generate(_tabs.length, (index) {
                    final isSelected = _selectedTab == index;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedTab = index),
                        child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.primaryYellow : AppColors.inactiveTab,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          child: Text(
                            _tabs[index],
                            style: TextStyle(
                              color: isSelected ? AppColors.primaryBrown : AppColors.textLight,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              // --- Main Content Area (White Card) ---
              Expanded(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),

                      // --- Conditional Toggles (Screen 21 & 22) ---
                      if (_selectedTab == 1) // Wishlist specific
                        _buildToggleRow("Prioritize display of items that can be gifted"),
                      if (_selectedTab == 2) // Duplicate specific
                        _buildToggleRow("Show your wish list first"),

                      // --- Filter Chips ---
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        child: Row(
                          children: List.generate(_filters.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ChoiceChip(
                                label: Text(_filters[index]),
                                selected: _selectedFilter == index,
                                selectedColor: AppColors.primaryYellow,
                                backgroundColor: AppColors.inactiveTab.withOpacity(0.5),
                                labelStyle: TextStyle(
                                  color: _selectedFilter == index ? AppColors.primaryBrown : AppColors.textLight,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12
                                ),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                onSelected: (val) => setState(() => _selectedFilter = index),
                              ),
                            );
                          }),
                        ),
                      ),

                      // --- Inventory Grid ---
                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.all(16),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5, // Matches screenshot density
                            childAspectRatio: 0.8,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                // Trigger Screen 23 Modal
                                showDialog(context: context, builder: (_) => const ItemDetailDialog());
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFFDE7), // Very light yellow bg
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.center,
                                    // Placeholder for Shirt Image
                                    child: const Icon(Icons.checkroom, color: Colors.blueGrey, size: 30), 
                                  ),
                                  // Checkmark Badge
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: const BoxDecoration(
                                        color: AppColors.primaryYellow,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(Icons.check, size: 10, color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
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
      ),
    );
  }

  Widget _circleBtn(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: AppColors.primaryYellow,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 20, color: AppColors.primaryBrown),
    );
  }

  Widget _buildToggleRow(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(text, style: const TextStyle(fontSize: 10, color: AppColors.textLight)),
          const SizedBox(width: 8),
          SizedBox(
            height: 20,
            child: Switch(
              value: _toggleValue,
              activeColor: AppColors.primaryYellow,
              onChanged: (val) => setState(() => _toggleValue = val),
            ),
          )
        ],
      ),
    );
  }
}