import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';
import 'package:my_pet/widgets/creation.dart';
import 'package:my_pet/widgets/stats_components.dart';

class ListCreationScreen extends StatefulWidget {
  const ListCreationScreen({super.key});

  @override
  State<ListCreationScreen> createState() => _ListCreationScreenState();
}

class _ListCreationScreenState extends State<ListCreationScreen> {
  bool _notifications = true;

  @override
  Widget build(BuildContext context) {
    return DarkStatsScaffold(
      title: "List Creation",
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header Input
            const CreationInputRow(
              icon: Icons.label,
              hintText: "pet ribs",
              isHeader: true,
            ),
            const SizedBox(height: 30),

            // 2. Description Input
            const Text(
              "dummy text dummy text",
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
            const SizedBox(height: 10),
            const CreationInputRow(
              icon: Icons.notes,
              hintText: "dummy text dummy text",
            ),

            const SizedBox(height: 20),

            // 3. Subtasks Tree
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tree Line Visualization
                Column(
                  children: [
                    const Icon(
                      Icons.subdirectory_arrow_right,
                      color: AppColors.primaryYellow,
                      size: 20,
                    ),
                    Container(width: 1, height: 60, color: Colors.white24),
                  ],
                ),
                const SizedBox(width: 10),

                // Subtask Inputs
                Expanded(
                  child: Column(
                    children: [
                      const CreationInputRow(
                        icon: Icons.radio_button_unchecked,
                        hintText: "dummy text dummy text",
                      ),
                      const SizedBox(height: 5),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 26,
                        ), // Indent description
                        child: Text(
                          "dummy text dummy text",
                          style: TextStyle(color: Colors.white38, fontSize: 10),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {}, // Add logic
                        child: const Text(
                          "Add subtask",
                          style: TextStyle(color: Colors.white54, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 50),

            // 4. Settings Buttons
            CreationSettingBtn(
              icon: Icons.history,
              label: "Alert date and time",
              value: "2027/08/21 14:10",
              onTap: () => _showDatePicker(context),
            ),
            CreationSettingBtn(
              icon: Icons.repeat,
              label: "Repeat settings",
              value: "Wednesday",
              onTap: () {}, // Go to repeat screen (Screen 19 logic)
            ),
            CreationSettingBtn(
              icon: Icons.notifications,
              label: "notification",
              isToggle: true,
              toggleValue: _notifications,
              onTap: () => setState(() => _notifications = !_notifications),
            ),
          ],
        ),
      ),
    );
  }

  // --- SCREEN 31: DATE/TIME PICKER MODAL ---
  void _showDatePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        height: 500,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color(0xFF333333),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const CircleAvatar(
                    backgroundColor: AppColors.primaryYellow,
                    radius: 15,
                    child: Icon(
                      Icons.arrow_back,
                      size: 16,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const Text(
                  "Date and Time settings",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(Icons.more_horiz, color: Colors.white54),
              ],
            ),
            const SizedBox(height: 20),

            // Calendar Grid (Simplified for UI demo)
            Expanded(
              child: GridView.builder(
                itemCount: 31,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                ),
                itemBuilder: (context, index) {
                  final day = index + 1;
                  final isSelected = day == 21;
                  return Center(
                    child: Text(
                      "$day",
                      style: TextStyle(
                        color: isSelected
                            ? AppColors.primaryYellow
                            : Colors.white,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Time Setting
            CreationSettingBtn(
              icon: Icons.history,
              label: "time",
              value: "14:10",
              onTap: () {},
            ),
            CreationSettingBtn(
              icon: Icons.repeat,
              label: "Repeat settings",
              value: "Wednesday",
              onTap: () {},
            ),

            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Completed",
                style: TextStyle(
                  color: AppColors.primaryYellow,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
