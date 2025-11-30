import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';
import 'package:my_pet/widgets/action_bottom_sheet.dart';

class BulletinBoardScreen extends StatelessWidget {
  const BulletinBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[200],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: AppColors.primaryYellow,
            child: const Icon(Icons.arrow_back, color: Colors.black54),
          ),
        ),
        title: const Text(
          "XX bulletin board",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          CircleAvatar(
            backgroundColor: AppColors.primaryYellow,
            radius: 15,
            child: const Text(
              "AA",
              style: TextStyle(fontSize: 10, color: Colors.black54),
            ),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.search, color: Colors.grey, size: 30),
          const SizedBox(width: 10),
        ],
      ),
      body: Stack(
        children: [
          ListView.separated(
            padding: const EdgeInsets.only(bottom: 80),
            itemCount: 3,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Row(
                          children: [
                            if (index == 0)
                              const Icon(
                                Icons.push_pin,
                                size: 14,
                                color: Colors.grey,
                              ),
                            Container(
                              width: 20,
                              height: 20,
                              color: Colors.grey[300],
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              "xxxx",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          // Trigger Bottom Sheet (Screen 26)
                          onTap: () => showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (_) => const ActionBottomSheet(
                              type: ActionType.postOptions,
                            ),
                          ),
                          child: const Icon(
                            Icons.more_horiz,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Body
                    const Text(
                      "dummy text dummy text dummy text dummy text\ndummy text dummy text dummy text",
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(height: 10),
                    // Images Grid
                    Row(
                      children: List.generate(
                        index == 0 ? 4 : 2,
                        (i) => Container(
                          margin: const EdgeInsets.only(right: 5),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "2021/10/01 12:30",
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ],
                ),
              );
            },
          ),

          // Bottom Area
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryYellow,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    "Leave a comment",
                    style: TextStyle(
                      color: AppColors.primaryBrown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: CircleAvatar(
              backgroundColor: AppColors.primaryYellow,
              child: const Icon(Icons.arrow_drop_down, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
