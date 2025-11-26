import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

// 1. Simple Text Input Row (Icon + TextField)
class CreationInputRow extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool isHeader; // True for the top "pet ribs" input

  const CreationInputRow({
    super.key,
    required this.icon,
    required this.hintText,
    this.isHeader = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: isHeader ? 20 : 16),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            style: TextStyle(
              color: Colors.white,
              fontSize: isHeader ? 16 : 14,
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.white38, fontSize: isHeader ? 16 : 14),
              border: InputBorder.none,
              isDense: true,
            ),
          ),
        ),
      ],
    );
  }
}

// 2. Subtask Item (Checkbox Circle + Text)
class SubtaskItem extends StatelessWidget {
  final String text;

  const SubtaskItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 26), // Indented to match tree line
      child: Row(
        children: [
          Container(
            width: 12, height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryYellow, width: 1.5),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                Text(text, style: const TextStyle(color: Colors.white38, fontSize: 10)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 3. Setting Button (Grey rounded rect with Value on right)
class CreationSettingBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? value;
  final VoidCallback onTap;
  final bool isToggle;
  final bool toggleValue;

  const CreationSettingBtn({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.value,
    this.isToggle = false,
    this.toggleValue = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white70, size: 18),
            const SizedBox(width: 10),
            Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold)),
            const Spacer(),
            if (isToggle)
              Transform.scale(
                scale: 0.7,
                child: Switch(
                  value: toggleValue,
                  onChanged: (v) => onTap(),
                  activeColor: AppColors.primaryYellow,
                  activeTrackColor: AppColors.primaryYellow.withOpacity(0.3),
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.grey[800],
                ),
              )
            else if (value != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(value!, style: const TextStyle(color: Colors.white, fontSize: 12)),
              ),
          ],
        ),
      ),
    );
  }
}

// 4. Album Folder Card (Screen 32)
class AlbumFolderCard extends StatelessWidget {
  final String title;
  final String count;
  final bool isNew;

  const AlbumFolderCard({
    super.key,
    required this.title,
    this.count = "",
    this.isNew = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: isNew ? Colors.transparent : Colors.grey,
              borderRadius: BorderRadius.circular(16),
              border: isNew ? Border.all(color: Colors.white54) : null,
              image: isNew ? null : const DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1586023492125-27b2c045efd7?q=80&w=400'),
                fit: BoxFit.cover,
              ),
            ),
            child: isNew 
                ? const Center(child: Icon(Icons.add, color: Colors.white, size: 30))
                : null,
          ),
        ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
        if (!isNew)
          Text("$count pieces", style: const TextStyle(color: Colors.white54, fontSize: 10)),
      ],
    );
  }
}