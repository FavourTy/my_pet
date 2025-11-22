import 'package:flutter/material.dart';
import '../models/event.dart';

class EventPlazaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Plaza'),
        backgroundColor: Colors.deepPurple[700],
        actions: [
          IconButton(
            icon: Icon(Icons.card_giftcard),
            onPressed: () {
              // Show tickets
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple[400]!, Colors.purple[600]!],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 32),
                    SizedBox(width: 12),
                    Text(
                      'Exclusive Events',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'Paid members only! Special monthly events with exclusive items.',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),

          SizedBox(height: 24),

          // Active events
          Text(
            'Active Events',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),

          ..._getMockEvents().map((event) => _buildEventCard(context, event)),
        ],
      ),
    );
  }

  Widget _buildEventCard(BuildContext context, GameEvent event) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Event banner
          Container(
            height: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple[300]!, Colors.pink[300]!],
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Center(
              child: Icon(Icons.event, size: 80, color: Colors.white),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        event.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.red[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${event.daysRemaining} days left',
                        style: TextStyle(
                          color: Colors.red[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  event.description,
                  style: TextStyle(color: Colors.grey[700]),
                ),
                SizedBox(height: 12),
                
                // Exclusive items count
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    SizedBox(width: 8),
                    Text(
                      '${event.exclusiveItemIds.length} Exclusive Items',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.purple[800],
                      ),
                    ),
                  ],
                ),
                
                SizedBox(height: 16),
                
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to event details
                    },
                    child: Text('View Event'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple[600],
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
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

  List<GameEvent> _getMockEvents() {
    return [
      GameEvent(
        id: 'event_1',
        title: 'Spring Festival',
        description: 'Limited time spring-themed items and decorations!',
        type: EventType.seasonal,
        startDate: DateTime.now().subtract(Duration(days: 5)),
        endDate: DateTime.now().add(Duration(days: 25)),
        exclusiveItemIds: ['item_1', 'item_2', 'item_3', 'item_4'],
        isPaidMemberOnly: true,
      ),
      GameEvent(
        id: 'event_2',
        title: 'Super Rare Gacha',
        description: 'Increased drop rates for legendary items!',
        type: EventType.limited,
        startDate: DateTime.now().subtract(Duration(days: 2)),
        endDate: DateTime.now().add(Duration(days: 5)),
        exclusiveItemIds: ['item_5', 'item_6'],
        isPaidMemberOnly: true,
      ),
    ];
  }
}
