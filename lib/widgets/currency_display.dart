import 'package:flutter/material.dart';
import '../models/user.dart';

class CurrencyDisplay extends StatelessWidget {
  final User user;

  const CurrencyDisplay({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildCurrencyItem(
          icon: Icons.circle,
          color: Colors.yellow[600]!,
          value: user.points,
        ),
        SizedBox(width: 8),
        _buildCurrencyItem(
          icon: Icons.monetization_on,
          color: Colors.amber[700]!,
          value: user.coins,
        ),
      ],
    );
  }

  Widget _buildCurrencyItem({
    required IconData icon,
    required Color color,
    required int value,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(11),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 16),
          SizedBox(width: 4),
          Text(
            '$value',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF8C8C8C),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
