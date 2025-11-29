import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

// 1. Shop List Item (Grey Box + Text + Yellow Button)
class ShopItemTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String btnLabel;
  final VoidCallback? onBuy;

  const ShopItemTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.btnLabel,
    this.onBuy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Placeholder
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9), // Placeholder Grey
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 12),
          // Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 12, color: Colors.black87)),
                Text(subtitle, style: const TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
          ),
          // Button
          GestureDetector(
            onTap: onBuy,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.primaryYellow,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                btnLabel,
                style: const TextStyle(
                  fontSize: 12, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.black54
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 2. Gacha Banner (Grey Rectangle)
class GachaBanner extends StatelessWidget {
  final String? text;
  final double height;

  const GachaBanner({super.key, this.text, this.height = 120});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: text != null 
          ? Center(child: Text(text!, style: const TextStyle(color: Colors.black54))) 
          : null,
    );
  }
}

// 3. Gacha Button (Large Grey Pill with Price)
class GachaButton extends StatelessWidget {
  final String title;
  final String subtitle;

  const GachaButton({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black54)),
              Text(subtitle, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54)),
            ],
          ),
          const Spacer(),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("dummy text", style: TextStyle(fontSize: 10, color: Colors.black54)),
              Text("dummy text", style: TextStyle(fontSize: 10, color: Colors.black54)),
            ],
          )
        ],
      ),
    );
  }
}

// 4. Color Selection Circle (Screen 6)
class ColorSelectCircle extends StatelessWidget {
  final String label;
  final bool isSelected;

  const ColorSelectCircle({super.key, required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.primaryYellow,
            shape: BoxShape.circle,
            border: isSelected ? Border.all(color: Colors.black, width: 2) : null,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.black54)),
      ],
    );
  }
}

// 5. Edit Mode Tool Button (Reset, Height, Rotation) - Screen 4
class EditToolBtn extends StatelessWidget {
  final String label;
  final IconData icon;

  const EditToolBtn({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xFF555555), // Dark Grey
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}