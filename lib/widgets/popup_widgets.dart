import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';

// 1. Small Action Button (GET / Receive)
class SmallYellowBtn extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool isGrey; // For "Not achieved" state

  const SmallYellowBtn({
    super.key,
    required this.label,
    this.onTap,
    this.isGrey = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isGrey ? Colors.grey[300] : AppColors.primaryYellow,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isGrey ? Colors.grey[600] : AppColors.primaryBrown,
          ),
        ),
      ),
    );
  }
}

// 2. Task Grid Card (Screen 1)
class TaskGridCard extends StatelessWidget {
  final bool isLarge; // Top card is larger

  const TaskGridCard({super.key, this.isLarge = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9), // Grey background
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image Placeholder
          if (isLarge) ...[
            Container(height: 50, width: 50, color: Colors.grey[600]),
            const SizedBox(height: 5),
            const Text("Earned rewards updated daily\nSP bonus when all completed", 
              textAlign: TextAlign.center, 
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black54),
            ),
          ] else ...[
            const Text("task task task task\ntimes", style: TextStyle(fontSize: 10, color: Colors.black54)),
          ],
          
          const Spacer(),
          
          // Progress Bar
          SizedBox(
            height: 6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: const LinearProgressIndicator(
                value: 0.0, // 0/4
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryYellow),
              ),
            ),
          ),
          const SizedBox(height: 4),
          const Text("0/4", style: TextStyle(fontSize: 8, color: Colors.black54)),
          
          const SizedBox(height: 8),
          
          // Button
          SizedBox(
            width: double.infinity,
            child: Center(child: SmallYellowBtn(label: "GET", onTap: () {})),
          ),
        ],
      ),
    );
  }
}

// 3. Task List Row (Screen 2)
class TaskListRow extends StatelessWidget {
  const TaskListRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Box
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 12),
          
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("task task task task task task task", 
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                  maxLines: 1, overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                
                // Tag
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text("Decline", style: TextStyle(fontSize: 8, color: Colors.black54)),
                ),
                const SizedBox(height: 5),
                
                // Progress Bar Row
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: const LinearProgressIndicator(
                          value: 0.2,
                          backgroundColor: Colors.grey,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          minHeight: 6,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text("0/4", style: TextStyle(fontSize: 10, color: Colors.black54)),
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(width: 10),
          const SmallYellowBtn(label: "receive"),
        ],
      ),
    );
  }
}

// 4. Notice Card (Screens 4 & 5)
class NoticeCard extends StatelessWidget {
  final String tag;
  final String date;
  final String text;

  const NoticeCard({
    super.key,
    required this.tag,
    required this.date,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Big Grey Image Placeholder
        Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        const SizedBox(height: 10),
        
        // Tag Row
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(tag, style: const TextStyle(fontSize: 10, color: Colors.black54)),
            ),
            const SizedBox(width: 10),
            Text(date, style: const TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
        const SizedBox(height: 8),
        
        // Description
        Text(text, style: const TextStyle(fontSize: 12, color: Colors.black54)),
        
        const SizedBox(height: 15),
        const Divider(color: Colors.grey, height: 1),
        const SizedBox(height: 15),
      ],
    );
  }
}

// 5. Event Step Icon (Screen 3)
class EventStepIcon extends StatelessWidget {
  final bool isLast;
  const EventStepIcon({super.key, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Triangle Pointer (Custom Paint simulation using container/icon)
        const Icon(Icons.arrow_drop_down, color: Color(0xFFD9D9D9), size: 24),
        Container(
          width: 35,
          height: 45,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: isLast 
            ? const Center(child: Text("present\n01", textAlign: TextAlign.center, style: TextStyle(fontSize: 7, color: Colors.black54)))
            : null,
        ),
      ],
    );
  }
}

// 6. Present List Item (Screen 6)
class PresentListItem extends StatelessWidget {
  const PresentListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
             Container(
              width: 50, height: 50,
              decoration: BoxDecoration(color: const Color(0xFFD9D9D9), borderRadius: BorderRadius.circular(8)),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Headquarters", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black54)),
                  Text("Dummy text about how I\ngot it Dummy text about", style: TextStyle(fontSize: 10, color: Colors.grey)),
                ],
              ),
            ),
            Column(
              children: const [
                SmallYellowBtn(label: "receive"),
                SizedBox(height: 4),
                Text("xx days left", style: TextStyle(fontSize: 8, color: Colors.black54)),
              ],
            )
          ],
        ),
        const SizedBox(height: 10),
        const Divider(),
      ],
    );
  }
}