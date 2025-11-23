// import 'package:flutter/material.dart';
// import 'dart:math' as math;

// class Room {
//   String id;
//   String name;
//   bool isDirty;
//   Room({required this.id, required this.name, this.isDirty = false});
// }

// // --
// class GameRoomScreen extends StatefulWidget {
//   const GameRoomScreen({super.key});

//   @override
//   _GameRoomScreenState createState() => _GameRoomScreenState();
// }

// class _GameRoomScreenState extends State<GameRoomScreen> {
//   // State Logic
//   bool _isDirtyMode = false; // Toggles the "Messy" view
//   int _lovePoints = 123;
//   int _tickets = 5;
//   int _coins = 12345;

//   // Mock Room Data
//   final Room _currentRoom = Room(id: '1', name: 'Living Room');

//   void _toggleDirtyMode() {
//     setState(() {
//       _isDirtyMode = !_isDirtyMode;
//     });
//   }

//   void _handleMainAction() {
//     if (_isDirtyMode) {
//       // Logic for "Clean Up"
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Cleaning up the room... ✨"),
//           duration: Duration(seconds: 1),
//         ),
//       );
//       Future.delayed(const Duration(seconds: 1), () {
//         setState(() => _isDirtyMode = false);
//       });
//     } else {
//       // Logic for "Take Care" - Show the Modal
//       showDialog(context: context, builder: (context) => _buildCareDialog());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Full screen size for responsive calculations
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: Stack(
//         children: [
//           // -----------------------------------------
//           // LAYER 1: BACKGROUND (THE ROOM)
//           // -----------------------------------------
//           Positioned.fill(
//             child: Container(
//               decoration: const BoxDecoration(
//                 // Placeholder for your room image asset
//                 color: Color(0xFFF5E6CA),
//                 image: DecorationImage(
//                   image: NetworkImage(
//                     'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?q=80&w=2000',
//                   ),
//                   fit: BoxFit.cover,
//                   opacity: 0.8,
//                 ),
//               ),
//             ),
//           ),

//           // -----------------------------------------
//           // LAYER 2: FURNITURE & PETS
//           // -----------------------------------------
//           // Example: Table
//           Positioned(
//             bottom: 100,
//             right: -50,
//             child: Image.network(
//               'https://cdn-icons-png.flaticon.com/512/1663/1663952.png', // Placeholder Table
//               height: 200,
//             ),
//           ),

//           // Example: The Dog (Center stage)
//           Positioned(
//             bottom: 80,
//             left: size.width * 0.3,
//             child: _buildPetAvatar(),
//           ),

//           // -----------------------------------------
//           // LAYER 3: DIRTY OVERLAY (If Active)
//           // -----------------------------------------
//           if (_isDirtyMode) ...[
//             // Mud stains
//             Positioned(bottom: 50, left: 50, child: _buildMudStain()),
//             Positioned(bottom: 150, right: 80, child: _buildMudStain()),
//             Positioned(bottom: 20, right: 20, child: _buildMudStain()),
//             // Dark overlay to make it look gloomy
//             Positioned.fill(
//               child: Container(color: Colors.black.withOpacity(0.3)),
//             ),
//           ],

//           // -----------------------------------------
//           // LAYER 4: GAME HUD (Top Bar)
//           // -----------------------------------------
//           Positioned(
//             top: 50, // Safe area padding
//             left: 16,
//             right: 16,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // Love / Heart Counter
//                 _buildStatusChip(
//                   icon: Icons.favorite,
//                   color: Colors.pinkAccent,
//                   label: "$_lovePoints/1000",
//                   width: 130,
//                 ),

//                 // Spacer
//                 const SizedBox(width: 8),

//                 // Ticket Counter
//                 _buildStatusChip(
//                   icon: Icons.confirmation_number,
//                   color: Colors.blueGrey,
//                   label: "$_tickets",
//                   width: 80,
//                 ),

//                 const SizedBox(width: 8),

//                 // Coin Counter
//                 _buildStatusChip(
//                   icon: Icons.monetization_on,
//                   color: Colors.amber,
//                   label: "$_coins",
//                   width: 90,
//                 ),
//               ],
//             ),
//           ),

//           // -----------------------------------------
//           // LAYER 5: MAIN ACTION BUTTON
//           // -----------------------------------------
//           Positioned(
//             top: size.height * 0.4, // Center vertically roughly
//             left: 0,
//             right: 0,
//             child: Center(
//               child: GestureDetector(
//                 onTap: _handleMainAction,
//                 child: _buildMainActionButton(),
//               ),
//             ),
//           ),

//           // -----------------------------------------
//           // DEV TOOLS (For testing UI)
//           // -----------------------------------------
//           Positioned(
//             bottom: 20,
//             left: 20,
//             child: FloatingActionButton.small(
//               onPressed: _toggleDirtyMode,
//               backgroundColor: Colors.grey,
//               child: const Icon(Icons.cleaning_services),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // --- WIDGET BUILDERS ---

//   Widget _buildPetAvatar() {
//     return Container(
//       height: 150,
//       width: 150,
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           // Replace with your 3D dog render or Rive asset
//           image: NetworkImage(
//             "https://cdn-icons-png.flaticon.com/512/616/616408.png",
//           ),
//         ),
//       ),
//       // Add animation logic here later
//     );
//   }

//   Widget _buildMudStain() {
//     return Opacity(
//       opacity: 0.8,
//       child: Image.network(
//         'https://cdn-icons-png.flaticon.com/512/785/785118.png', // Mud icon
//         width: 100,
//         color: Colors.brown[800],
//       ),
//     );
//   }

//   Widget _buildStatusChip({
//     required IconData icon,
//     required Color color,
//     required String label,
//     required double width,
//   }) {
//     return Container(
//       height: 36,
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.9),
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon, color: color, size: 20),
//           const SizedBox(width: 4),
//           Text(
//             label,
//             style: const TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.bold,
//               color: Colors.black54,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMainActionButton() {
//     // Styles change based on Dirty Mode
//     final Color bgColor = _isDirtyMode
//         ? Colors.red
//         : const Color(0xFFFFF176); // Red vs Yellow
//     final Color borderColor = _isDirtyMode
//         ? Colors.redAccent
//         : Colors.yellowAccent;
//     final String text = _isDirtyMode ? "Clean up" : "Take care";
//     final Color textColor = _isDirtyMode ? Colors.white : Colors.brown;

//     return Container(
//       width: 140,
//       height: 140,
//       decoration: BoxDecoration(
//         color: bgColor.withOpacity(0.8), // Semi transparent
//         shape: BoxShape.circle,
//         border: Border.all(color: Colors.white.withOpacity(0.5), width: 4),
//         boxShadow: [
//           BoxShadow(
//             color: bgColor.withOpacity(0.4),
//             blurRadius: 20,
//             spreadRadius: 5,
//           ),
//         ],
//       ),
//       child: Center(
//         child: Text(
//           text,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: textColor,
//             fontSize: 22,
//             fontWeight: FontWeight.bold,
//             fontFamily:
//                 'Rounded', // Ensure you have a rounded font or remove this
//           ),
//         ),
//       ),
//     );
//   }

//   // --- POPUP DIALOG (Matches "Take Care" Screenshot) ---
//   Widget _buildCareDialog() {
//     return Dialog(
//       backgroundColor: Colors.transparent,
//       insetPadding: const EdgeInsets.all(10),
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           // The White Card
//           Container(
//             width: 320,
//             padding: const EdgeInsets.only(
//               top: 40,
//               bottom: 20,
//               left: 20,
//               right: 20,
//             ),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Title
//                 const Text(
//                   "Take care in the living room",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black54,
//                   ),
//                 ),
//                 const SizedBox(height: 20),

//                 // Options Grid
//                 Wrap(
//                   spacing: 10,
//                   runSpacing: 10,
//                   children: [
//                     _buildCareOption(
//                       "Care",
//                       isSelected: true,
//                     ), // The checkbox style
//                     _buildCareOption("Dry shampoo", icon: Icons.cut),
//                     _buildCareOption("Clean the sheets", icon: Icons.bed),
//                     _buildCareOption("Tooth brushing", icon: Icons.clean_hands),
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           // The "Close" X button (Top Right of card)
//           Positioned(
//             right: 0,
//             top: 0,
//             child: IconButton(
//               icon: const Icon(Icons.close, color: Colors.white),
//               onPressed: () => Navigator.pop(context),
//             ),
//           ),

//           // Decorative Question Mark (from screenshot)
//           Positioned(
//             top: -10,
//             right: 20,
//             child: Container(
//               padding: const EdgeInsets.all(8),
//               decoration: const BoxDecoration(
//                 color: Color(0xFFFFF176),
//                 shape: BoxShape.circle,
//               ),
//               child: const Icon(
//                 Icons.question_mark,
//                 color: Colors.brown,
//                 size: 20,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCareOption(
//     String label, {
//     IconData? icon,
//     bool isSelected = false,
//   }) {
//     return Container(
//       width: 130,
//       padding: const EdgeInsets.all(8),
//       child: Row(
//         children: [
//           // The "Box"
//           Container(
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               color: Colors.grey[300],
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: isSelected
//                 ? const Icon(Icons.check, color: Colors.grey)
//                 : (icon != null
//                       ? Icon(icon, size: 20, color: Colors.brown)
//                       : null),
//           ),
//           const SizedBox(width: 8),
//           // The Label
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
//               decoration: BoxDecoration(
//                 color: icon != null
//                     ? const Color(0xFFFFF176)
//                     : null, // Yellow highlight for actions
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Text(
//                 label,
//                 style: const TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black54,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math;

// ============================================================================
// PREVIOUS CODE - COMMENTED OUT AS REQUESTED
// ============================================================================
/*
// --- UPDATED: Added Bedroom to Locations ---
enum GameLocation { livingRoom, bathroom, bedroom }

enum PetActivity { idle, bathing, brushing, cleaningSheets, toileting }

class Room {
  String id;
  String name;
  bool isDirty;
  Room({required this.id, required this.name, this.isDirty = false});
}

class GameRoomScreen extends StatefulWidget {
  const GameRoomScreen({super.key});

  @override
  _GameRoomScreenState createState() => _GameRoomScreenState();
}

class _GameRoomScreenState extends State<GameRoomScreen> {
  // --- STATE VARIABLES ---
  GameLocation _location = GameLocation.livingRoom;
  PetActivity _activity = PetActivity.idle;

  bool _isDirtyMode = false;

  // Activity Progress Logic
  double _progressValue = 0.0;
  String _currentActionText = "";
  Timer? _activityTimer;

  // Stats
  int _lovePoints = 123;
  int _tickets = 5;
  int _coins = 12345;

  // --- ASSETS (Placeholders) ---
  final String _bgLivingRoom =
      'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?q=80&w=2000';
  final String _bgBathroom =
      'https://images.unsplash.com/photo-1584622050111-993a426fbf0a?q=80&w=2000';
  // NEW: Bedroom Background
  final String _bgBedroom =
      'https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?q=80&w=2000';

  // Furniture Icons
  final String _iconBed =
      "https://cdn-icons-png.flaticon.com/512/3014/3014526.png";
  final String _iconTub =
      "https://cdn-icons-png.flaticon.com/512/2239/2239318.png";
  final String _iconSink =
      "https://cdn-icons-png.flaticon.com/512/3131/3131848.png";
  // NEW: Toilet & Sofa Icons
  final String _iconToilet =
      "https://cdn-icons-png.flaticon.com/512/2203/2203644.png";
  final String _iconSofa =
      "https://cdn-icons-png.flaticon.com/512/2511/2511419.png";

  @override
  void dispose() {
    _activityTimer?.cancel();
    super.dispose();
  }

  // --- GAME ENGINE LOGIC ---

  void _toggleDirtyMode() {
    if (_activity != PetActivity.idle) return;
    setState(() {
      _isDirtyMode = !_isDirtyMode;
      _location = GameLocation.livingRoom; // Dirty mode is in living room
    });
  }

  void _startActivity(
    PetActivity activity,
    GameLocation targetLocation,
    String label,
    int durationSeconds,
  ) {
    Navigator.pop(context); // Close dialog

    setState(() {
      _location = targetLocation; // Teleport
      _activity = activity; // Set animation state
      _currentActionText = label;
      _progressValue = 0.0;
    });

    _activityTimer?.cancel();
    _activityTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (!mounted) return;
      setState(() {
        _progressValue += 1 / (durationSeconds * 10);
      });
      if (_progressValue >= 1.0) {
        timer.cancel();
        _finishActivity();
      }
    });
  }

  void _finishActivity() {
    setState(() {
      _activity = PetActivity.idle;
      _lovePoints += 50;
      _coins += 100;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("✨ Task Complete! Great job!"),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _handleMainAction() {
    if (_isDirtyMode) {
      // Logic for "Clean Up" (Mud) - Keep in Living Room
      _startActivity(
        PetActivity.cleaningSheets,
        GameLocation.livingRoom,
        "Cleaning Mud...",
        2,
      );
      Future.delayed(
        const Duration(seconds: 2),
        () => setState(() => _isDirtyMode = false),
      );
    } else {
      // Logic for "Take Care"
      showDialog(context: context, builder: (context) => _buildCareDialog());
    }
  }

  // --- RESPONSIVE BACKGROUND IMAGE HELPER ---
  String _getBackgroundImage() {
    switch (_location) {
      case GameLocation.bathroom:
        return _bgBathroom;
      case GameLocation.bedroom:
        return _bgBedroom;
      case GameLocation.livingRoom:
      default:
        return _bgLivingRoom;
    }
  }

  // --- BUILD METHOD ---

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isHub =
        _location == GameLocation.livingRoom; // "Hub" is the main room

    return Scaffold(
      body: Stack(
        children: [
          // -----------------------------------------
          // LAYER 1: ANIMATED BACKGROUND
          // -----------------------------------------
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 800),
            child: Container(
              key: ValueKey(_location),
              decoration: BoxDecoration(
                color: const Color(0xFFF5E6CA),
                image: DecorationImage(
                  image: NetworkImage(_getBackgroundImage()),
                  fit: BoxFit.cover,
                  opacity: 0.9,
                ),
              ),
            ),
          ),

          // -----------------------------------------
          // LAYER 2: FURNITURE (Per Room)
          // -----------------------------------------

          // LIVING ROOM: Sofa (Since bed moved to bedroom)
          if (_location == GameLocation.livingRoom)
            Positioned(
              bottom: size.height * 0.25,
              left: size.width * 0.1,
              child: Image.network(_iconSofa, width: size.width * 0.4),
            ),

          // BEDROOM: Bed
          if (_location == GameLocation.bedroom)
            Positioned(
              bottom: size.height * 0.25,
              left: size.width * 0.1, // Centered-ish
              child: Image.network(_iconBed, width: size.width * 0.5),
            ),

          // BATHROOM: Sink, Tub, Toilet
          if (_location == GameLocation.bathroom) ...[
            // Sink (Left)
            Positioned(
              bottom: size.height * 0.25,
              left: 10,
              child: Image.network(_iconSink, width: size.width * 0.25),
            ),
            // Toilet (Middle-Left)
            Positioned(
              bottom: size.height * 0.25,
              left: size.width * 0.35,
              child: Image.network(_iconToilet, width: size.width * 0.15),
            ),
            // Tub (Right)
            Positioned(
              bottom: size.height * 0.22,
              right: -10,
              child: Image.network(_iconTub, width: size.width * 0.45),
            ),
          ],

          // -----------------------------------------
          // LAYER 3: THE DOG (Animated Position)
          // -----------------------------------------
          AnimatedPositioned(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOutBack,
            bottom: _getDogBottomPos(size),
            left: _getDogLeftPos(size),
            child: _buildPetAvatar(),
          ),

          // -----------------------------------------
          // LAYER 4: VISUAL EFFECTS (Bubbles)
          // -----------------------------------------
          if (_activity == PetActivity.bathing)
            Positioned(
              bottom: size.height * 0.25,
              right: size.width * 0.15,
              child: const Icon(
                Icons.bubble_chart,
                color: Colors.white70,
                size: 50,
              ),
            ),

          // -----------------------------------------
          // LAYER 5: DIRTY OVERLAY (Living Room Only)
          // -----------------------------------------
          if (_isDirtyMode && _location == GameLocation.livingRoom) ...[
            Positioned.fill(
              child: Container(color: Colors.black.withOpacity(0.3)),
            ),
            Positioned(bottom: 50, left: 50, child: _buildMudStain()),
            Positioned(bottom: 150, right: 80, child: _buildMudStain()),
          ],

          // -----------------------------------------
          // LAYER 6: HUD & CONTROLS
          // -----------------------------------------

          // Top Stats Bar
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 16,
            right: 16,
            child: _buildTopHud(),
          ),

          // MAIN BUTTON (Only when IDLE)
          if (_activity == PetActivity.idle)
            Positioned(
              top: size.height * 0.4,
              left: 0,
              right: 0,
              child: Center(
                child: GestureDetector(
                  onTap: _handleMainAction,
                  child: _buildMainActionButton(),
                ),
              ),
            ),

          // PROGRESS BAR (Only when BUSY)
          if (_activity != PetActivity.idle)
            Positioned(
              bottom: size.height * 0.15,
              left: 40,
              right: 40,
              child: _buildProgressBar(),
            ),

          // "BACK TO ROOM" Button (If NOT in Living Room & Idle)
          if (!isHub && _activity == PetActivity.idle)
            Positioned(
              bottom: 30,
              left: 30,
              child: FloatingActionButton.extended(
                onPressed: () =>
                    setState(() => _location = GameLocation.livingRoom),
                label: const Text("Main Room"),
                icon: const Icon(Icons.door_back_door),
                backgroundColor: Colors.brown,
              ),
            ),

          // Dirty Toggle (Test Button - Only in Living Room)
          if (isHub && _activity == PetActivity.idle)
            Positioned(
              bottom: 30,
              left: 30,
              child: FloatingActionButton.small(
                onPressed: _toggleDirtyMode,
                backgroundColor: Colors.grey,
                child: const Icon(Icons.cleaning_services),
              ),
            ),
        ],
      ),
    );
  }

  // --- COORDINATE CALCULATOR ---
  double _getDogBottomPos(Size size) {
    // BATHROOM POSITIONS
    if (_location == GameLocation.bathroom) {
      if (_activity == PetActivity.bathing)
        return size.height * 0.28; // High (in tub)
      if (_activity == PetActivity.brushing)
        return size.height * 0.2; // Lower (at sink)
      if (_activity == PetActivity.toileting)
        return size.height * 0.22; // On toilet
      return size.height * 0.1; // Floor center
    }
    // BEDROOM POSITIONS
    if (_location == GameLocation.bedroom) {
      if (_activity == PetActivity.cleaningSheets)
        return size.height * 0.3; // On bed
      return size.height * 0.1;
    }
    // LIVING ROOM
    return size.height * 0.1; // Floor center
  }

  double _getDogLeftPos(Size size) {
    // BATHROOM POSITIONS
    if (_location == GameLocation.bathroom) {
      if (_activity == PetActivity.bathing)
        return size.width * 0.65; // Right (Tub)
      if (_activity == PetActivity.brushing)
        return size.width * 0.1; // Left (Sink)
      if (_activity == PetActivity.toileting)
        return size.width * 0.38; // Mid-Left (Toilet)
      return size.width * 0.5; // Center room
    }
    // BEDROOM POSITIONS
    if (_location == GameLocation.bedroom) {
      if (_activity == PetActivity.cleaningSheets)
        return size.width * 0.25; // On bed
      return size.width * 0.4;
    }
    // LIVING ROOM
    return size.width * 0.35; // Center
  }

  // --- WIDGET BUILDERS ---

  Widget _buildProgressBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            _currentActionText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: _progressValue,
            backgroundColor: Colors.white30,
            color: Colors.yellowAccent,
            minHeight: 10,
            borderRadius: BorderRadius.circular(5),
          ),
        ],
      ),
    );
  }

  Widget _buildPetAvatar() {
    return Container(
      height: 150,
      width: 150,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            "https://cdn-icons-png.flaticon.com/512/616/616408.png",
          ),
        ),
      ),
    );
  }

  Widget _buildMudStain() {
    return Opacity(
      opacity: 0.8,
      child: Image.network(
        'https://cdn-icons-png.flaticon.com/512/785/785118.png',
        width: 100,
        color: Colors.brown[800],
      ),
    );
  }

  Widget _buildTopHud() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStatusChip(
          icon: Icons.favorite,
          color: Colors.pinkAccent,
          label: "$_lovePoints",
          width: 100,
        ),
        const Spacer(),
        _buildStatusChip(
          icon: Icons.confirmation_number,
          color: Colors.blueGrey,
          label: "$_tickets",
          width: 70,
        ),
        const SizedBox(width: 8),
        _buildStatusChip(
          icon: Icons.monetization_on,
          color: Colors.amber,
          label: "$_coins",
          width: 90,
        ),
      ],
    );
  }

  Widget _buildStatusChip({
    required IconData icon,
    required Color color,
    required String label,
    required double width,
  }) {
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainActionButton() {
    final Color bgColor = _isDirtyMode ? Colors.red : const Color(0xFFFFF176);
    final String text = _isDirtyMode ? "Clean up" : "Take care";

    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        color: bgColor.withOpacity(0.9),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 4),
        boxShadow: [
          BoxShadow(
            color: bgColor.withOpacity(0.4),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: _isDirtyMode ? Colors.white : Colors.brown,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // --- DIALOG ---
  Widget _buildCareDialog() {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 320,
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Take care of the dog",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    // 1. DRY SHAMPOO -> BATHROOM / TUB
                    _buildCareOption(
                      "Dry shampoo",
                      icon: Icons.shower,
                      onTap: () {
                        _startActivity(
                          PetActivity.bathing,
                          GameLocation.bathroom,
                          "Bathing & Drying...",
                          4,
                        );
                      },
                    ),

                    // 2. TOOTH BRUSHING -> BATHROOM / SINK
                    _buildCareOption(
                      "Tooth brushing",
                      icon: Icons.clean_hands,
                      onTap: () {
                        _startActivity(
                          PetActivity.brushing,
                          GameLocation.bathroom,
                          "Brushing Teeth...",
                          3,
                        );
                      },
                    ),

                    // 3. CLEAN SHEETS -> BEDROOM / BED
                    _buildCareOption(
                      "Clean the sheets",
                      icon: Icons.bed,
                      onTap: () {
                        _startActivity(
                          PetActivity.cleaningSheets,
                          GameLocation.bedroom,
                          "Changing Sheets...",
                          3,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCareOption(
    String label, {
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF176),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 20, color: Colors.brown),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
