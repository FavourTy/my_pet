import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SideNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = [
      {'label': 'Event', 'icon': Icons.calendar_today, 'route': '/event-plaza'},
      {
        'label': 'AI Pet',
        'icon': Icons.auto_awesome,
        'route': '/ai-pet-creation',
      },
      {'label': 'Learn', 'icon': Icons.school, 'route': '/ai-education'},
      {'label': 'Feed', 'icon': Icons.restaurant, 'route': '/'},
      {'label': 'Rooms', 'icon': Icons.home, 'route': '/rooms'},
      {'label': 'Status', 'icon': Icons.trending_up, 'route': '/'},
      {'label': 'News', 'icon': Icons.notifications, 'route': '/'},
    ];

    return Container(
      width: 57,
      child: Column(
        children: items.map((item) {
          return GestureDetector(
            onTap: () {
              final route = item['route'] as String;
              if (route != '/') {
                context.go(route);
              }
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 8),
              height: 38,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFF8E079), Color(0xFFF5D760)],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16), // Rounded
                  bottomRight: Radius.circular(16), // Rounded
                  topRight: Radius.zero, // Sharp
                  bottomLeft: Radius.zero, // Sharp
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item['icon'] as IconData,
                    color: Color(0xFF8C8C8C),
                    size: 16,
                  ),
                  Text(
                    item['label'] as String,
                    style: TextStyle(
                      fontSize: 8,
                      color: Color(0xFF8C8C8C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
