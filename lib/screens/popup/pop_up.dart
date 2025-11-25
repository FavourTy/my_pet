import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';
import 'package:my_pet/widgets/dialog_widgets.dart';
import 'package:my_pet/widgets/tasks.dart';

// ============================================================================
// SCREEN 1 & 2: WORK TASKS DIALOG
// ============================================================================
void showWorkTasksDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const TabbedDialog(
      tab1Label: "Earned reward tasks updated daily",
      tab2Label: "Earned reward tasks for each item",
      // We don't pass specific content here because TabbedDialog is generic.
      // I will create a specific widget below to handle the content switching
      // to match your exact layout request.
      tab1Content: _DailyTasksGrid(),
      tab2Content: _ItemTasksList(),
    ),
  );
}

class _DailyTasksGrid extends StatelessWidget {
  const _DailyTasksGrid();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Large Card
        const SizedBox(height: 160, child: TaskGridCard(isLarge: true)),
        const SizedBox(height: 10),

        // Grid of Small Cards
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.85,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 4,
          itemBuilder: (context, index) => const TaskGridCard(),
        ),
      ],
    );
  }
}

class _ItemTasksList extends StatelessWidget {
  const _ItemTasksList();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // Allows it to sit inside the dialog
      itemCount: 6,
      itemBuilder: (context, index) => const TaskListTile(),
    );
  }
}

// ============================================================================
// SCREEN 3: EVENT STATUS DIALOG
// ============================================================================
void showEventStatusDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(15),
      child: Stack(
        clipBehavior: Clip.none,
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    "Event status",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  const Text(
                    "event name",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const Text(
                    "dummy text dummy text dummy text\nEvent period: 2025/08/08 00:00 - 2025/08/08 00:00",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  const SizedBox(height: 15),

                  // Eye Catch Banner
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        "Event eye catch",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Progress Bar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const LinearProgressIndicator(
                      value: 0.15,
                      minHeight: 12,
                      backgroundColor: Color(0xFFEEEEEE), // Very light grey
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.primaryYellow,
                      ),
                    ),
                  ),

                  // Steps (Gifts)
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      EventStepIcon(isLast: true), // Active one
                      EventStepIcon(),
                      EventStepIcon(),
                      EventStepIcon(),
                      EventStepIcon(),
                    ],
                  ),

                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Rewards to be earned",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Reward List
                  _buildRewardRow(true),
                  _buildRewardRow(false),
                  _buildRewardRow(false),
                  _buildRewardRow(false),
                ],
              ),
            ),
          ),

          // X Button
          Positioned(
            top: -15,
            left: 0,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: AppColors.primaryYellow,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, color: Colors.black54, size: 20),
              ),
            ),
          ),
          // ? Button
          Positioned(
            top: -15,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: AppColors.primaryYellow,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.question_mark,
                color: Colors.black54,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildRewardRow(bool isAchieved) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("dummy text", style: TextStyle(fontSize: 12)),
              Text("dummy text", style: TextStyle(fontSize: 12)),
              Text("x1", style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
        SmallActionBtn(
          label: isAchieved ? "receive" : "Not achieved",
          isActive: isAchieved,
        ),
      ],
    ),
  );
}

// ============================================================================
// SCREEN 4 & 5: NOTICE DIALOG
// ============================================================================
void showNoticeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const TabbedDialog(
      tab1Label: "Update information",
      tab2Label: "Malfunction",
      tab1Content: _NoticeList(type: "Update"),
      tab2Content: _NoticeList(type: "Malfunction"),
    ),
  );
}

class _NoticeList extends StatelessWidget {
  final String type; // "Update" or "Malfunction" just changes sample text
  const _NoticeList({required this.type});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        // Notice Card 1
        NoticeCard(
          tag: type == "Update" ? "event" : "Malfunction",
          date: "2025/08/08",
          text: "dummy text dummy text dummy text",
        ),
        // Notice Card 2
        NoticeCard(
          tag: type == "Update" ? "Great deals" : "update",
          date: "2025/08/08",
          text: "dummy text dummy text dummy text",
        ),
        // Notice Card 3 (Empty placeholder to show scrolling)
        Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ],
    );
  }
}
