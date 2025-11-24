
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

enum PetActivity { idle, bathing, brushing, sleeping, toileting }

enum InteractiveMode {
  none,
  bathingInteractive,
  brushingInteractive,
  bedsheetInteractive,
}

class GameRoomScreen extends StatefulWidget {
  const GameRoomScreen({super.key});

  @override
  State<GameRoomScreen> createState() => _GameRoomScreenState();
}

class _GameRoomScreenState extends State<GameRoomScreen>
    with TickerProviderStateMixin {
  // --- DEBUG SETTINGS ---
  // 1. Set this to TRUE to see if the 3D viewer works with a known online model.
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
        return 'https://images.unsplash.com/photo-1552321554-5fefe8c9ef14?q=80&w=2000';
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

            // LAYER 8: Navigation & Dirty Mode
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
                  ? ModelViewer( // Logic: Use remote URL if Debug is ON, otherwise use local asset
                      src: _useRemoteDebugModel
                          ? 'https://modelviewer.dev/shared-assets/models/Astronaut.glb'
                          : 'assets/images/dog.glb',
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
    // Furniture widgets removed as requested
    return const SizedBox();
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
    if (_location == GameLocation.bathroom) {
      // UPDATED: Set to 0.15 to keep it "Middle Down" near the floor
      // Previous code had this higher at 0.25 for bathing
      if (_activity == PetActivity.bathing) return size.height * 0.15;
      if (_activity == PetActivity.brushing) return size.height * 0.22;
      return size.height * 0.15;
    }
    if (_location == GameLocation.bedroom &&
        _activity == PetActivity.sleeping) {
      return size.height * 0.3;
    }
    return size.height * 0.12;
  }

  double _getPetLeft(Size size) {
    if (_location == GameLocation.bathroom) {
      // UPDATED: Centered position for the bathroom
      // (size.width / 2) - 100 centers the 200-width pet container
      return (size.width / 2) - 100;
    }
    if (_location == GameLocation.bedroom &&
        _activity == PetActivity.sleeping) {
      return size.width * 0.2;
    }
    return (size.width / 2) - 100; // Default centered
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
