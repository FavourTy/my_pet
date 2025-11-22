import 'package:flutter/material.dart';
import '../models/item.dart';

class BazaarScreen extends StatefulWidget {
  @override
  _BazaarScreenState createState() => _BazaarScreenState();
}

class _BazaarScreenState extends State<BazaarScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bazaar'),
        backgroundColor: Colors.green[700],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Buy', icon: Icon(Icons.shopping_cart)),
            Tab(text: 'My Listings', icon: Icon(Icons.sell)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildBuyTab(),
          _buildSellTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showListItemDialog,
        icon: Icon(Icons.add),
        label: Text('List Item'),
        backgroundColor: Colors.green[600],
      ),
    );
  }

  Widget _buildBuyTab() {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 20,
      itemBuilder: (context, index) => _buildBazaarItemCard(index),
    );
  }

  Widget _buildSellTab() {
    return Center(
      child: Text('Your listings will appear here'),
    );
  }

  Widget _buildBazaarItemCard(int index) {
    final price = (index + 1) * 150;
    
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green[200]!, Colors.green[400]!],
                ),
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Icon(Icons.inventory_2, size: 64, color: Colors.white),
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
                Text(
                  'Seller: User${index}',
                  style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.monetization_on, size: 18, color: Colors.amber),
                    SizedBox(width: 4),
                    Text(
                      '$price',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _showPurchaseDialog(index, price);
                    },
                    child: Text('Purchase', style: TextStyle(fontSize: 12)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[600],
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

  void _showPurchaseDialog(int index, int price) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Purchase Item'),
        content: Text('Buy Item ${index + 1} for $price coins?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Item purchased!')),
              );
            },
            child: Text('Buy'),
          ),
        ],
      ),
    );
  }

  void _showListItemDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('List Item for Sale'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Select Item',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                labelText: 'Price (coins)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Item listed!')),
              );
            },
            child: Text('List'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
