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

// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'dart:math' as math;
// import 'package:model_viewer_plus/model_viewer_plus.dart';

// // --- MAIN ENTRY POINT ---
// void main() {
//   runApp(
//     const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: GameRoomScreen(),
//     ),
//   );
// }

// // --- ENUMS ---
// enum GameLocation { livingRoom, bathroom, bedroom }

// enum PetActivity { idle, bathing, brushing, sleeping }

// enum InteractiveMode { none, bathingInteractive, brushingInteractive }

// class GameRoomScreen extends StatefulWidget {
//   const GameRoomScreen({super.key});

//   @override
//   State<GameRoomScreen> createState() => _GameRoomScreenState();
// }

// class _GameRoomScreenState extends State<GameRoomScreen>
//     with TickerProviderStateMixin {
//   // --- STATE VARIABLES ---
//   GameLocation _location = GameLocation.livingRoom;
//   PetActivity _activity = PetActivity.idle;
//   InteractiveMode _interactiveMode = InteractiveMode.none;

//   // IMPORTANT: Set this to TRUE only if you have 'assets/dog.glb' in your pubspec.yaml
//   // I have set it to FALSE so you can see the dog (2D) immediately.
//   final bool _use3DModel = true;

//   // Stats
//   int _lovePoints = 123;
//   int _tickets = 5;
//   int _coins = 12345;

//   // Interactive Progress
//   double _interactiveProgress = 0.0;
//   int _brushStrokes = 0;
//   int _bathBubbles = 0;
//   List<Offset> _bubblePositions = [];
//   Timer? _activityTimer;
//   bool _isDirtyMode = false;

//   // Animation Controllers for 2D "Breathing/Bouncing" Effect
//   late AnimationController _bounceController;
//   late Animation<double> _bounceAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _bounceController = AnimationController(
//       duration: const Duration(milliseconds: 1500),
//       vsync: this,
//     )..repeat(reverse: true);

//     _bounceAnimation = Tween<double>(begin: 0, end: 10).animate(
//       CurvedAnimation(parent: _bounceController, curve: Curves.easeInOut),
//     );
//   }

//   @override
//   void dispose() {
//     _bounceController.dispose();
//     _activityTimer?.cancel();
//     super.dispose();
//   }

//   // --- ACTIONS & LOGIC ---

//   void _toggleDirtyMode() {
//     if (_activity != PetActivity.idle) return;
//     setState(() {
//       _isDirtyMode = !_isDirtyMode;
//       _location = GameLocation.livingRoom;
//     });
//   }

//   void _startInteractiveBathing() {
//     Navigator.pop(context);
//     setState(() {
//       _location = GameLocation.bathroom;
//       _activity = PetActivity.bathing;
//       _interactiveMode = InteractiveMode.bathingInteractive;
//       _interactiveProgress = 0.0;
//       _bathBubbles = 0;
//       _bubblePositions.clear();
//     });
//   }

//   void _startInteractiveBrushing() {
//     Navigator.pop(context);
//     setState(() {
//       _location = GameLocation.bathroom;
//       _activity = PetActivity.brushing;
//       _interactiveMode = InteractiveMode.brushingInteractive;
//       _interactiveProgress = 0.0;
//       _brushStrokes = 0;
//     });
//   }

//   void _startSleeping() {
//     Navigator.pop(context);
//     setState(() {
//       _location = GameLocation.bedroom;
//       _activity = PetActivity.sleeping;
//       _interactiveMode = InteractiveMode.none;
//     });

//     // Auto-finish sleeping after 3 seconds
//     _activityTimer?.cancel();
//     _activityTimer = Timer(const Duration(seconds: 3), () {
//       _completeActivity(10, 20);
//     });
//   }

//   // Handle Swipe for Bathing
//   void _handleBathingGesture(Offset localPosition) {
//     if (_interactiveMode != InteractiveMode.bathingInteractive) return;
//     setState(() {
//       _bathBubbles++;
//       _interactiveProgress = (_bathBubbles / 30).clamp(0.0, 1.0);
//       _bubblePositions.add(localPosition);
//       if (_bubblePositions.length > 15) _bubblePositions.removeAt(0);
//     });

//     if (_interactiveProgress >= 1.0) _completeActivity(50, 50);
//   }

//   // Handle Tap for Brushing
//   void _handleBrushingGesture() {
//     if (_interactiveMode != InteractiveMode.brushingInteractive) return;
//     setState(() {
//       _brushStrokes++;
//       _interactiveProgress = (_brushStrokes / 10).clamp(0.0, 1.0);
//     });

//     if (_interactiveProgress >= 1.0) _completeActivity(30, 40);
//   }

//   void _completeActivity(int loveReward, int coinReward) {
//     setState(() {
//       _activity = PetActivity.idle;
//       _interactiveMode = InteractiveMode.none;
//       _lovePoints += loveReward;
//       _coins += coinReward;
//       _bubblePositions.clear();
//     });

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text("✨ Great Job! +$loveReward ❤️  +$coinReward 🪙"),
//         backgroundColor: Colors.green,
//         duration: const Duration(seconds: 2),
//       ),
//     );
//   }

//   // --- BACKGROUND HELPER ---
//   String _getBackgroundImage() {
//     switch (_location) {
//       case GameLocation.bathroom:
//         return 'https://images.unsplash.com/photo-1584622050111-993a426fbf0a?q=80&w=2000';
//       case GameLocation.bedroom:
//         return 'https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?q=80&w=2000';
//       default:
//         return 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?q=80&w=2000';
//     }
//   }

//   // --- BUILD METHOD ---
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final bool isHub = _location == GameLocation.livingRoom;

//     return Scaffold(
//       body: GestureDetector(
//         onPanUpdate: (details) => _handleBathingGesture(details.localPosition),
//         onTap: () => _handleBrushingGesture(),
//         child: Stack(
//           children: [
//             // LAYER 1: Background
//             AnimatedSwitcher(
//               duration: const Duration(milliseconds: 800),
//               child: Container(
//                 key: ValueKey(_location),
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: NetworkImage(_getBackgroundImage()),
//                     fit: BoxFit.cover,
//                     opacity: 0.9,
//                   ),
//                 ),
//               ),
//             ),

//             // LAYER 2: Furniture
//             _buildFurniture(size),

//             // LAYER 3: The Pet (2D or 3D)
//             _buildPetLayer(size),

//             // LAYER 4: Interactive Effects (Bubbles/Progress)
//             if (_interactiveMode != InteractiveMode.none) ...[
//               for (int i = 0; i < _bubblePositions.length; i++)
//                 _buildBubble(_bubblePositions[i], i),
//               _buildInstructionOverlay(size),
//             ],

//             // LAYER 5: HUD (Original App Bar Style)
//             Positioned(
//               top: MediaQuery.of(context).padding.top + 10,
//               left: 16,
//               right: 16,
//               child: _buildTopHud(),
//             ),

//             // LAYER 6: Main Action Button (Only when Idle)
//             if (_activity == PetActivity.idle &&
//                 _interactiveMode == InteractiveMode.none)
//               Positioned(
//                 top: size.height * 0.45,
//                 left: 0,
//                 right: 0,
//                 child: Center(
//                   child: GestureDetector(
//                     onTap: () => showDialog(
//                       context: context,
//                       builder: (_) => _buildCareDialog(),
//                     ),
//                     child: _buildMainActionButton(),
//                   ),
//                 ),
//               ),

//             // LAYER 7: Navigation & Dirty Mode
//             if (!isHub && _interactiveMode == InteractiveMode.none)
//               Positioned(
//                 bottom: 30,
//                 left: 30,
//                 child: FloatingActionButton.extended(
//                   onPressed: () =>
//                       setState(() => _location = GameLocation.livingRoom),
//                   label: const Text("Main Room"),
//                   icon: const Icon(Icons.home),
//                   backgroundColor: Colors.brown,
//                 ),
//               ),

//             if (isHub && _interactiveMode == InteractiveMode.none)
//               Positioned(
//                 bottom: 30,
//                 left: 30,
//                 child: FloatingActionButton.small(
//                   onPressed: _toggleDirtyMode,
//                   backgroundColor: _isDirtyMode ? Colors.red : Colors.grey,
//                   child: const Icon(Icons.cleaning_services),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   // --- WIDGET BUILDERS ---

//   Widget _buildTopHud() {
//     // REVERTED: Original 3-item HUD logic
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         _buildStatusChip(
//           Icons.favorite,
//           Colors.pinkAccent,
//           "$_lovePoints/1000",
//           130,
//         ),
//         const Spacer(),
//         _buildStatusChip(
//           Icons.confirmation_number,
//           Colors.blueGrey,
//           "$_tickets",
//           80,
//         ),
//         const SizedBox(width: 8),
//         _buildStatusChip(Icons.monetization_on, Colors.amber, "$_coins", 90),
//       ],
//     );
//   }

//   Widget _buildPetLayer(Size size) {
//     return AnimatedPositioned(
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.easeInOut,
//       bottom: _getPetBottom(size),
//       left: _getPetLeft(size),
//       child: AnimatedBuilder(
//         animation: _bounceAnimation,
//         builder: (context, child) {
//           return Transform.translate(
//             offset: Offset(0, -_bounceAnimation.value),
//             child: Container(
//               height: 200,
//               width: 200,
//               child: _use3DModel
//                   ? ModelViewer(
//                       src: 'assets/dog.glb', // ENSURE THIS FILE EXISTS
//                       autoRotate: true,
//                       cameraControls: false,
//                       backgroundColor: Colors.transparent,
//                       alt: "3D Dog",
//                     )
//                   : Image.network(
//                       "https://cdn-icons-png.flaticon.com/512/616/616408.png",
//                     ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildFurniture(Size size) {
//     // Simple furniture placement based on room
//     if (_location == GameLocation.livingRoom) {
//       return Positioned(
//         bottom: size.height * 0.25,
//         left: size.width * 0.1,
//         child: Image.network(
//           "https://cdn-icons-png.flaticon.com/512/2511/2511419.png",
//           width: 150,
//         ), // Sofa
//       );
//     } else if (_location == GameLocation.bedroom) {
//       return Positioned(
//         bottom: size.height * 0.25,
//         left: size.width * 0.15,
//         child: Image.network(
//           "https://cdn-icons-png.flaticon.com/512/3014/3014526.png",
//           width: 200,
//         ), // Bed
//       );
//     } else {
//       // Bathroom
//       return Stack(
//         children: [
//           Positioned(
//             bottom: size.height * 0.22,
//             left: 10,
//             child: Image.network(
//               "https://cdn-icons-png.flaticon.com/512/3131/3131848.png",
//               width: 100,
//             ),
//           ), // Sink
//           Positioned(
//             bottom: size.height * 0.22,
//             right: -10,
//             child: Image.network(
//               "https://cdn-icons-png.flaticon.com/512/2239/2239318.png",
//               width: 180,
//             ),
//           ), // Tub
//         ],
//       );
//     }
//   }

//   Widget _buildInstructionOverlay(Size size) {
//     String text = _interactiveMode == InteractiveMode.bathingInteractive
//         ? "Swipe to Scrub!"
//         : "Tap to Brush!";

//     return Positioned(
//       top: size.height * 0.3,
//       left: 0,
//       right: 0,
//       child: Column(
//         children: [
//           Text(
//             text,
//             style: const TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//               shadows: [Shadow(blurRadius: 10, color: Colors.black)],
//             ),
//           ),
//           const SizedBox(height: 10),
//           Container(
//             width: 200,
//             child: LinearProgressIndicator(
//               value: _interactiveProgress,
//               color: Colors.greenAccent,
//               minHeight: 10,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBubble(Offset pos, int index) {
//     return Positioned(
//       left: pos.dx - 20,
//       top: pos.dy - 20,
//       child: const Icon(Icons.circle, color: Colors.white54, size: 40),
//     );
//   }

//   // --- COORDINATES ---
//   double _getPetBottom(Size size) {
//     if (_location == GameLocation.bathroom && _activity == PetActivity.bathing)
//       return size.height * 0.25;
//     if (_location == GameLocation.bathroom && _activity == PetActivity.brushing)
//       return size.height * 0.22;
//     if (_location == GameLocation.bedroom && _activity == PetActivity.sleeping)
//       return size.height * 0.3;
//     return size.height * 0.12;
//   }

//   double _getPetLeft(Size size) {
//     if (_location == GameLocation.bathroom && _activity == PetActivity.bathing)
//       return size.width * 0.6;
//     if (_location == GameLocation.bathroom && _activity == PetActivity.brushing)
//       return size.width * 0.1;
//     if (_location == GameLocation.bedroom && _activity == PetActivity.sleeping)
//       return size.width * 0.2;
//     return size.width * 0.3;
//   }

//   // --- COMMON WIDGETS ---
//   Widget _buildStatusChip(
//     IconData icon,
//     Color color,
//     String label,
//     double width,
//   ) {
//     return Container(
//       height: 36,
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.9),
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: const [
//           BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
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
//               color: Colors.black87,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMainActionButton() {
//     return Container(
//       width: 140,
//       height: 140,
//       decoration: BoxDecoration(
//         color: _isDirtyMode
//             ? Colors.red.withOpacity(0.9)
//             : const Color(0xFFFFF176).withOpacity(0.9),
//         shape: BoxShape.circle,
//         border: Border.all(color: Colors.white, width: 4),
//         boxShadow: [
//           BoxShadow(color: Colors.black26, blurRadius: 20, spreadRadius: 5),
//         ],
//       ),
//       child: Center(
//         child: Text(
//           _isDirtyMode ? "Clean Up" : "Take Care",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: _isDirtyMode ? Colors.white : Colors.brown,
//             fontSize: 22,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCareOption(String label, IconData icon, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 130,
//         padding: const EdgeInsets.all(8),
//         child: Row(
//           children: [
//             Container(
//               width: 40,
//               height: 40,
//               decoration: BoxDecoration(
//                 color: const Color(0xFFFFF176),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Icon(icon, color: Colors.brown),
//             ),
//             const SizedBox(width: 8),
//             Expanded(
//               child: Text(
//                 label,
//                 style: const TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCareDialog() {
//     return Dialog(
//       backgroundColor: Colors.transparent,
//       insetPadding: const EdgeInsets.all(10),
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Container(
//             width: 320,
//             padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Text(
//                   "Care Menu",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 20),
//                 Wrap(
//                   spacing: 10,
//                   runSpacing: 10,
//                   children: [
//                     _buildCareOption(
//                       "Dry shampoo",
//                       Icons.shower,
//                       _startInteractiveBathing,
//                     ),
//                     _buildCareOption(
//                       "Tooth brushing",
//                       Icons.clean_hands,
//                       _startInteractiveBrushing,
//                     ),
//                     _buildCareOption("Clean sheets", Icons.bed, _startSleeping),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             right: 0,
//             top: 0,
//             child: IconButton(
//               icon: const Icon(Icons.close, color: Colors.white),
//               onPressed: () => Navigator.pop(context),
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
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameRoomScreen(),
    ),
  );
}

// --- ENUMS ---
enum GameLocation { livingRoom, bathroom, bedroom }

enum PetActivity { idle, bathing, brushing, sleeping }

enum InteractiveMode { none, bathingInteractive, brushingInteractive, bedsheetInteractive }

class GameRoomScreen extends StatefulWidget {
  const GameRoomScreen({super.key});

  @override
  State<GameRoomScreen> createState() => _GameRoomScreenState();
}

class _GameRoomScreenState extends State<GameRoomScreen>
    with TickerProviderStateMixin {
  // --- DEBUG SETTINGS ---
  // 1. Set this to TRUE to see if the 3D viewer works with a known online model.
  //    If the Astronaut appears, your viewer works, but your 'dog.glb' file is missing or broken.
  final bool _useRemoteDebugModel = false;

  // 2. Set this to FALSE if 3D is totally broken and you just want to see the 2D image.
  final bool _use3DModel = true;

  GameLocation _location = GameLocation.livingRoom;
  PetActivity _activity = PetActivity.idle;
  InteractiveMode _interactiveMode = InteractiveMode.none;

  // Stats
  int _lovePoints = 123;
  int _tickets = 5;
  int _coins = 12345;

  // Interactive Progress
  double _interactiveProgress = 0.0;
  int _brushStrokes = 0;
  int _bathBubbles = 0;
  int _bedsheetSwipes = 0;
  List<Offset> _bubblePositions = [];
  Timer? _activityTimer;
  bool _isDirtyMode = false;

  // Animation Controllers for 2D "Breathing" Effect (Fallback)
  late AnimationController _bounceController;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _bounceAnimation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(parent: _bounceController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _bounceController.dispose();
    _activityTimer?.cancel();
    super.dispose();
  }

  // --- ACTIONS & LOGIC ---

  void _toggleDirtyMode() {
    if (_activity != PetActivity.idle) return;
    setState(() {
      _isDirtyMode = !_isDirtyMode;
      _location = GameLocation.livingRoom;
    });
  }

  // 1. Bathing Logic (Bathroom -> Swipe)
  void _startInteractiveBathing() {
    Navigator.pop(context);
    setState(() {
      _location = GameLocation.bathroom;
      _activity = PetActivity.bathing;
      _interactiveMode = InteractiveMode.bathingInteractive;
      _interactiveProgress = 0.0;
      _bathBubbles = 0;
      _bubblePositions.clear();
    });
  }

  // 2. Brushing Logic (Bathroom -> Tap)
  void _startInteractiveBrushing() {
    Navigator.pop(context);
    setState(() {
      _location = GameLocation.bathroom;
      _activity = PetActivity.brushing;
      _interactiveMode = InteractiveMode.brushingInteractive;
      _interactiveProgress = 0.0;
      _brushStrokes = 0;
    });
  }

  // 3. Clean Sheets Logic (Bedroom -> Interactive Swipe)
  void _startCleaningSheets() {
    Navigator.pop(context);
    setState(() {
      _location = GameLocation.bedroom;
      _activity = PetActivity.sleeping;
      _interactiveMode = InteractiveMode.bedsheetInteractive;
      _interactiveProgress = 0.0;
      _bedsheetSwipes = 0;
    });
  }

  // Handle Swipe for Bathing
  void _handleBathingGesture(Offset localPosition) {
    if (_interactiveMode != InteractiveMode.bathingInteractive) return;
    setState(() {
      _bathBubbles++;
      _interactiveProgress = (_bathBubbles / 40).clamp(0.0, 1.0);
      _bubblePositions.add(localPosition);
      if (_bubblePositions.length > 20) _bubblePositions.removeAt(0);
    });

    if (_interactiveProgress >= 1.0) _completeActivity(50, 50);
  }

  // Handle Tap for Brushing
  void _handleBrushingGesture() {
    if (_interactiveMode != InteractiveMode.brushingInteractive) return;
    setState(() {
      _brushStrokes++;
      _interactiveProgress = (_brushStrokes / 15).clamp(0.0, 1.0);
    });

    if (_interactiveProgress >= 1.0) _completeActivity(30, 40);
  }

  // Handle Swipe for Bedsheet Laying
  void _handleBedsheetGesture(Offset localPosition) {
    if (_interactiveMode != InteractiveMode.bedsheetInteractive) return;
    setState(() {
      _bedsheetSwipes++;
      _interactiveProgress = (_bedsheetSwipes / 25).clamp(0.0, 1.0);
    });

    if (_interactiveProgress >= 1.0) _completeActivity(15, 25);
  }

  void _completeActivity(int loveReward, int coinReward) {
    setState(() {
      _activity = PetActivity.idle;
      _interactiveMode = InteractiveMode.none;
      _lovePoints += loveReward;
      _coins += coinReward;
      _bubblePositions.clear();
      _brushStrokes = 0;
      _bathBubbles = 0;
      _bedsheetSwipes = 0;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("✨ Great Job! +$loveReward ❤️  +$coinReward 🪙"),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // --- BACKGROUND HELPER ---
  String _getBackgroundImage() {
    switch (_location) {
      case GameLocation.bathroom:
        return 'https://images.unsplash.com/photo-1584622050111-993a426fbf0a?q=80&w=2000';
      case GameLocation.bedroom:
        return 'https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?q=80&w=2000';
      default:
        return 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?q=80&w=2000';
    }
  }

  // --- BUILD METHOD ---
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isHub = _location == GameLocation.livingRoom;

    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {
          if (_interactiveMode == InteractiveMode.bathingInteractive) {
            _handleBathingGesture(details.localPosition);
          } else if (_interactiveMode == InteractiveMode.bedsheetInteractive) {
            _handleBedsheetGesture(details.localPosition);
          }
        },
        onTap: () => _handleBrushingGesture(),
        child: Stack(
          children: [
            // LAYER 1: Background
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 800),
              child: Container(
                key: ValueKey(_location),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(_getBackgroundImage()),
                    fit: BoxFit.cover,
                    opacity: 0.9,
                  ),
                ),
              ),
            ),

            // LAYER 2: Furniture
            _buildFurniture(size),

            // LAYER 3: The Pet (2D or 3D)
            _buildPetLayer(size),

            // LAYER 4: Interactive Effects (Bubbles/Progress)
            if (_interactiveMode != InteractiveMode.none) ...[
              for (int i = 0; i < _bubblePositions.length; i++)
                _buildBubble(_bubblePositions[i], i),
              _buildInstructionOverlay(size),
            ],

            // LAYER 5: DIRTY OVERLAY (Only in Living Room)
            if (_isDirtyMode && isHub) ...[
              Positioned.fill(
                child: Container(color: Colors.black.withOpacity(0.3)),
              ),
              Positioned(bottom: 50, left: 50, child: _buildMudStain()),
              Positioned(bottom: 150, right: 80, child: _buildMudStain()),
            ],

            // LAYER 6: HUD (REVERTED TO ORIGINAL)
            Positioned(
              top: MediaQuery.of(context).padding.top + 10,
              left: 16,
              right: 16,
              child: _buildTopHud(),
            ),

            // LAYER 7: Main Action Button (Only when Idle)
            if (_activity == PetActivity.idle &&
                _interactiveMode == InteractiveMode.none)
              Positioned(
                top: size.height * 0.45,
                left: 0,
                right: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: _isDirtyMode
                        ? () {
                            // Quick clean action
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Cleaning...")),
                            );
                            Future.delayed(
                              const Duration(seconds: 1),
                              _toggleDirtyMode,
                            );
                          }
                        : () => showDialog(
                            context: context,
                            builder: (_) => _buildCareDialog(),
                          ),
                    child: _buildMainActionButton(),
                  ),
                ),
              ),
            if (!isHub && _interactiveMode == InteractiveMode.none)
              Positioned(
                bottom: 30,
                left: 30,
                child: FloatingActionButton.extended(
                  onPressed: () =>
                      setState(() => _location = GameLocation.livingRoom),
                  label: const Text("Main Room"),
                  icon: const Icon(Icons.home),
                  backgroundColor: Colors.brown,
                ),
              ),

            if (isHub && _interactiveMode == InteractiveMode.none)
              Positioned(
                bottom: 30,
                left: 30,
                child: FloatingActionButton.small(
                  onPressed: _toggleDirtyMode,
                  backgroundColor: _isDirtyMode ? Colors.red : Colors.grey,
                  child: const Icon(Icons.cleaning_services),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // --- WIDGET BUILDERS ---

  Widget _buildTopHud() {
    // REVERTED: Original 3-item HUD layout
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStatusChip(
          Icons.favorite,
          Colors.pinkAccent,
          "$_lovePoints/1000",
          130,
        ),
        const Spacer(), // Pushes the next items to the right
        _buildStatusChip(
          Icons.confirmation_number,
          Colors.blueGrey,
          "$_tickets",
          80,
        ),
        const SizedBox(width: 8),
        _buildStatusChip(Icons.monetization_on, Colors.amber, "$_coins", 90),
      ],
    );
  }

  Widget _buildPetLayer(Size size) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      bottom: _getPetBottom(size),
      left: _getPetLeft(size),
      child: AnimatedBuilder(
        animation: _bounceAnimation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, -_bounceAnimation.value),
            child: Container(
              height: 200,
              width: 200,

              child: _use3DModel
                  ? ModelViewer(
                      // Logic: Use remote URL if Debug is ON, otherwise use local asset
                      src: _useRemoteDebugModel
                          ? 'https://modelviewer.dev/shared-assets/models/Astronaut.glb'
                          : 'assets/images/dog_3.glb',
                      autoRotate: true,
                      cameraControls: false,
                      backgroundColor: Colors.transparent,
                      alt: "3D Dog",
                    )
                  : Image.network(
                      "https://cdn-icons-png.flaticon.com/512/616/616408.png",
                    ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFurniture(Size size) {
    // Furniture removed as requested - pet is now scrubbable without furniture
    return SizedBox();
  }

  Widget _buildInstructionOverlay(Size size) {
    String text = _interactiveMode == InteractiveMode.bathingInteractive
        ? "Swipe to Scrub!"
        : _interactiveMode == InteractiveMode.bedsheetInteractive
            ? "Swipe to Lay Bedsheet!"
            : "Tap to Brush!";

    return Positioned(
      top: size.height * 0.3,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [Shadow(blurRadius: 10, color: Colors.black)],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 200,
            child: LinearProgressIndicator(
              value: _interactiveProgress,
              color: Colors.greenAccent,
              minHeight: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBubble(Offset pos, int index) {
    return Positioned(
      left: pos.dx - 20,
      top: pos.dy - 20,
      child: const Icon(Icons.circle, color: Colors.white54, size: 40),
    );
  }

  Widget _buildMudStain() {
    return Opacity(
      opacity: 0.8,
      child: Image.network(
        'https://cdn-icons-png.flaticon.com/512/785/785118.png', // Mud icon
        width: 100,
        color: Colors.brown[800],
      ),
    );
  }

  // --- COORDINATES ---
  double _getPetBottom(Size size) {
    if (_location == GameLocation.bathroom && _activity == PetActivity.bathing)
      return size.height * 0.25;
    if (_location == GameLocation.bathroom && _activity == PetActivity.brushing)
      return size.height * 0.22;
    if (_location == GameLocation.bedroom && _activity == PetActivity.sleeping)
      return size.height * 0.3;
    return size.height * 0.12;
  }

  double _getPetLeft(Size size) {
    if (_location == GameLocation.bathroom && _activity == PetActivity.bathing)
      return size.width * 0.6;
    if (_location == GameLocation.bathroom && _activity == PetActivity.brushing)
      return size.width * 0.1;
    if (_location == GameLocation.bedroom && _activity == PetActivity.sleeping)
      return size.width * 0.2;
    return size.width * 0.3;
  }

  // --- COMMON WIDGETS ---
  Widget _buildStatusChip(
    IconData icon,
    Color color,
    String label,
    double width,
  ) {
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        color: _isDirtyMode
            ? Colors.red.withOpacity(0.9)
            : const Color(0xFFFFF176).withOpacity(0.9),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 4),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 20, spreadRadius: 5),
        ],
      ),
      child: Center(
        child: Text(
          _isDirtyMode ? "Clean Up" : "Take Care",
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
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF176),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.brown),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
                  "Care Menu",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _buildCareOption(
                      "Dry shampoo",
                      icon: Icons.shower,
                      onTap: _startInteractiveBathing,
                    ),
                    _buildCareOption(
                      "Tooth brushing",
                      icon: Icons.clean_hands,
                      onTap: _startInteractiveBrushing,
                    ),
                    _buildCareOption(
                      "Clean sheets",
                      icon: Icons.bed,
                      onTap: _startCleaningSheets,
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
}
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'dart:math' as math;
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:model_viewer_plus/model_viewer_plus.dart';

// // ============================================================================
// // PREVIOUS CODE - ALL COMMENTED OUT AS REQUESTED
// // ============================================================================
// /*
// // The previous implementation included:
// // - Basic GameLocation enum (livingRoom, bathroom, bedroom)
// // - Basic PetActivity enum (idle, bathing, brushing, cleaningSheets, toileting)
// // - Simple Room class
// // - GameRoomScreen with state management
// // - Timer-based activities (not interactive)
// // - Basic UI with furniture and pet positioning
// // 
// // This has been replaced with an enhanced interactive version below
// // that includes 3D-like animations, gesture-based interactions,
// // and Talking Tom/Angela-style care activities.
// */

// // ============================================================================
// // NEW ENHANCED CODE - WITH 3D-LIKE MODEL AND INTERACTIVE FEATURES
// // ============================================================================

// /// Enhanced game locations with bedroom and bathroom
// enum GameLocation { livingRoom, bathroom, bedroom }

// /// Pet activities including interactive bathing and brushing
// enum PetActivity {
//   idle,
//   bathing,
//   brushing,
//   sleeping, // New: for bedroom
// }

// /// Interactive mode for user-controlled actions
// enum InteractiveMode {
//   none,
//   bathingInteractive, // User can swipe to bathe
//   brushingInteractive, // User can tap/swipe to brush teeth
// }

// class GameRoomScreen extends StatefulWidget {
//   const GameRoomScreen({super.key});

//   @override
//   State<GameRoomScreen> createState() => _GameRoomScreenState();
// }

// class _GameRoomScreenState extends State<GameRoomScreen>
//     with TickerProviderStateMixin {
//   // --- STATE VARIABLES ---
//   GameLocation _location = GameLocation.livingRoom;
//   PetActivity _activity = PetActivity.idle;
//   InteractiveMode _interactiveMode = InteractiveMode.none;

//   // Interactive activity progress
//   double _interactiveProgress = 0.0;
//   int _brushStrokes = 0;
//   int _bathBubbles = 0;

//   // Stats
//   int _lovePoints = 123;
//   int _tickets = 5;
//   int _coins = 12345;
//   int _cleanliness = 60; // New: cleanliness stat
//   int _happiness = 75; // New: happiness stat

//   // 3D Model toggle
//   bool _use3DModel = true; // Toggle to use 3D model or fallback image

//   // Dirty mode (from commented code)
//   bool _isDirtyMode = false; // Toggles the "Messy" view

//   // Animation controllers for 3D-like effects
//   late AnimationController _bounceController;
//   late AnimationController _rotationController;
//   late Animation<double> _bounceAnimation;
//   late Animation<double> _rotationAnimation;

//   // Timer for auto-activities
//   Timer? _activityTimer;

//   // Bubble positions for bathing effect
//   List<Offset> _bubblePositions = [];

//   @override
//   void initState() {
//     super.initState();

//     // Initialize bounce animation for 3D-like effect
//     _bounceController = AnimationController(
//       duration: const Duration(milliseconds: 1500),
//       vsync: this,
//     )..repeat(reverse: true);

//     _bounceAnimation = Tween<double>(begin: 0, end: 15).animate(
//       CurvedAnimation(parent: _bounceController, curve: Curves.easeInOut),
//     );

//     // Initialize rotation for 3D-like turning effect
//     _rotationController = AnimationController(
//       duration: const Duration(milliseconds: 2000),
//       vsync: this,
//     )..repeat(reverse: true);

//     _rotationAnimation = Tween<double>(begin: -0.05, end: 0.05).animate(
//       CurvedAnimation(parent: _rotationController, curve: Curves.easeInOut),
//     );
//   }

//   @override
//   void dispose() {
//     _bounceController.dispose();
//     _rotationController.dispose();
//     _activityTimer?.cancel();
//     super.dispose();
//   }

//   // --- GAME LOGIC ---

//   void _startInteractiveBathing() {
//     Navigator.pop(context);
//     setState(() {
//       _location = GameLocation.bathroom;
//       _activity = PetActivity.bathing;
//       _interactiveMode = InteractiveMode.bathingInteractive;
//       _interactiveProgress = 0.0;
//       _bathBubbles = 0;
//       _bubblePositions.clear();
//     });
//   }

//   void _startInteractiveBrushing() {
//     Navigator.pop(context);
//     setState(() {
//       _location = GameLocation.bathroom;
//       _activity = PetActivity.brushing;
//       _interactiveMode = InteractiveMode.brushingInteractive;
//       _interactiveProgress = 0.0;
//       _brushStrokes = 0;
//     });
//   }

//   void _startSleeping() {
//     Navigator.pop(context);
//     setState(() {
//       _location = GameLocation.bedroom;
//       _activity = PetActivity.sleeping;
//       _interactiveMode = InteractiveMode.none;
//       _interactiveProgress = 0.0;
//     });

//     // Auto-complete after 3 seconds
//     _activityTimer?.cancel();
//     _activityTimer = Timer(const Duration(seconds: 3), () {
//       _completeActivity();
//     });
//   }

//   void _handleBathingGesture(Offset localPosition) {
//     if (_interactiveMode != InteractiveMode.bathingInteractive) return;

//     setState(() {
//       _bathBubbles++;
//       _interactiveProgress = (_bathBubbles / 20).clamp(0.0, 1.0);

//       // Add bubble at touch position
//       _bubblePositions.add(localPosition);
//       if (_bubblePositions.length > 10) {
//         _bubblePositions.removeAt(0);
//       }
//     });

//     if (_interactiveProgress >= 1.0) {
//       _completeActivity();
//     }
//   }

//   void _handleBrushingGesture() {
//     if (_interactiveMode != InteractiveMode.brushingInteractive) return;

//     setState(() {
//       _brushStrokes++;
//       _interactiveProgress = (_brushStrokes / 15).clamp(0.0, 1.0);
//     });

//     if (_interactiveProgress >= 1.0) {
//       _completeActivity();
//     }
//   }

//   void _applyRewards(Map<String, int> rewards) {
//     setState(() {
//       _lovePoints += rewards['love'] ?? 0;
//       _coins += rewards['coins'] ?? 0;
//       _cleanliness = (_cleanliness + (rewards['cleanliness'] ?? 0)).clamp(
//         0,
//         100,
//       );
//       _happiness = (_happiness + (rewards['happiness'] ?? 0)).clamp(0, 100);
//     });
//   }

//   void _completeActivity() {
//     final rewards = _calculateRewards();

//     _applyRewards(rewards);

//     setState(() {
//       _activity = PetActivity.idle;
//       _interactiveMode = InteractiveMode.none;
//       _interactiveProgress = 0.0;
//       _brushStrokes = 0;
//       _bathBubbles = 0;
//       _bubblePositions.clear();
//     });

//     _activityTimer?.cancel();

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//           "🎉 Great job! +${rewards['love']} Love, +${rewards['coins']} Coins",
//         ),
//         backgroundColor: Colors.green,
//         duration: const Duration(seconds: 2),
//       ),
//     );
//   }

//   Map<String, int> _calculateRewards() {
//     switch (_activity) {
//       case PetActivity.bathing:
//         return {'love': 30, 'coins': 50, 'cleanliness': 40, 'happiness': 20};
//       case PetActivity.brushing:
//         return {'love': 20, 'coins': 30, 'cleanliness': 30, 'happiness': 15};
//       case PetActivity.sleeping:
//         return {'love': 10, 'coins': 20, 'cleanliness': 0, 'happiness': 30};
//       default:
//         return {'love': 0, 'coins': 0, 'cleanliness': 0, 'happiness': 0};
//     }
//   }

//   Widget _buildBubble(Offset position, int index) {
//     return Positioned(
//       left: position.dx - 15,
//       top: position.dy - 15,
//       child: TweenAnimationBuilder(
//         key: ValueKey('bubble_$index'),
//         tween: Tween<double>(begin: 0.0, end: 1.0),
//         duration: const Duration(milliseconds: 1000),
//         builder: (context, double value, child) {
//           return Opacity(
//             opacity: 1 - value,
//             child: Transform.scale(
//               scale: 1 + value,
//               child: Container(
//                 width: 30,
//                 height: 30,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.white.withOpacity(0.7),
//                   border: Border.all(
//                     color: Colors.blue.withOpacity(0.5),
//                     width: 2,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   void _toggleDirtyMode() {
//     setState(() {
//       _isDirtyMode = !_isDirtyMode;
//     });
//   }

//   Widget _buildMudStain() {
//     return Opacity(
//       opacity: 0.8,
//       child: _buildNetworkImage(
//         'https://cdn-icons-png.flaticon.com/512/785/785118.png', // Mud icon
//         width: 100,
//       ),
//     );
//   }

//   // --- UI BUILDERS ---

//   Widget _buildNetworkImage(
//     String url, {
//     double? width,
//     double? height,
//     BoxFit? fit,
//   }) {
//     return CachedNetworkImage(
//       imageUrl: url,
//       width: width,
//       height: height,
//       fit: fit,
//       placeholder: (context, url) => Container(
//         width: width,
//         height: height,
//         alignment: Alignment.center,
//         child: CircularProgressIndicator(
//           strokeWidth: 2,
//           valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[400]!),
//         ),
//       ),
//       errorWidget: (context, url, error) => Container(
//         width: width,
//         height: height,
//         decoration: BoxDecoration(
//           color: Colors.grey[300],
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Icon(
//           Icons.pets,
//           size: (width ?? 100) * 0.5,
//           color: Colors.grey[600],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: GestureDetector(
//         onPanUpdate: (details) {
//           if (_interactiveMode == InteractiveMode.bathingInteractive) {
//             _handleBathingGesture(details.localPosition);
//           }
//         },
//         onTap: () {
//           if (_interactiveMode == InteractiveMode.brushingInteractive) {
//             _handleBrushingGesture();
//           }
//         },
//         child: Stack(
//           children: [
//             // Background
//             _buildBackground(),

//             // Furniture
//             _buildFurniture(size),

//             // 3D-like Pet Model
//             _build3DPetModel(size),

//             // Dirt overlay (from commented code)
//             if (_isDirtyMode) ...[
//               // Mud stains
//               Positioned(bottom: 50, left: 50, child: _buildMudStain()),
//               Positioned(bottom: 150, right: 80, child: _buildMudStain()),
//               Positioned(bottom: 20, right: 20, child: _buildMudStain()),
//               // Dark overlay to make it look gloomy
//               Positioned.fill(
//                 child: Container(color: Colors.black.withOpacity(0.3)),
//               ),
//             ],

//             // Interactive effects
//             if (_interactiveMode != InteractiveMode.none)
//               _buildInteractiveEffects(size),

//             // HUD
//             _buildHUD(size),

//             // Controls
//             _buildControls(size),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildBackground() {
//     String backgroundUrl;
//     Color overlayColor;

//     switch (_location) {
//       case GameLocation.bathroom:
//         backgroundUrl =
//             'https://images.unsplash.com/photo-1552321554-5fefe8c9ef14?q=80&w=2000';
//         overlayColor = Colors.blue.withOpacity(0.1);
//         break;
//       case GameLocation.bedroom:
//         backgroundUrl =
//             'https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?q=80&w=2000';
//         overlayColor = Colors.purple.withOpacity(0.1);
//         break;
//       default:
//         backgroundUrl =
//             'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?q=80&w=2000';
//         overlayColor = Colors.amber.withOpacity(0.1);
//     }

//     return AnimatedSwitcher(
//       duration: const Duration(milliseconds: 800),
//       child: Container(
//         key: ValueKey(_location),
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: NetworkImage(backgroundUrl),
//             fit: BoxFit.cover,
//             opacity: 0.85,
//           ),
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [overlayColor, Colors.transparent],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildFurniture(Size size) {
//     return Stack(
//       children: [
//         // BATHROOM
//         if (_location == GameLocation.bathroom) ...[
//           Positioned(
//             bottom: size.height * 0.2,
//             left: 10,
//             child: _buildNetworkImage(
//               'https://cdn-icons-png.flaticon.com/512/3131/3131848.png',
//               width: size.width * 0.25,
//             ),
//           ),
//           Positioned(
//             bottom: size.height * 0.18,
//             right: 10,
//             child: _buildNetworkImage(
//               'https://cdn-icons-png.flaticon.com/512/2239/2239318.png',
//               width: size.width * 0.4,
//             ),
//           ),
//         ],

//         // BEDROOM
//         if (_location == GameLocation.bedroom) ...[
//           Positioned(
//             bottom: size.height * 0.2,
//             left: size.width * 0.15,
//             child: _buildNetworkImage(
//               'https://cdn-icons-png.flaticon.com/512/3014/3014526.png',
//               width: size.width * 0.6,
//             ),
//           ),
//         ],

//         // LIVING ROOM
//         if (_location == GameLocation.livingRoom) ...[
//           Positioned(
//             bottom: size.height * 0.2,
//             left: size.width * 0.1,
//             child: _buildNetworkImage(
//               'https://cdn-icons-png.flaticon.com/512/2511/2511419.png',
//               width: size.width * 0.5,
//             ),
//           ),
//         ],
//       ],
//     );
//   }

//   Widget _build3DPetModel(Size size) {
//     return AnimatedPositioned(
//       duration: const Duration(milliseconds: 600),
//       curve: Curves.easeInOutCubic,
//       bottom: _getPetBottomPosition(size),
//       left: _getPetLeftPosition(size),
//       child: AnimatedBuilder(
//         animation: Listenable.merge([_bounceAnimation, _rotationAnimation]),
//         builder: (context, child) {
//           return Transform.translate(
//             offset: Offset(0, -_bounceAnimation.value),
//             child: Transform(
//               alignment: Alignment.center,
//               transform: Matrix4.identity()
//                 ..setEntry(3, 2, 0.001) // perspective
//                 ..rotateY(_rotationAnimation.value)
//                 ..rotateX(_activity == PetActivity.sleeping ? 0.2 : 0.0),
//               child: _buildPetAvatar(),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   double _getPetBottomPosition(Size size) {
//     switch (_location) {
//       case GameLocation.bathroom:
//         if (_activity == PetActivity.bathing) return size.height * 0.25;
//         if (_activity == PetActivity.brushing) return size.height * 0.22;
//         return size.height * 0.12;
//       case GameLocation.bedroom:
//         if (_activity == PetActivity.sleeping) return size.height * 0.28;
//         return size.height * 0.12;
//       default:
//         return size.height * 0.12;
//     }
//   }

//   double _getPetLeftPosition(Size size) {
//     switch (_location) {
//       case GameLocation.bathroom:
//         if (_activity == PetActivity.bathing) return size.width * 0.55;
//         if (_activity == PetActivity.brushing) return size.width * 0.1;
//         return size.width * 0.35;
//       case GameLocation.bedroom:
//         return size.width * 0.3;
//       default:
//         return size.width * 0.3;
//     }
//   }

//   Widget _buildPetAvatar() {
//     // Enhanced 3D-like pet representation
//     return Container(
//       height: 180,
//       width: 180,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.3),
//             blurRadius: 20,
//             offset: const Offset(0, 10),
//           ),
//         ],
//       ),
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           // Main dog - 3D model or fallback image
//           Container(
//             height: 160,
//             width: 160,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: Colors.white.withOpacity(0.3),
//                 width: 3,
//               ),
//             ),
//             child: ClipOval(
//               child: _use3DModel
//                   ? _build3DModelViewer()
//                   : _buildFallbackImage(),
//             ),
//           ),

//           // Activity-specific overlays
//           if (_activity == PetActivity.bathing)
//             const Icon(Icons.water_drop, size: 30, color: Colors.blue),
//           if (_activity == PetActivity.brushing)
//             const Positioned(
//               top: 20,
//               right: 20,
//               child: Icon(Icons.brush, size: 25, color: Colors.white),
//             ),
//           if (_activity == PetActivity.sleeping)
//             const Positioned(
//               top: 10,
//               right: 10,
//               child: Text(
//                 'Zzz',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }


//   Widget _build3DModelViewer() {
//     return ModelViewer(
//       src: 'assets/images/dog.glb',
//       alt: '3D Dog Model',
//       autoRotate:
//           _activity ==
//           PetActivity.idle, // Only auto-rotate when idle to save resources
//       autoPlay: true,
//       cameraControls: false,
//       backgroundColor: Colors.transparent,
//     );
//   }

//   // Fallback to 2D image
//   Widget _buildFallbackImage() {
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         _buildNetworkImage(
//           "https://cdn-icons-png.flaticon.com/512/616/616408.png",
//           fit: BoxFit.cover,
//         ),
//         // Shine effect for 3D look
//         Positioned(
//           top: 0,
//           left: 0,
//           right: 0,
//           child: Container(
//             height: 60,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [Colors.white.withOpacity(0.4), Colors.transparent],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildInteractiveEffects(Size size) {
//     return Stack(
//       children: [
//         // Instructions
//         Positioned(
//           top: size.height * 0.15,
//           left: 20,
//           right: 20,
//           child: Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.black.withOpacity(0.7),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               children: [
//                 Text(
//                   _interactiveMode == InteractiveMode.bathingInteractive
//                       ? 'Swipe on the screen to bathe the dog!'
//                       : 'Tap on the screen to brush the dog\'s teeth!',
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 10),
//                 LinearProgressIndicator(
//                   value: _interactiveProgress,
//                   backgroundColor: Colors.white30,
//                   valueColor: const AlwaysStoppedAnimation<Color>(
//                     Colors.greenAccent,
//                   ),
//                   minHeight: 12,
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   '${(_interactiveProgress * 100).toInt()}% Complete',
//                   style: const TextStyle(color: Colors.white70, fontSize: 14),
//                 ),
//               ],
//             ),
//           ),
//         ),

//         // Bubbles for bathing
//         if (_interactiveMode == InteractiveMode.bathingInteractive)
//           for (int i = 0; i < _bubblePositions.length; i++)
//             _buildBubble(_bubblePositions[i], i),

//         // Sparkles for brushing
//         if (_interactiveMode == InteractiveMode.brushingInteractive &&
//             _brushStrokes > 0)
//           Positioned(
//             top: size.height * 0.3,
//             left: size.width * 0.5,
//             child: TweenAnimationBuilder(
//               key: ValueKey(_brushStrokes),
//               tween: Tween<double>(begin: 0.0, end: 1.0),
//               duration: const Duration(milliseconds: 500),
//               builder: (context, double value, child) {
//                 return Opacity(
//                   opacity: 1 - value,
//                   child: Icon(
//                     Icons.star,
//                     size: 30 + (value * 20),
//                     color: Colors.yellowAccent,
//                   ),
//                 );
//               },
//             ),
//           ),
//       ],
//     );
//   }

//   Widget _buildHUD(Size size) {
//     return Positioned(
//       top: MediaQuery.of(context).padding.top + 10,
//       left: 16,
//       right: 16,
//       child: Row(
//         children: [
//           _buildStatChip(Icons.favorite, Colors.pinkAccent, '$_lovePoints'),
//           const SizedBox(width: 8),
//           _buildStatChip(
//             Icons.confirmation_number,
//             Colors.blueGrey,
//             '$_tickets',
//           ),
//           const SizedBox(width: 8),
//           _buildStatChip(Icons.monetization_on, Colors.amber, '$_coins'),
//           const Spacer(),
//           _buildStatChip(
//             Icons.cleaning_services,
//             Colors.cyan,
//             '$_cleanliness%',
//           ),
//           const SizedBox(width: 8),
//           _buildStatChip(Icons.mood, Colors.orange, '$_happiness%'),
//         ],
//       ),
//     );
//   }

//   Widget _buildStatChip(IconData icon, Color color, String label) {
//     return Container(
//       height: 36,
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.95),
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon, color: color, size: 18),
//           const SizedBox(width: 4),
//           Text(
//             label,
//             style: const TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.bold,
//               color: Colors.black87,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildControls(Size size) {
//     return Stack(
//       children: [
//         // Main action button (when idle)
//         if (_interactiveMode == InteractiveMode.none &&
//             _activity == PetActivity.idle)
//           Positioned(
//             top: size.height * 0.5,
//             left: 0,
//             right: 0,
//             child: Center(
//               child: GestureDetector(
//                 onTap: () => _showCareDialog(),
//                 child: Container(
//                   width: 150,
//                   height: 150,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFFFF176).withOpacity(0.95),
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Colors.white, width: 4),
//                     boxShadow: [
//                       BoxShadow(
//                         color: const Color(0xFFFFF176).withOpacity(0.5),
//                         blurRadius: 30,
//                         spreadRadius: 5,
//                       ),
//                     ],
//                   ),
//                   child: const Center(
//                     child: Text(
//                       'Take care',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.brown,
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),

//         // Back button (when not in living room)
//         if (_location != GameLocation.livingRoom &&
//             _interactiveMode == InteractiveMode.none)
//           Positioned(
//             bottom: 30,
//             left: 30,
//             child: FloatingActionButton.extended(
//               onPressed: () {
//                 setState(() => _location = GameLocation.livingRoom);
//               },
//               label: const Text('Main Room'),
//               icon: const Icon(Icons.home),
//               backgroundColor: Colors.brown,
//             ),
//           ),

//         // Dirty Mode Toggle (from commented code - DEV TOOLS)
//         Positioned(
//           bottom: 20,
//           right: 20,
//           child: FloatingActionButton.small(
//             onPressed: _toggleDirtyMode,
//             backgroundColor: _isDirtyMode ? Colors.redAccent : Colors.grey,
//             child: const Icon(Icons.cleaning_services),
//           ),
//         ),
//       ],
//     );
//   }

//   void _showCareDialog() {
//     showDialog(context: context, builder: (context) => _buildCareDialog());
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
//                     _buildCareOption(
//                       "Dry shampoo",
//                       icon: Icons.cut,
//                       onTap: _startInteractiveBathing,
//                     ),
//                     _buildCareOption(
//                       "Clean the sheets",
//                       icon: Icons.bed,
//                       onTap: _startSleeping,
//                     ),
//                     _buildCareOption(
//                       "Tooth brushing",
//                       icon: Icons.clean_hands,
//                       onTap: _startInteractiveBrushing,
//                     ),
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
//     VoidCallback? onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 130,
//         padding: const EdgeInsets.all(8),
//         child: Row(
//           children: [
//             // The "Box"
//             Container(
//               width: 40,
//               height: 40,
//               decoration: BoxDecoration(
//                 color: Colors.grey[300],
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: isSelected
//                   ? const Icon(Icons.check, color: Colors.grey)
//                   : (icon != null
//                         ? Icon(icon, size: 20, color: Colors.brown)
//                         : null),
//             ),
//             const SizedBox(width: 8),
//             // The Label
//             Expanded(
//               child: Container(
//                 padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
//                 decoration: BoxDecoration(
//                   color: icon != null
//                       ? const Color(0xFFFFF176)
//                       : null, // Yellow highlight for actions
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Text(
//                   label,
//                   style: const TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black54,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
