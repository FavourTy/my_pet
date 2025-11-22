import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const BottomNavigation({
    Key? key,
    required this.selectedIndex,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabs = [
      {'label': 'Shop', 'icon': Icons.shopping_bag},
      {'label': 'Items', 'icon': Icons.inventory_2},
      {'label': 'Pet', 'icon': Icons.pets},
      {'label': 'Going Out', 'icon': Icons.map},
      {'label': 'Board', 'icon': Icons.message},
      {'label': 'Settings', 'icon': Icons.settings},
    ];

    return Container(
      height: 76,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(tabs.length, (index) {
          final tab = tabs[index];
          final isActive = selectedIndex == index;

          return GestureDetector(
            onTap: () => onTabSelected(index),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: isActive
                    ? Color(0xFFF8E079).withOpacity(0.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: isActive
                          ? Color(0xFFF8E079)
                          : Color(0xFFD8D8D8),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      tab['icon'] as IconData,
                      color: isActive ? Colors.white : Color(0xFF8C8C8C),
                      size: 18,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    tab['label'] as String,
                    style: TextStyle(
                      fontSize: 9,
                      color: isActive ? Color(0xFF8C8C8C) : Color(0xFFB8B8B8),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
