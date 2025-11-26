import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

// 1. Alarm List Tile (Screen 17)
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
```eof

### 2. The Alarm Screens (`lib/screens/alarm_screens.dart`)

This file handles the logic for **Listing**, **Editing**, **Repeating**, and **Sound Settings**.

```dart:Alarm Screens:lib/screens/alarm_screens.dart
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/stats_widgets.dart'; // Reusing DarkStatsScaffold
import '../widgets/alarm_widgets.dart'; // New widgets

// ============================================================================
// SCREEN 17: ALARM LIST
// ============================================================================
class AlarmListScreen extends StatefulWidget {
  const AlarmListScreen({super.key});

  @override
  State<AlarmListScreen> createState() => _AlarmListScreenState();
}

class _AlarmListScreenState extends State<AlarmListScreen> {
  bool _alarm1 = true;
  bool _alarm2 = false;

  @override
  Widget build(BuildContext context) {
    return DarkStatsScaffold(
      title: "alarm",
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            AlarmListTile(
              time: "8:00",
              label: "Wednesday",
              isActive: _alarm1,
              onChanged: (v) => setState(() => _alarm1 = v),
              onTap: () => _navToEdit(context),
            ),
            AlarmListTile(
              time: "8:00",
              label: "alarm",
              isActive: _alarm2,
              onChanged: (v) => setState(() => _alarm2 = v),
              onTap: () => _navToEdit(context),
            ),
          ],
        ),
      ),
    );
  }

  void _navToEdit(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const EditAlarmScreen()));
  }
}

// ============================================================================
// SCREEN 18 & 20: EDIT ALARM
// ============================================================================
class EditAlarmScreen extends StatefulWidget {
  const EditAlarmScreen({super.key});

  @override
  State<EditAlarmScreen> createState() => _EditAlarmScreenState();
}

class _EditAlarmScreenState extends State<EditAlarmScreen> {
  bool _snooze = false;

  @override
  Widget build(BuildContext context) {
    return DarkStatsScaffold(
      title: "Edit alarm",
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Spacer(flex: 1),
            // Time Picker Mockup
            const Text("14:10", style: TextStyle(color: Colors.white12, fontSize: 16)),
            const SizedBox(height: 5),
            const TimePickerButton(time: "14:10", onTap: _dummyTimePicker),
            const SizedBox(height: 5),
            const Text("14:10", style: TextStyle(color: Colors.white12, fontSize: 16)),
            const Spacer(flex: 2),

            // Settings List
            DarkSettingTile(
              label: "repeat", 
              value: "Wednesday", 
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RepeatSettingsScreen())),
            ),
            DarkSettingTile(
              label: "alarm message", 
              value: "alarm", 
              onTap: () {}, // Show text input dialog
            ),
            DarkSettingTile(
              label: "sound", 
              value: "default", 
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AlarmSoundScreen())),
            ),
            DarkToggleTile(
              label: "Snooze", 
              value: _snooze, 
              onChanged: (v) => setState(() => _snooze = v),
            ),
            
            const SizedBox(height: 30),
            DeleteAlarmButton(onTap: () => Navigator.pop(context)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

void _dummyTimePicker() {}

// ============================================================================
// SCREEN 19: REPEAT SETTINGS
// ============================================================================
class RepeatSettingsScreen extends StatefulWidget {
  const RepeatSettingsScreen({super.key});

  @override
  State<RepeatSettingsScreen> createState() => _RepeatSettingsScreenState();
}

class _RepeatSettingsScreenState extends State<RepeatSettingsScreen> {
  int _selectedDay = 2; // Wednesday

  @override
  Widget build(BuildContext context) {
    return DarkStatsScaffold(
      title: "repeat",
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Top Section (None / Every Day)
          Container(
            decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                DaySelectionTile(day: "None", isSelected: false, onTap: () {}),
                DaySelectionTile(day: "every day", isSelected: false, onTap: () {}),
              ],
            ),
          ),
          const SizedBox(height: 20),
          
          // Days of Week
          Container(
            decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                _buildDay(0, "monday"),
                _buildDay(1, "Tuesday"),
                _buildDay(2, "Wednesday"),
                _buildDay(3, "Thursday"),
                _buildDay(4, "friday"),
                _buildDay(5, "saturday"),
                _buildDay(6, "Sunday"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDay(int index, String label) {
    return DaySelectionTile(
      day: label,
      isSelected: _selectedDay == index,
      onTap: () => setState(() => _selectedDay = index),
    );
  }
}

// ============================================================================
// SCREEN 21: ALARM SOUND SETTINGS
// ============================================================================
class AlarmSoundScreen extends StatefulWidget {
  const AlarmSoundScreen({super.key});

  @override
  State<AlarmSoundScreen> createState() => _AlarmSoundScreenState();
}

class _AlarmSoundScreenState extends State<AlarmSoundScreen> {
  double _volume = 0.7;
  bool _fadeIn = true;

  @override
  Widget build(BuildContext context) {
    return DarkStatsScaffold(
      title: "Setting an alarm",
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Alarm Type
            Row(
              children: [
                const Icon(Icons.notifications_active, color: Colors.white70),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Alarm type", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                    Text("sound and vibration", style: TextStyle(color: Colors.white54, fontSize: 10)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Volume Slider
            Row(
              children: [
                const Icon(Icons.music_note, color: Colors.white70),
                const SizedBox(width: 15),
                const Text("volume", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
              ],
            ),
            SliderTheme(
              data: SliderThemeData(
                activeTrackColor: AppColors.primaryYellow,
                inactiveTrackColor: Colors.grey,
                thumbColor: AppColors.primaryYellow,
                trackHeight: 2,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
              ),
              child: Slider(
                value: _volume,
                onChanged: (v) => setState(() => _volume = v),
              ),
            ),
            
            const SizedBox(height: 30),

            // Fade In Toggle
            Row(
              children: [
                const Icon(Icons.call_made, color: Colors.white70), // Arrow icon
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("fade in", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                      Text("Gradually increase the volume to wake\nup gently", style: TextStyle(color: Colors.white54, fontSize: 10)),
                    ],
                  ),
                ),
                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: _fadeIn,
                    onChanged: (v) => setState(() => _fadeIn = v),
                    activeColor: AppColors.primaryYellow,
                    activeTrackColor: AppColors.primaryYellow.withOpacity(0.3),
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}