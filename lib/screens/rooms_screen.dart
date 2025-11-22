import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state_provider.dart';
import '../models/room.dart';

class RoomsScreen extends StatefulWidget {
  @override
  _RoomsScreenState createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(
      builder: (context, appState, child) {
        final rooms = appState.userRooms;
        final activeRoom = appState.activeRoom;
        final user = appState.currentUser;
        final skyDarkness = appState.skyDarkness;

        return Scaffold(
          appBar: AppBar(
            title: Text('My Rooms'),
            backgroundColor: Color(0xFF8BC34A),
            actions: [
              if (user != null && rooms.length < user.roomQuota)
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _showAddRoomDialog(context, appState),
                ),
            ],
          ),
          body: rooms.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home, size: 64, color: Colors.grey),
                      SizedBox(height: 16),
                      Text(
                        'No rooms yet',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => _showAddRoomDialog(context, appState),
                        child: Text('Create First Room'),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    // Room quota display
                    Container(
                      padding: EdgeInsets.all(16),
                      color: Color(0xFFF1F8E9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Room Quota: ${rooms.length}/${user?.roomQuota ?? 3}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (rooms.length >= (user?.roomQuota ?? 3))
                            TextButton.icon(
                              onPressed: () {
                                // Navigate to subscription or shop
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Upgrade to expand room quota'),
                                  ),
                                );
                              },
                              icon: Icon(Icons.add_circle),
                              label: Text('Expand Quota'),
                            ),
                        ],
                      ),
                    ),
                    // Room list
                    Expanded(
                      child: ListView.builder(
                        itemCount: rooms.length,
                        itemBuilder: (context, index) {
                          final room = rooms[index];
                          final isActive = activeRoom?.id == room.id;
                          
                          return Card(
                            margin: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            elevation: isActive ? 4 : 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: isActive
                                  ? BorderSide(
                                      color: Color(0xFF8BC34A),
                                      width: 2,
                                    )
                                  : BorderSide.none,
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RoomDetailScreen(room: room),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.home,
                                          color: Color(0xFF8BC34A),
                                          size: 32,
                                        ),
                                        SizedBox(width: 12),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                room.name,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 4),
                                              Text(
                                                '${room.furnitureIds.length} furniture items',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (isActive)
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 6,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Color(0xFF8BC34A),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Text(
                                              'Active',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    // Plant status
                                    if (room.plants.isNotEmpty)
                                      Wrap(
                                        spacing: 8,
                                        children: room.plants.map((plant) {
                                          return Chip(
                                            avatar: Icon(
                                              Icons.local_florist,
                                              size: 16,
                                              color: plant.isWithered
                                                  ? Colors.brown
                                                  : Colors.green,
                                            ),
                                            label: Text(
                                              '${plant.plantType}: ${plant.waterLevel.toInt()}%',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  void _showAddRoomDialog(BuildContext context, AppStateProvider appState) {
    final nameController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Create New Room'),
        content: TextField(
          controller: nameController,
          decoration: InputDecoration(
            labelText: 'Room Name',
            hintText: 'e.g., Living Room',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty) {
                appState.createNewRoom(nameController.text);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Room created successfully!')),
                );
              }
            },
            child: Text('Create'),
          ),
        ],
      ),
    );
  }
}

class RoomDetailScreen extends StatefulWidget {
  final Room room;

  const RoomDetailScreen({Key? key, required this.room}) : super(key: key);

  @override
  _RoomDetailScreenState createState() => _RoomDetailScreenState();
}

class _RoomDetailScreenState extends State<RoomDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(
      builder: (context, appState, child) {
        final skyDarkness = appState.skyDarkness;
        
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.room.name),
            backgroundColor: Color(0xFF8BC34A),
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _showAddFurnitureDialog(),
              ),
            ],
          ),
          body: Stack(
            children: [
              // Room background with time-based gradient
              AnimatedContainer(
                duration: Duration(seconds: 2),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.lerp(
                        Color(0xFFFFF8E1),
                        Color(0xFF424242),
                        skyDarkness,
                      )!,
                      Color.lerp(
                        Color(0xFFFFECB3),
                        Color(0xFF212121),
                        skyDarkness,
                      )!,
                    ],
                  ),
                ),
              ),

              // Furniture and items
              ...widget.room.placedItems.map((item) {
                return Positioned(
                  left: item.x,
                  top: item.y,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      setState(() {
                        item.x += details.delta.dx;
                        item.y += details.delta.dy;
                      });
                    },
                    child: Transform.rotate(
                      angle: item.rotation,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.brown[300],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.brown[700]!,
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.chair,
                          color: Colors.brown[700],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),

              // Plants
              ...widget.room.plants.asMap().entries.map((entry) {
                final index = entry.key;
                final plant = entry.value;
                final x = 50.0 + (index * 80.0);
                
                return Positioned(
                  left: x,
                  bottom: 100,
                  child: GestureDetector(
                    onTap: () => _waterPlant(plant),
                    child: Column(
                      children: [
                        Icon(
                          Icons.local_florist,
                          size: 48,
                          color: plant.isWithered
                              ? Colors.brown
                              : Colors.green,
                        ),
                        SizedBox(height: 4),
                        Container(
                          width: 60,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: plant.waterLevel / 100,
                            child: Container(
                              decoration: BoxDecoration(
                                color: plant.isWithered
                                    ? Colors.brown
                                    : Colors.blue,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),

              // Info panel at bottom
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Room Info',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildInfoChip(
                            Icons.chair,
                            'Furniture',
                            '${widget.room.furnitureIds.length}',
                          ),
                          _buildInfoChip(
                            Icons.local_florist,
                            'Plants',
                            '${widget.room.plants.length}',
                          ),
                          _buildInfoChip(
                            Icons.star,
                            'Decorations',
                            '${widget.room.decorationIds.length}',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _showAddPlantDialog(),
            backgroundColor: Color(0xFF8BC34A),
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }

  Widget _buildInfoChip(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: Color(0xFF8BC34A)),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  void _showAddFurnitureDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Furniture'),
        content: Text('Select furniture to add to your room.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                // Add furniture at a random position
                final x = 100.0 + (widget.room.placedItems.length * 50.0);
                widget.room.addFurniture('furniture_${DateTime.now().millisecondsSinceEpoch}', x, 200);
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Furniture added! Drag to reposition.')),
              );
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showAddPlantDialog() {
    final plantTypes = ['Rose', 'Tulip', 'Sunflower', 'Cactus', 'Fern'];
    String selectedType = plantTypes[0];
    
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text('Add Plant'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Choose a plant type:'),
              SizedBox(height: 16),
              DropdownButton<String>(
                value: selectedType,
                isExpanded: true,
                items: plantTypes.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setDialogState(() {
                      selectedType = value;
                    });
                  }
                },
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
                setState(() {
                  widget.room.addPlant(Plant(
                    id: 'plant_${DateTime.now().millisecondsSinceEpoch}',
                    plantType: selectedType,
                  ));
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$selectedType added!')),
                );
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  void _waterPlant(Plant plant) {
    setState(() {
      plant.water();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${plant.plantType} watered!'),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
