import 'package:flutter/material.dart';
import 'package:my_pet/widgets/stats_components.dart';

class StepsGraphScreen extends StatefulWidget {
  const StepsGraphScreen({super.key});

  @override
  State<StepsGraphScreen> createState() => _StepsGraphScreenState();
}

class _StepsGraphScreenState extends State<StepsGraphScreen> {
  int _selectedTab = 1; // Default to 'Week'

  @override
  Widget build(BuildContext context) {
    return DarkStatsScaffold(
      title: "2027/08/21",
      child: Column(
        children: [
          // 1. Tabs
          StatsTabBar(
            selectedIndex: _selectedTab,
            onTabSelected: (i) => setState(() => _selectedTab = i),
          ),
          const SizedBox(height: 20),

          // 2. Big Total Text
          const Text(
            "total",
            style: TextStyle(color: Colors.white70, fontSize: 10),
          ),
          const SizedBox(height: 5),
          const Text(
            "12345 steps",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.normal,
            ),
          ),
          const Text(
            "2027/08/21~",
            style: TextStyle(color: Colors.white54, fontSize: 10),
          ),

          const Spacer(),

          // 3. The Chart
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BarChartWidget(
              maxHeight: 250,
              data: [
                BarData("day", 5000, points: "123pt"),
                BarData("moon", 9000, hasBadge: true, points: "123pt"),
                BarData("fire", 13000, hasBadge: true, points: "123pt"),
                BarData(
                  "water",
                  13000,
                  isHighlighted: true,
                  points: "123pt",
                ), // Highlighted bar
                BarData("tree", 12000, points: "123pt"),
                BarData("money", 13500, hasBadge: true, points: "123pt"),
                BarData("soil", 10000, points: "123pt"),
              ],
            ),
          ),

          const Spacer(),

          // 4. Points Earned Card
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "2027/08/21~08/31",
                      style: TextStyle(fontSize: 8, color: Colors.black54),
                    ),
                    Text(
                      "Points earned",
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ],
                ),
                const Text(
                  "100 points",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
