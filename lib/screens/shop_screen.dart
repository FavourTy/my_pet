import 'package:flutter/material.dart';
import '../models/item.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  ItemCategory _selectedCategory = ItemCategory.food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        backgroundColor: Colors.orange[700],
      ),
      body: Column(
        children: [
          // Category tabs
          Container(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: ItemCategory.values.map((category) {
                final isSelected = _selectedCategory == category;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 12),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.orange[600] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        category.name.toUpperCase(),
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          // Items grid
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: 12,
              itemBuilder: (context, index) => _buildItemCard(index),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemCard(int index) {
    final rarities = [ItemRarity.common, ItemRarity.rare, ItemRarity.epic, ItemRarity.legendary];
    final rarity = rarities[index % rarities.length];
    
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: _getRarityColor(rarity),
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Icon(Icons.shopping_bag, size: 64, color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Item ${index + 1}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.monetization_on, size: 16, color: Colors.amber),
                    SizedBox(width: 4),
                    Text('${(index + 1) * 100}'),
                  ],
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Buy', style: TextStyle(fontSize: 12)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[600],
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getRarityColor(ItemRarity rarity) {
    switch (rarity) {
      case ItemRarity.legendary:
        return Colors.purple[700]!;
      case ItemRarity.epic:
        return Colors.indigo[600]!;
      case ItemRarity.rare:
        return Colors.blue[600]!;
      default:
        return Colors.grey[600]!;
    }
  }
}
