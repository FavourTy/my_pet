import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ActionButtons extends StatelessWidget {
  final int selectedTab;

  const ActionButtons({Key? key, required this.selectedTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttons = _getButtonsForTab(selectedTab);

    return Center(
      child: Column(
        children: buttons.map((button) {
          return Container(
            margin: EdgeInsets.only(bottom: 12),
            child: ElevatedButton(
              onPressed: () {
                final route = button['route'] as String?;
                if (route != null && route != '/') {
                  context.go(route);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF8E079),
                foregroundColor: Color(0xFF8C8C8C),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                elevation: 4,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(button['icon'] as IconData, size: 20),
                  SizedBox(width: 8),
                  Text(
                    button['label'] as String,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  List<Map<String, dynamic>> _getButtonsForTab(int tab) {
    switch (tab) {
      case 0: // Shop
        return [
          {'label': 'Items Shop', 'icon': Icons.shopping_bag, 'route': '/shop'},
          {'label': 'Furniture', 'icon': Icons.chair, 'route': '/shop'},
          {'label': 'Clothes', 'icon': Icons.checkroom, 'route': '/shop'},
        ];
      case 1: // Items
        return [
          {'label': 'Room Makeover', 'icon': Icons.home, 'route': '/rooms'},
          {'label': 'Pet Dress Up', 'icon': Icons.checkroom, 'route': '/'},
          {'label': 'Wish List', 'icon': Icons.favorite, 'route': '/'},
        ];
      case 2: // Pet
        return [
          {'label': 'Love Years', 'icon': Icons.favorite, 'route': '/'},
          {'label': 'HP Recovery', 'icon': Icons.pets, 'route': '/'},
          {'label': 'Points & Steps', 'icon': Icons.trending_up, 'route': '/'},
        ];
      case 3: // Going Out
        return [
          {'label': 'Take a Walk', 'icon': Icons.directions_walk, 'route': '/'},
          {'label': 'Tournament', 'icon': Icons.emoji_events, 'route': '/'},
          {'label': 'Visit Friends', 'icon': Icons.people, 'route': '/'},
        ];
      case 4: // Board
        return [
          {'label': 'Social Feed', 'icon': Icons.public, 'route': '/plaza'},
          {'label': 'My Board', 'icon': Icons.dashboard, 'route': '/plaza'},
          {'label': 'Threads', 'icon': Icons.forum, 'route': '/plaza'},
        ];
      case 5: // Settings
        return [
          {'label': 'Settings', 'icon': Icons.settings, 'route': '/'},
          {'label': 'Profile', 'icon': Icons.person, 'route': '/profile'},
          {'label': 'Premium', 'icon': Icons.star, 'route': '/subscription'},
        ];
      default:
        return [];
    }
  }
}
