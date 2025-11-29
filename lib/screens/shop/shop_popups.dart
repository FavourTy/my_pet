import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';
import 'package:my_pet/widgets/dialog_widgets.dart';
import 'package:my_pet/widgets/shop.dart';

// ============================================================================
// SCREEN 1: BAIT PURCHASE SHOP
// ============================================================================
void showBaitShopDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const TabbedDialog(
      tab1Label: "normal bait",
      tab2Label: "special bait",
      // Tab 1 Content
      tab1Content: _BaitList(),
      // Tab 2 Content (Reused for simplicity)
      tab2Content: _BaitList(),
    ),
  );
}

class _BaitList extends StatelessWidget {
  const _BaitList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Banner
        const GachaBanner(
          text: "especially this month's special bait",
          height: 100,
        ),
        const SizedBox(height: 20),
        // List
        ShopItemTile(
          title: "dummy text dummy text",
          subtitle: "x1",
          btnLabel: "buy",
          onBuy: () {},
        ),
        ShopItemTile(
          title: "dummy text dummy text",
          subtitle: "x1",
          btnLabel: "buy",
          onBuy: () {},
        ),
      ],
    );
  }
}

// ============================================================================
// SCREEN 2: GACHA COIN PACK SHOP
// ============================================================================
void showCoinShopDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(10),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: double.infinity,
            height: 700,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  const Center(
                    child: Text(
                      "Gacha coin pack\nPurchase shop",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // TOP NEWS Carousel
                  const Text(
                    "TOP NEWS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 120,
                    child: PageView(
                      children: const [GachaBanner(), GachaBanner()],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.circle,
                        size: 10,
                        color: AppColors.primaryYellow,
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.circle,
                        size: 10,
                        color: AppColors.primaryYellow,
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.circle,
                        size: 10,
                        color: AppColors.primaryYellow,
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // PICK UP
                  const Text(
                    "PICK UP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      4,
                      (i) => Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "get this item\nIf you want, go to Gacha",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // GACHA LIST
                  _buildSectionHeader("Gacha list"),
                  const ShopItemTile(
                    title: "dummy text dummy text",
                    subtitle: "dummy text",
                    btnLabel: "view",
                  ),
                  const ShopItemTile(
                    title: "dummy text dummy text",
                    subtitle: "dummy text",
                    btnLabel: "view",
                  ),

                  const SizedBox(height: 20),

                  // COIN PACK LIST
                  _buildSectionHeader("Coin pack list"),
                  const ShopItemTile(
                    title: "to coin",
                    subtitle: "dummy text dummy text",
                    btnLabel: "buy",
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -15,
            left: 0,
            child: _buildCircleBtn(Icons.close, () => Navigator.pop(context)),
          ),
          Positioned(
            top: -15,
            right: 0,
            child: _buildCircleBtn(Icons.question_mark, () {}),
          ),
        ],
      ),
    ),
  );
}

Widget _buildSectionHeader(String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
      const Text(
        "See more",
        style: TextStyle(fontSize: 10, color: Colors.grey),
      ),
    ],
  );
}

// ============================================================================
// SCREEN 3: GACHA SCREEN
// ============================================================================
void showGachaDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(15),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Present items are not controlled by level!",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Gacha",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // PICK UP Banner
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "PICK UP",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const GachaBanner(text: "Limited to once on the day"),
                  const SizedBox(height: 10),

                  // Buttons
                  const GachaButton(
                    title: "Free",
                    subtitle: "Limited to once on the day",
                  ),
                  const GachaButton(title: "secret", subtitle: "Item limited"),
                  const GachaButton(title: "set (300 yen)", subtitle: "gachas"),
                  const GachaButton(
                    title: "set (1000 yen)",
                    subtitle: "gachas",
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -15,
            left: 0,
            child: _buildCircleBtn(Icons.close, () => Navigator.pop(context)),
          ),
          Positioned(
            top: -15,
            right: 0,
            child: _buildCircleBtn(Icons.question_mark, () {}),
          ),
        ],
      ),
    ),
  );
}

// ============================================================================
// SCREEN 5: SORT DIALOG
// ============================================================================
void showSortDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Sort",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 20),
                _buildSortRow("Entry procedure", 0),
                _buildSortRow("Release order", 1),
                _buildSortRow("Sort by rarity", 0),
                _buildSortRow("Sorted by number of possessions", 1),
                const SizedBox(height: 30),

                // Bottom Buttons
                Row(
                  children: [
                    Expanded(
                      child: _buildGreyBtn(
                        "Cancel",
                        () => Navigator.pop(context),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildYellowBtn(
                        "OK",
                        () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: -15,
            left: 0,
            child: _buildCircleBtn(Icons.close, () => Navigator.pop(context)),
          ),
        ],
      ),
    ),
  );
}

Widget _buildSortRow(String label, int groupValue) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.black87),
          ),
        ),
        const Text("new", style: TextStyle(fontSize: 10)),
        Radio(
          value: 0,
          groupValue: groupValue,
          onChanged: (v) {},
          activeColor: AppColors.primaryYellow,
        ),
        const Text("old", style: TextStyle(fontSize: 10)),
        Radio(
          value: 1,
          groupValue: groupValue,
          onChanged: (v) {},
          activeColor: AppColors.primaryYellow,
        ),
      ],
    ),
  );
}

// ============================================================================
// SCREEN 6: NARROW DOWN DIALOG
// ============================================================================
void showNarrowDownDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "Narrow down",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Reset Button
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      color: Color(0xFF555555),
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      "reset",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),

                const Text(
                  "color",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                const SizedBox(height: 10),

                // Color Grid
                Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  children: List.generate(
                    10,
                    (index) => const ColorSelectCircle(label: "red"),
                  ),
                ),

                const SizedBox(height: 20),
                const Text(
                  "Rare",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: true,
                      onChanged: (v) {},
                      activeColor: AppColors.primaryYellow,
                    ),
                    const Text("Event limited", style: TextStyle(fontSize: 12)),
                  ],
                ),

                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: _buildGreyBtn(
                        "Cancel",
                        () => Navigator.pop(context),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildYellowBtn(
                        "OK",
                        () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: -15,
            left: 0,
            child: _buildCircleBtn(Icons.close, () => Navigator.pop(context)),
          ),
          Positioned(
            top: -15,
            right: 0,
            child: _buildCircleBtn(Icons.question_mark, () {}),
          ),
        ],
      ),
    ),
  );
}

// --- HELPERS ---
Widget _buildCircleBtn(IconData icon, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: AppColors.primaryYellow,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 20, color: Colors.black54),
    ),
  );
}

Widget _buildYellowBtn(String label, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryYellow,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
    ),
  );
}

Widget _buildGreyBtn(String label, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
    ),
  );
}
