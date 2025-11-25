import 'package:flutter/material.dart';
import 'package:my_pet/widgets/stats_components.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DarkStatsScaffold(
      title: "2027/08/21",
      child: SingleChildScrollView(
        // Allow scrolling for long calendars
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "October",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),

              // Grid of Days
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7, // 7 days a week
                  childAspectRatio: 0.6, // Tall tiles
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 10,
                ),
                itemCount: 31,
                itemBuilder: (context, index) {
                  final dayNum = index + 1;
                  // Mock data logic: Highlight specific days like the image
                  final bool hasBadge = [2, 9, 16, 23, 30].contains(dayNum);

                  return CalendarDayTile(
                    day: "$dayNum",
                    hasBadge: hasBadge,
                    points: "123pt",
                  );
                },
              ),

              const SizedBox(height: 20),
              const Text(
                "November",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),

              // Another Grid for next month (Mocking simplified view)
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio: 0.6,
                ),
                itemCount: 5, // Just showing first 5 days
                itemBuilder: (context, index) {
                  final dayNum = index + 1;
                  return CalendarDayTile(
                    day: "$dayNum",
                    hasBadge: dayNum == 2, // Just one badge example
                    points: "123pt",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
