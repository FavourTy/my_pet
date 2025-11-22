import 'package:flutter/material.dart';
import '../services/subscription_service.dart';

class SubscriptionScreen extends StatelessWidget {
  final SubscriptionService _subscriptionService = SubscriptionService();

  @override
  Widget build(BuildContext context) {
    final benefits = _subscriptionService.getPaidMembershipBenefits();

    return Scaffold(
      appBar: AppBar(
        title: Text('Premium Membership'),
        backgroundColor: Colors.amber[700],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.amber[400]!, Colors.orange[600]!],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Icon(Icons.workspace_premium, size: 80, color: Colors.white),
                SizedBox(height: 16),
                Text(
                  'Unlock Premium Features',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  'Get exclusive access to all premium features',
                  style: TextStyle(color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          SizedBox(height: 32),

          // Benefits
          Text(
            'Premium Benefits',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),

          ...benefits.map((benefit) => _buildBenefitItem(benefit)),

          SizedBox(height: 32),

          // Subscription plans
          _buildSubscriptionPlan(
            title: 'Monthly',
            price: '\$9.99',
            period: '/month',
            onTap: () {
              _showPurchaseConfirmation(context, 'Monthly');
            },
          ),

          SizedBox(height: 16),

          _buildSubscriptionPlan(
            title: 'Yearly',
            price: '\$99.99',
            period: '/year',
            savings: 'Save 17%',
            isRecommended: true,
            onTap: () {
              _showPurchaseConfirmation(context, 'Yearly');
            },
          ),

          SizedBox(height: 24),

          // Restore purchases
          TextButton(
            onPressed: () async {
              // Restore purchases
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Restoring purchases...')),
              );
            },
            child: Text('Restore Purchases'),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitItem(String benefit) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green[600], size: 24),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              benefit,
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionPlan({
    required String title,
    required String price,
    required String period,
    String? savings,
    bool isRecommended = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            color: isRecommended ? Colors.amber[600]! : Colors.grey[300]!,
            width: isRecommended ? 3 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            if (isRecommended)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.amber[600],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'RECOMMENDED',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            if (isRecommended) SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber[700],
                      ),
                    ),
                    Text(
                      period,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
            if (savings != null) ...[
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  savings,
                  style: TextStyle(
                    color: Colors.green[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _showPurchaseConfirmation(BuildContext context, String plan) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Purchase'),
        content: Text('Subscribe to $plan plan?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Processing subscription...')),
              );
            },
            child: Text('Subscribe'),
          ),
        ],
      ),
    );
  }
}
