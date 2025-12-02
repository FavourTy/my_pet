import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pet/screens/onboarding/steps_graph.dart';
import 'package:my_pet/widgets/dialog_widgets.dart';

class ActionButtons extends StatelessWidget {
  final int selectedTab;

  const ActionButtons({super.key, required this.selectedTab});

  @override
  Widget build(BuildContext context) {
    final buttons = _getButtonsForTab(selectedTab);
    void _showLoveDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) => const TabbedDialog(
          tab1Label: "years of love",
          tab2Label: "HP information",
          // icon: Icons.close,
          tab1Content: LoveYearsWidget(),
          tab2Content: HPInfoWidget(),
        ),
      );
    }

    void _showStepsDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) => const TabbedDialog(
          tab1Label: "number of steps",
          tab2Label: "points",
          //  icon: Icons.close,
          tab1Content: StepCounterWidget(),
          tab2Content: PointsListWidget(),
        ),
      );
    }

    return Center(
      child: Column(
        children: buttons.map((button) {
          return Container(
            margin: EdgeInsets.only(bottom: 12),
            child: ElevatedButton(
              onPressed: () {
                // final route = button['route'] as String?;

                final id = button['id'] as String?;
                final route = button['route'] as String?;

                // --- 1. HANDLE DIALOGS ---
                if (id == 'love_years' || id == 'hp_recovery') {
                  _showLoveDialog(context);
                } else if (id == 'points_steps') {
                  _showStepsDialog(context);
                }
                // --- 2. HANDLE NAVIGATION ---
                else if (route != null && route != '/') {
                  Navigator.pushNamed(context, route);
                }
                // --- 3. FALLBACK ---
                else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StepsGraphScreen(),
                    ),
                  );
                }

                // if (route != null && route != '/') {
                //   Navigator.pushNamed(context, route);
                // } else {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => StepsGraphScreen()),
                //   );
                // }
                // final route = button['route'] as String?;
                // if (route != '/') {
                //   context.push(route!);
                // } else {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => StepsGraphScreen()),
                //   );
                // }
                // if (route != null && route != '/') {
                //   context.push(route);
                // }else {
                //   Navigator.push(context, MaterialPageRoute(builder: (context)=> StepsGraphScreen()));
                // }
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
          {
            'label': 'Items Shop',
            'icon': Icons.shopping_bag,
            'route': '/items',
          },
          {'label': 'Furniture', 'icon': Icons.chair, 'route': '/shop'},
          {'label': 'Clothes', 'icon': Icons.checkroom, 'route': '/shop'},
        ];
      case 1: // Items
        return [
          {'label': 'Room Makeover', 'icon': Icons.home, 'route': '/rooms'},
          {
            'label': 'Pet Dress Up',
            'icon': Icons.checkroom,
            'route': '/wardrobe',
          },
          {'label': 'Wish List', 'icon': Icons.favorite, 'route': '/wishlist'},
        ];
      case 2: // Pet
        return [
          // {'label': 'Love Years', 'icon': Icons.favorite, 'route': '/'},
          // {'label': 'HP Recovery', 'icon': Icons.pets, 'route': '/'},
          // {'label': 'Points & Steps', 'icon': Icons.trending_up, 'route': '/'},
          {
            'label': 'Love Years',
            'icon': Icons.favorite,
            'route': null,
            'id': 'love_years',
          },
          {
            'label': 'HP Recovery',
            'icon': Icons.pets,
            'route': null,
            'id': 'hp_recovery',
          },
          {
            'label': 'Points & Steps',
            'icon': Icons.trending_up,
            'route': null,
            'id': 'points_steps',
          },
        ];
      case 3: // Going Out
        return [
          {'label': 'Take a Walk', 'icon': Icons.directions_walk, 'route': '/'},
          {'label': 'Tournament', 'icon': Icons.emoji_events, 'route': '/'},
          {'label': 'Visit Friends', 'icon': Icons.people, 'route': '/'},
        ];
      case 4: // Board
        return [
          {
            'label': 'Social Feed',
            'icon': Icons.public,
            'route': '/social-feed',
          },
          {'label': 'My Board', 'icon': Icons.dashboard, 'route': '/board'},
          {'label': 'Threads', 'icon': Icons.forum, 'route': '/thread'},
        ];
      case 5: // Settings
        return [
          {'label': 'Settings', 'icon': Icons.settings, 'route': '/settings'},
          {'label': 'Profile', 'icon': Icons.person, 'route': '/profile'},
          {'label': 'Premium', 'icon': Icons.star, 'route': '/subscription'},
        ];
      default:
        return [];
    }
  }
}
