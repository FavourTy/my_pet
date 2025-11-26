import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';
class AlarmListTile extends StatelessWidget {
  final String time;
  final String label;
  final bool isActive;
  final ValueChanged<bool> onChanged;
  final VoidCallback onTap;

  const AlarmListTile({
    super.key,
    required this.time,
    required this.label,
    required this.isActive,
    required this.onChanged,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(time, style: const TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.w300)),
                Row(
                  children: [
                    const Icon(Icons.refresh, size: 14, color: AppColors.primaryYellow),
                    const SizedBox(width: 4),
                    Text(label, style: const TextStyle(fontSize: 12, color: AppColors.primaryYellow)),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Transform.scale(
              scale: 0.8,
              child: Switch(
                value: isActive,
                onChanged: onChanged,
                activeColor: AppColors.primaryYellow,
                activeTrackColor: AppColors.primaryYellow.withOpacity(0.3),
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 2. Dark Setting Tile (Screen 18/19/20)
class DarkSettingTile extends StatelessWidget {
  final String label;
  final String value; // "Wednesday >" or "alarm >"
  final VoidCallback? onTap;
  final bool showArrow;

  const DarkSettingTile({
    super.key,
    required this.label,
    required this.value,
    this.onTap,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
            Row(
              children: [
                Text(value, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                if (showArrow) ...[
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 12),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 3. Dark Toggle Tile (Screen 18 Snooze)
class DarkToggleTile extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const DarkToggleTile({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
          Transform.scale(
            scale: 0.8,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeColor: AppColors.primaryYellow,
              activeTrackColor: AppColors.primaryYellow.withOpacity(0.3),
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}

// 4. Time Picker Button (Big Grey Button)
class TimePickerButton extends StatelessWidget {
  final String time;
  final VoidCallback onTap;

  const TimePickerButton({
    super.key,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            time,
            style: const TextStyle(
              color: AppColors.primaryYellow,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

// 5. Delete Button (Red Text)
class DeleteAlarmButton extends StatelessWidget {
  final VoidCallback onTap;

  const DeleteAlarmButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white10, // Very dark grey
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            "delete alarm",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
      ),
    );
  }
}

// 6. Day Selection Tile (Screen 19)
class DaySelectionTile extends StatelessWidget {
  final String day;
  final bool isSelected;
  final VoidCallback onTap;

  const DaySelectionTile({
    super.key,
    required this.day,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white24, width: 0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              day,
              style: TextStyle(
                color: isSelected ? AppColors.primaryYellow : Colors.white,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 12,
              ),
            ),
            if (isSelected)
              const Icon(Icons.check, color: AppColors.primaryYellow, size: 16),
          ],
        ),
      ),
    );
  }
}

