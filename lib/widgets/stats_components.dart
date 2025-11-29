import 'package:flutter/material.dart';
import 'package:my_pet/screens/album/album_screen.dart';
import 'package:my_pet/utils/colors.dart';


// 1. The Dark Screen Shell (Handles Background & Back Button)
class DarkStatsScaffold extends StatelessWidget {
  final Widget child;
  final String? title;
  final VoidCallback? onBack;

  const DarkStatsScaffold({
    super.key,
    required this.child,
    this.title,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFF454545,
      ), // The dark grey from screenshots
      body: SafeArea(
        child: Stack(
          children: [
            // Main Content
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(top: 60), // Space for header
                child: child,
              ),
            ),

            // Header (Back Btn + Title)
            Positioned(
              top: 10,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: onBack ?? () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: AppColors.primaryYellow,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black54,
                        size: 20,
                      ),
                    ),
                  ),
                  if (title != null) ...[
                    const Spacer(),
                    Column(
                      children: [
                        Text(
                          title!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "14:10", // Dummy time
                          style: TextStyle(color: Colors.white70, fontSize: 10),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> AlbumHomeScreen()));
                      },
                      child: const Text(
                        "all photos",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 2. Custom Tab Bar (Day | Week | Moon | Year)
class StatsTabBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const StatsTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          _buildTab("day", 0),
          _buildTab("week", 1),
          _buildTab("moon", 2),
          _buildTab("year", 3),
        ],
      ),
    );
  }

  Widget _buildTab(String label, int index) {
    final bool isSelected = selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => onTabSelected(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white24 : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? AppColors.primaryYellow : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}

// 3. The Bar Chart Widget (No Canvas!)
class BarChartWidget extends StatelessWidget {
  final List<BarData> data;
  final double maxHeight;

  const BarChartWidget({super.key, required this.data, this.maxHeight = 200});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: maxHeight + 80, // Height for bars + labels + badges
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end, // Align bars to bottom
        children: [
          // 1. Bars Area
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end, // Vital for bar chart
              children: data.map((d) => _buildSingleBar(d)).toList(),
            ),
          ),

          // 2. Y-Axis Labels
          Container(
            width: 40,
            height: maxHeight,
            margin: const EdgeInsets.only(bottom: 80), // Align with bars top
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "15,000",
                  style: TextStyle(color: Colors.grey, fontSize: 8),
                ),
                Text(
                  "10,000",
                  style: TextStyle(color: Colors.grey, fontSize: 8),
                ),
                Text(
                  "5,000",
                  style: TextStyle(color: Colors.grey, fontSize: 8),
                ),
                Text("0", style: TextStyle(color: Colors.grey, fontSize: 8)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSingleBar(BarData d) {
    // Calculate height percentage (assuming 15000 is max)
    final double heightPct = (d.value / 15000).clamp(0.0, 1.0);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // The Bar
        Container(
          width: 30, // Fixed bar width
          height: maxHeight * heightPct,
          decoration: BoxDecoration(
            color: d.isHighlighted ? AppColors.primaryYellow : Colors.grey[300],
            borderRadius: const BorderRadius.vertical(top: Radius.circular(2)),
          ),
        ),
        const SizedBox(height: 8),
        // Label
        Text(
          d.label,
          style: const TextStyle(color: Colors.white70, fontSize: 10),
        ),
        const SizedBox(height: 4),
        // Badge (Optional)
        if (d.hasBadge)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              "Obtained",
              style: TextStyle(fontSize: 7, color: Colors.white),
            ),
          ),
        const SizedBox(height: 2),
        // Points
        if (d.points != null)
          Text(
            d.points!,
            style: const TextStyle(color: Colors.white54, fontSize: 9),
          ),
      ],
    );
  }
}

class BarData {
  final String label;
  final int value;
  final bool isHighlighted;
  final bool hasBadge;
  final String? points;

  BarData(
    this.label,
    this.value, {
    this.isHighlighted = false,
    this.hasBadge = false,
    this.points,
  });
}

// 4. Calendar Day Tile (Screen 19)
class CalendarDayTile extends StatelessWidget {
  final String day;
  final bool hasBadge;
  final String? points;

  const CalendarDayTile({
    super.key,
    required this.day,
    this.hasBadge = false,
    this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          day,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        if (hasBadge)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            margin: const EdgeInsets.only(bottom: 2),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "Obtained",
              style: TextStyle(fontSize: 8, color: Colors.white),
            ),
          )
        else
          const SizedBox(height: 14), // Placeholder space

        if (points != null)
          Text(
            points!,
            style: const TextStyle(color: Colors.white54, fontSize: 10),
          )
        else
          const SizedBox(height: 12), // Placeholder space
      ],
    );
  }
}
