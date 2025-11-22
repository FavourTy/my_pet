import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../providers/app_state_provider.dart';
import '../models/gacha.dart';
import '../models/item.dart';
import '../services/gacha_service.dart';

class GachaScreen extends StatefulWidget {
  @override
  _GachaScreenState createState() => _GachaScreenState();
}

class _GachaScreenState extends State<GachaScreen> {
  final GachaService _gachaService = GachaService();
  bool _isRolling = false;
  GachaResult? _lastResult;
  List<GachaResult>? _multiResults;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gacha'),
        backgroundColor: Colors.purple[700],
      ),
      body: Consumer<AppStateProvider>(
        builder: (context, appState, child) {
          final user = appState.currentUser;
          
          return Stack(
            children: [
              // Background gradient
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.purple[900]!,
                      Colors.purple[600]!,
                      Colors.pink[400]!,
                    ],
                  ),
                ),
              ),

              // Content
              SafeArea(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    
                    // Coin display
                    _buildCoinDisplay(user?.coins ?? 0),
                    
                    SizedBox(height: 40),
                    
                    // Gacha machine animation area
                    Expanded(
                      child: Center(
                        child: _buildGachaMachine(),
                      ),
                    ),
                    
                    // Pull buttons
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildPullButton(
                            label:  'Pull x1',
                              cost: 100,
                              onTap: () => _performSinglePull(user!),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: _buildPullButton(
                            label:  'Pull x10',
                              cost: 900,
                              isSpecial: true,
                              onTap: () => _performMultiPull(user!),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Result overlay
              if (_lastResult != null || _multiResults != null)
                _buildResultOverlay(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCoinDisplay(int coins) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.monetization_on, color: Colors.amber, size: 28),
          SizedBox(width: 8),
          Text(
            '$coins Coins',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGachaMachine() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: 250,
      height: 350,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_isRolling)
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
            ).animate(onPlay: (controller) => controller.repeat())
              .rotate(duration: 1.seconds)
          else
            Icon(
              Icons.card_giftcard,
              size: 100,
              color: Colors.purple[300],
            ),
          
          SizedBox(height: 20),
          
          Text(
            _isRolling ? 'Rolling...' : 'Ready to Pull!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.purple[900],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPullButton({
    required String label,
    required int cost,
    required VoidCallback onTap,
    bool isSpecial = false,
  }) {
    return ElevatedButton(
      onPressed: _isRolling ? null : onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSpecial ? Colors.amber[600] : Colors.purple[600],
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            '$cost Coins',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Future<void> _performSinglePull(user) async {
    if (user.coins < 100) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Not enough coins!')),
      );
      return;
    }

    setState(() {
      _isRolling = true;
      _multiResults = null;
    });

    await Future.delayed(Duration(seconds: 2));

    // Mock gacha banner - in real app, fetch from backend
    final banner = _createMockBanner();
    final result = await _gachaService.pullGacha(user.id, banner);

    // Deduct coins
    Provider.of<AppStateProvider>(context, listen: false)
        .deductCoinsFromUser(100);

    setState(() {
      _lastResult = result;
      _isRolling = false;
    });
  }

  Future<void> _performMultiPull(user) async {
    if (user.coins < 900) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Not enough coins!')),
      );
      return;
    }

    setState(() {
      _isRolling = true;
      _lastResult = null;
    });

    await Future.delayed(Duration(seconds: 3));

    final banner = _createMockBanner();
    final results = await _gachaService.pullMultiGacha(user.id, banner, 10);

    // Deduct coins
    Provider.of<AppStateProvider>(context, listen: false)
        .deductCoinsFromUser(900);

    setState(() {
      _multiResults = results;
      _isRolling = false;
    });
  }

  GachaBanner _createMockBanner() {
    return GachaBanner(
      id: 'banner_1',
      name: 'Standard Banner',
      description: 'Try your luck!',
      costInCoins: 100,
      pools: [
        GachaPool(
          rarity: ItemRarity.common,
          dropRate: 70.0,
          itemIds: ['item_1', 'item_2', 'item_3'],
        ),
        GachaPool(
          rarity: ItemRarity.rare,
          dropRate: 25.0,
          itemIds: ['item_4', 'item_5'],
        ),
        GachaPool(
          rarity: ItemRarity.epic,
          dropRate: 4.5,
          itemIds: ['item_6'],
        ),
        GachaPool(
          rarity: ItemRarity.legendary,
          dropRate: 0.5,
          itemIds: ['item_7'],
        ),
      ],
      startDate: DateTime.now().subtract(Duration(days: 7)),
      endDate: DateTime.now().add(Duration(days: 7)),
    );
  }

  Widget _buildResultOverlay() {
    return Container(
      color: Colors.black.withOpacity(0.8),
      child: Center(
        child: Container(
          margin: EdgeInsets.all(40),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _multiResults != null ? 'You Got ${_multiResults!.length} Items!' : 'You Got:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              
              if (_lastResult != null)
                _buildResultCard(_lastResult!),
              
              if (_multiResults != null)
                ..._multiResults!.map((r) => _buildResultCard(r)).toList(),
              
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _lastResult = null;
                    _multiResults = null;
                  });
                },
                child: Text('Close'),
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn();
  }

  Widget _buildResultCard(GachaResult result) {
    Color rarityColor;
    switch (result.rarity) {
      case ItemRarity.legendary:
        rarityColor = Colors.purple[700]!;
        break;
      case ItemRarity.epic:
        rarityColor = Colors.indigo[600]!;
        break;
      case ItemRarity.rare:
        rarityColor = Colors.blue[600]!;
        break;
      default:
        rarityColor = Colors.grey[600]!;
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [rarityColor.withOpacity(0.3), rarityColor.withOpacity(0.1)],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: rarityColor, width: 2),
      ),
      child: Row(
        children: [
          Icon(Icons.star, color: rarityColor, size: 40),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  result.itemId,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  result.rarity.name.toUpperCase(),
                  style: TextStyle(
                    fontSize: 12,
                    color: rarityColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().scale(delay: 200.ms);
  }
}
