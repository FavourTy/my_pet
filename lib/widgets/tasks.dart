import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';

class SmallActionBtn extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool isActive; // False = Grey "Not achieved"

  const SmallActionBtn({
    super.key,
    required this.label,
    this.onTap,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive ? onTap : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primaryYellow : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isActive ? AppColors.primaryBrown : Colors.grey[600],
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}

// 2. Task Card (Grid Item for Screen 1)
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
            Container(height: 60, width: 60, color: Colors.grey[600]),
            const SizedBox(height: 8),
            const Text("Earned rewards updated daily\nSP bonus when all completed", 
              textAlign: TextAlign.center, 
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ] else ...[
            const Text("task task task task\ntimes", style: TextStyle(fontSize: 10)),
          ],
          
          const Spacer(),
          
          // Progress Bar
          SizedBox(
            height: 8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: const LinearProgressIndicator(
                value: 0.0, // 0/4
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryYellow),
              ),
            ),
          ),
          const SizedBox(height: 4),
          const Text("0/4", style: TextStyle(fontSize: 8)),
          
          const SizedBox(height: 8),
          
          // Button
          SizedBox(
            width: double.infinity,
            child: SmallActionBtn(label: "GET", onTap: () {}),
          ),
        ],
      ),
    );
  }
}

// 3. Task List Tile (Row Item for Screen 2)
class TaskListTile extends StatelessWidget {
  const TaskListTile({super.key});

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
                  style: TextStyle(fontSize: 12),
                  maxLines: 1, overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                
                // Progress Tag
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text("Decline", style: TextStyle(fontSize: 8)),
                ),
                const SizedBox(height: 4),
                
                // Progress Bar Row
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: const LinearProgressIndicator(
                          value: 0.2,
                          backgroundColor: Colors.grey,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          minHeight: 6,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text("0/4", style: TextStyle(fontSize: 10)),
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(width: 10),
          // Button
          const SmallActionBtn(label: "receive", isActive: true),
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
          height: 120,
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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(tag, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 10),
            Text(date, style: const TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
        const SizedBox(height: 8),
        
        // Description
        Text(text, style: const TextStyle(fontSize: 12, color: Colors.black87)),
        
        const SizedBox(height: 20),
        const Divider(color: Colors.grey),
        const SizedBox(height: 20),
      ],
    );
  }
}

// 5. Event Step (Gift Icon for Screen 3)
class EventStepIcon extends StatelessWidget {
  final bool isLast;
  const EventStepIcon({super.key, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Triangle Pointer
        CustomPaint(
          size: const Size(10, 10),
          painter: _TrianglePainter(),
        ),
        Container(
          width: 40,
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: isLast 
            ? const Center(child: Text("present\n01", textAlign: TextAlign.center, style: TextStyle(fontSize: 8)))
            : null,
        ),
      ],
    );
  }
}

class _TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFFD9D9D9)..style = PaintingStyle.fill;
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}