import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';

enum ActionType { blockReport, postOptions }

class ActionBottomSheet extends StatelessWidget {
  final ActionType type;
  const ActionBottomSheet({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Close button absolute left
          Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: AppColors.primaryYellow,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.close,
                  size: 16,
                  color: AppColors.primaryBrown,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          const Text(
            "Others",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 20),

          if (type == ActionType.blockReport) ...[
            _actionItem(
              Icons.block,
              "block",
            ), // Icon hidden in screenshot but common practice, or assume text only
            _actionItem(Icons.flag, "report"),
          ] else ...[
            _actionItem(Icons.push_pin, "Pin to top of bulletin board"),
            _actionItem(Icons.edit, "edit comment"),
            _actionItem(Icons.delete, "Delete comment"),
          ],
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _actionItem(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Screen 24 is text only, Screen 26 has icons.
          // Logic to show icon if type is postOptions
          if (type == ActionType.postOptions) ...[
            Icon(icon, color: Colors.grey, size: 20),
            const SizedBox(width: 10),
          ],
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF555555),
            ),
          ),
        ],
      ),
    );
  }
}
