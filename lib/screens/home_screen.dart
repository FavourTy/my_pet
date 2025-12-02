// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import '../providers/app_state_provider.dart';
// import '../widgets/status_bar_widget.dart';
// import '../widgets/currency_display.dart';
// import '../widgets/bottom_navigation.dart';
// import '../widgets/side_navigation.dart';
// import '../widgets/pet_display.dart';
// import '../widgets/action_buttons.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedTabIndex = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AppStateProvider>(
//       builder: (context, appState, child) {
//         final user = appState.currentUser;
//         final activePet = appState.activePet;
//         final skyDarkness = appState.skyDarkness;

//         return Scaffold(
//           body: Stack(
//             children: [
//               AnimatedContainer(
//                 duration: Duration(seconds: 2),
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Color.lerp(
//                         Color(0xFFE3F2FD),
//                         Color(0xFF1A237E),
//                         skyDarkness,
//                       )!,
//                       Color.lerp(Colors.white, Color(0xFF263238), skyDarkness)!,
//                     ],
//                   ),
//                 ),
//               ),

//               // Pet Display
//               if (activePet != null)
//                 Positioned.fill(child: PetDisplay(pet: activePet)),

//               // Status Bar
//               StatusBarWidget(),

//               // Header with HP and Currency
//               Positioned(
//                 top: 50,
//                 left: 0,
//                 right: 0,
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 16),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // HP Bar
//                       if (activePet != null) _buildHPBar(activePet),

//                       // Currency Display
//                       if (user != null) CurrencyDisplay(user: user),
//                     ],
//                   ),
//                 ),
//               ).animate().fadeIn(duration: 500.ms).slideY(begin: -0.2),

//               // Side Navigation
//               Positioned(
//                 right: 0,
//                 top: 180,
//                 child: SideNavigation(),
//               ).animate().fadeIn(delay: 200.ms).slideX(begin: 1),
//               Positioned(
//                 bottom: 96,
//                 left: 0,
//                 right: 0,
//                 child: ActionButtons(selectedTab: _selectedTabIndex),
//               ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.5),
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: BottomNavigation(
//                   selectedIndex: _selectedTabIndex,
//                   onTabSelected: (index) {
//                     setState(() {
//                       _selectedTabIndex = index;
//                     });
//                   },
//                 ),
//               ).animate().fadeIn(delay: 600.ms).slideY(begin: 1),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildHPBar(pet) {
//     return Container(
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.95),
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 8,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Icon(Icons.favorite, color: Color(0xFFFF6B9D), size: 28),
//           SizedBox(width: 12),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 '${pet.hp}/${pet.maxHp}',
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Color(0xFF8C8C8C),
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               Container(
//                 width: 80,
//                 height: 4,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//                 child: FractionallySizedBox(
//                   alignment: Alignment.centerLeft,
//                   widthFactor: pet.hpPercentage,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [Color(0xFFFFC0CB), Color(0xFFFF6B9D)],
//                       ),
//                       borderRadius: BorderRadius.circular(2),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 2),
//               Text(
//                 '${pet.yearsOld} years old',
//                 style: TextStyle(fontSize: 8, color: Color(0xFF8C8C8C)),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import '../providers/app_state_provider.dart';
// import '../widgets/status_bar_widget.dart';
// import '../widgets/currency_display.dart';
// import '../widgets/bottom_navigation.dart';
// import '../widgets/side_navigation.dart';

// import '../widgets/action_buttons.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedTabIndex = 1;

//   // Background image URL (matches your previous screens)
//   final String _bgImage = 'assets/images/bg_image.png';

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AppStateProvider>(
//       builder: (context, appState, child) {
//         final user = appState.currentUser;
//         // final activePet = appState.activePet;
//         final skyDarkness = appState.skyDarkness;

//         return Scaffold(
//           body: Stack(
//             children: [
//               Positioned.fill(child: Image.asset(_bgImage, fit: BoxFit.cover)),

//               Positioned.fill(
//                 child: AnimatedContainer(
//                   duration: Duration(seconds: 2),
//                   color: Colors.black.withOpacity(
//                     skyDarkness * 0.6,
//                   ), // Max 60% darkness
//                 ),
//               ),

//               // if (activePet != null)
//               //   Positioned.fill(child: PetDisplay(pet: activePet)),
//               SafeArea(
//                 child: Stack(
//                   children: [
//                     // Status Bar
//                     Positioned(
//                       top: 0,
//                       left: 0,
//                       right: 0,
//                       child: StatusBarWidget(),
//                     ),

//                     // Header with HP and Currency
//                     Positioned(
//                       top: 60, // Pushed down slightly
//                       left: 16,
//                       right: 16,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           // HP Bar
//                           //  if (activePet != null) _buildHPBar(activePet),

//                           // Currency Display
//                           if (user != null) CurrencyDisplay(user: user),
//                         ],
//                       ),
//                     ).animate().fadeIn(duration: 500.ms).slideY(begin: -0.2),

//                     // Side Navigation
//                     // CHANGED: Added 'right: 16' to prevent it from being cut off
//                     Positioned(
//                       right: 16,
//                       top: 180,
//                       child: SideNavigation(),
//                     ).animate().fadeIn(delay: 200.ms).slideX(begin: 1),

//                     // Action Buttons (Feed, Play, etc.)
//                     Positioned(
//                       bottom: 96,
//                       left: 0,
//                       right: 0,
//                       child: ActionButtons(selectedTab: _selectedTabIndex),
//                     ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.5),

//                     // Bottom Navigation
//                     Positioned(
//                       bottom: 0,
//                       left: 0,
//                       right: 0,
//                       child: BottomNavigation(
//                         selectedIndex: _selectedTabIndex,
//                         onTabSelected: (index) {
//                           setState(() {
//                             _selectedTabIndex = index;
//                           });
//                         },
//                       ),
//                     ).animate().fadeIn(delay: 600.ms).slideY(begin: 1),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildHPBar(pet) {
//     return Container(
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.95),
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 8,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Icon(Icons.favorite, color: Color(0xFFFF6B9D), size: 28),
//           SizedBox(width: 12),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 '${pet.hp}/${pet.maxHp}',
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Color(0xFF8C8C8C),
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               Container(
//                 width: 80,
//                 height: 4,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//                 child: FractionallySizedBox(
//                   alignment: Alignment.centerLeft,
//                   widthFactor: pet.hpPercentage,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [Color(0xFFFFC0CB), Color(0xFFFF6B9D)],
//                       ),
//                       borderRadius: BorderRadius.circular(2),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 2),
//           Text(
//             '${pet.yearsOld} years old',
//             style: TextStyle(fontSize: 8, color: Color(0xFF8C8C8C)),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import '../providers/app_state_provider.dart';
// import '../widgets/status_bar_widget.dart';
// import '../widgets/currency_display.dart';
// import '../widgets/bottom_navigation.dart';
// import '../widgets/side_navigation.dart';
// // PetDisplay import removed as requested
// import '../widgets/action_buttons.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedTabIndex = 1;

//   // Changed to Asset Image as requested
//   final String _bgImage = 'assets/images/bg_image.png';

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AppStateProvider>(
//       builder: (context, appState, child) {
//         final user = appState.currentUser;
//         final activePet = appState.activePet; // Can be null
//         final skyDarkness = appState.skyDarkness;

//         return Scaffold(
//           body: Stack(
//             children: [
//               // ------------------------------------------------------
//               // 1. BACKGROUND IMAGE LAYER
//               // ------------------------------------------------------
//               Positioned.fill(
//                 child: Image.asset(
//                   _bgImage,
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) {
//                     return Container(
//                       color: Colors.grey,
//                     ); // Fallback if asset missing
//                   },
//                 ),
//               ),

//               // ------------------------------------------------------
//               // 2. DAY/NIGHT CYCLE OVERLAY
//               // ------------------------------------------------------
//               Positioned.fill(
//                 child: AnimatedContainer(
//                   duration: Duration(seconds: 2),
//                   color: Colors.black.withOpacity(skyDarkness * 0.6),
//                 ),
//               ),

//               // ------------------------------------------------------
//               // 3. UI LAYER (Wrapped in SafeArea)
//               // ------------------------------------------------------
//               SafeArea(
//                 child: Stack(
//                   children: [
//                     // Status Bar
//                     Positioned(
//                       top: 0,
//                       left: 0,
//                       right: 0,
//                       child: StatusBarWidget(),
//                     ),

//                     // Header with HP and Currency
//                     Positioned(
//                       top: 60,
//                       left: 16,
//                       right: 16,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           // HP Bar - Always shown, handles null pet internally
//                           _buildHPBar(activePet),

//                           // Currency Display
//                           if (user != null) CurrencyDisplay(user: user),
//                         ],
//                       ),
//                     ).animate().fadeIn(duration: 500.ms).slideY(begin: -0.2),

//                     // Side Navigation
//                     // INCREASED right padding to 20 to prevent cutting off
//                     Positioned(
//                       right: 20,
//                       top: 180,
//                       child: SideNavigation(),
//                     ).animate().fadeIn(delay: 200.ms).slideX(begin: 1),

//                     // Action Buttons
//                     Positioned(
//                       bottom: 96,
//                       left: 0,
//                       right: 0,
//                       child: ActionButtons(selectedTab: _selectedTabIndex),
//                     ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.5),

//                     // Bottom Navigation
//                     Positioned(
//                       bottom: 0,
//                       left: 0,
//                       right: 0,
//                       child: BottomNavigation(
//                         selectedIndex: _selectedTabIndex,
//                         onTabSelected: (index) {
//                           setState(() {
//                             _selectedTabIndex = index;
//                           });
//                         },
//                       ),
//                     ).animate().fadeIn(delay: 600.ms).slideY(begin: 1),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildHPBar(dynamic pet) {
//     // Default values if no pet is selected
//     final int currentHp = pet?.hp ?? 100;
//     final int maxHp = pet?.maxHp ?? 100;
//     final double hpPercent = pet?.hpPercentage ?? 1.0;
//     final int yearsOld = pet?.yearsOld ?? 0;

//     return Container(
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.95),
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 8,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Icon(Icons.favorite, color: Color(0xFFFF6B9D), size: 28),
//           SizedBox(width: 12),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 '$currentHp/$maxHp',
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Color(0xFF8C8C8C),
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               Container(
//                 width: 80,
//                 height: 4,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//                 child: FractionallySizedBox(
//                   alignment: Alignment.centerLeft,
//                   widthFactor: hpPercent,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [Color(0xFFFFC0CB), Color(0xFFFF6B9D)],
//                       ),
//                       borderRadius: BorderRadius.circular(2),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 2),
//           Text(
//             '$yearsOld years old',
//             style: TextStyle(fontSize: 8, color: Color(0xFF8C8C8C)),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import '../providers/app_state_provider.dart';
// import '../widgets/status_bar_widget.dart';
// import '../widgets/currency_display.dart';
// import '../widgets/bottom_navigation.dart';
// import '../widgets/side_navigation.dart';
// // PetDisplay import removed as requested
// import '../widgets/action_buttons.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedTabIndex = 1;

//   // Changed to Asset Image as requested
//   final String _bgImage = 'assets/images/bg_image.png';

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AppStateProvider>(
//       builder: (context, appState, child) {
//         final user = appState.currentUser;
//         final activePet = appState.activePet; // Can be null
//         final skyDarkness = appState.skyDarkness;

//         return Scaffold(
//           body: Stack(
//             children: [
//               // ------------------------------------------------------
//               // 1. BACKGROUND IMAGE LAYER
//               // ------------------------------------------------------
//               Positioned.fill(
//                 child: Image.asset(
//                   _bgImage,
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) {
//                     return Container(
//                       color: Colors.grey,
//                     ); // Fallback if asset missing
//                   },
//                 ),
//               ),

//               // ------------------------------------------------------
//               // 2. DAY/NIGHT CYCLE OVERLAY
//               // ------------------------------------------------------
//               Positioned.fill(
//                 child: AnimatedContainer(
//                   duration: Duration(seconds: 2),
//                   color: Colors.black.withOpacity(skyDarkness * 0.6),
//                 ),
//               ),

//               // ------------------------------------------------------
//               // 3. UI LAYER (Wrapped in SafeArea)
//               // ------------------------------------------------------
//               SafeArea(
//                 child: Stack(
//                   children: [
//                     // Status Bar
//                     Positioned(
//                       top: 0,
//                       left: 0,
//                       right: 0,
//                       child: StatusBarWidget(),
//                     ),

//                     // Header with HP and Currency
//                     Positioned(
//                       top: 60,
//                       left: 16,
//                       right: 16,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           // HP Bar - Always shown, handles null pet internally
//                           _buildHPBar(activePet),

//                           // Currency Display
//                           if (user != null)
//                             Flexible(child: CurrencyDisplay(user: user)),
//                         ],
//                       ),
//                     ).animate().fadeIn(duration: 500.ms).slideY(begin: -0.2),

//                     // Side Navigation
//                     // INCREASED right padding to 20 to prevent cutting off
//                     Positioned(
//                       right: 20,
//                       top: 180,
//                       child: SideNavigation(),
//                     ).animate().fadeIn(delay: 200.ms).slideX(begin: 1),

//                     // Action Buttons
//                     Positioned(
//                       bottom: 96,
//                       left: 0,
//                       right: 0,
//                       child: ActionButtons(selectedTab: _selectedTabIndex),
//                     ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.5),

//                     // Bottom Navigation
//                     Positioned(
//                       bottom: 0,
//                       left: 0,
//                       right: 0,
//                       child: BottomNavigation(
//                         selectedIndex: _selectedTabIndex,
//                         onTabSelected: (index) {
//                           setState(() {
//                             _selectedTabIndex = index;
//                           });
//                         },
//                       ),
//                     ).animate().fadeIn(delay: 600.ms).slideY(begin: 1),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildHPBar(dynamic pet) {
//     // Default values if no pet is selected
//     final int currentHp = pet?.hp ?? 100;
//     final int maxHp = pet?.maxHp ?? 100;
//     final double hpPercent = pet?.hpPercentage ?? 1.0;
//     final int yearsOld = pet?.yearsOld ?? 0;

//     return Container(
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.95),
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 8,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Icon(Icons.favorite, color: Color(0xFFFF6B9D), size: 28),
//           SizedBox(width: 12),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 '$currentHp/$maxHp',
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Color(0xFF8C8C8C),
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               Container(
//                 width: 80,
//                 height: 4,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//                 child: FractionallySizedBox(
//                   alignment: Alignment.centerLeft,
//                   widthFactor: hpPercent,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [Color(0xFFFFC0CB), Color(0xFFFF6B9D)],
//                       ),
//                       borderRadius: BorderRadius.circular(2),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 2),
//           Text(
//             '$yearsOld years old',
//             style: TextStyle(fontSize: 8, color: Color(0xFF8C8C8C)),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:my_pet/widgets/dialog_widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../providers/app_state_provider.dart';
import '../widgets/status_bar_widget.dart';
import '../widgets/currency_display.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/side_navigation.dart';
// PetDisplay import removed as requested
import '../widgets/action_buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTabIndex = 1;

  // Changed to Asset Image as requested
  final String _bgImage = 'assets/images/bg_image.png';
  void _showLoveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const TabbedDialog(
        tab1Label: "years of love",
        tab2Label: "HP information",
        // icon: Icons.close,
        tab1Content: LoveYearsWidget(),
        tab2Content: HPInfoWidget(),
      ),
    );
  }

  void _showStepsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const TabbedDialog(
        tab1Label: "number of steps",
        tab2Label: "points",
        //  icon: Icons.close,
        tab1Content: StepCounterWidget(),
        tab2Content: PointsListWidget(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(
      builder: (context, appState, child) {
        final user = appState.currentUser;
        final activePet = appState.activePet; // Can be null
        final skyDarkness = appState.skyDarkness;

        return Scaffold(
          body: Stack(
            children: [
              // ------------------------------------------------------
              // 1. BACKGROUND IMAGE LAYER
              // ------------------------------------------------------
              Positioned.fill(
                child: Image.asset(
                  _bgImage,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey,
                    ); // Fallback if asset missing
                  },
                ),
              ),

              // ------------------------------------------------------
              // 2. DAY/NIGHT CYCLE OVERLAY
              // ------------------------------------------------------
              Positioned.fill(
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  color: Colors.black.withOpacity(skyDarkness * 0.6),
                ),
              ),

              // ------------------------------------------------------
              // 3. UI LAYER (Wrapped in SafeArea)
              // ------------------------------------------------------
              SafeArea(
                child: Stack(
                  children: [
                    // Status Bar
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: StatusBarWidget(),
                    ),

                    Positioned(
                      top: 10,
                      left: 12,
                      right: 12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(flex: 4, child: _buildHPBar(activePet)),

                          SizedBox(width: 8),
                          if (user != null)
                            Flexible(
                              flex: 5,
                              child: GestureDetector(
                                onTap: () {
                                  _showStepsDialog(context);
                                },
                                child: CurrencyDisplay(user: user),
                              ),
                            ),
                        ],
                      ),
                    ).animate().fadeIn(duration: 500.ms).slideY(begin: -0.2),
                    Positioned(
                      right: 20,
                      top: 180,
                      child: SideNavigation(),
                    ).animate().fadeIn(delay: 200.ms).slideX(begin: 1),

                    Positioned(
                      bottom: 96,
                      left: 0,
                      right: 0,
                      child: ActionButtons(selectedTab: _selectedTabIndex),
                    ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.5),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: BottomNavigation(
                        selectedIndex: _selectedTabIndex,
                        onTabSelected: (index) {
                          setState(() {
                            _selectedTabIndex = index;
                          });
                        },
                      ),
                    ).animate().fadeIn(delay: 600.ms).slideY(begin: 1),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHPBar(dynamic pet) {
    // Default values if no pet is selected
    final int currentHp = pet?.hp ?? 100;
    final int maxHp = pet?.maxHp ?? 100;
    final double hpPercent = pet?.hpPercentage ?? 1.0;
    final int yearsOld = pet?.yearsOld ?? 0;

    return GestureDetector(
      onTap: () {
        _showLoveDialog(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ), // Reduced padding
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Shrink to fit content
          children: [
            Icon(
              Icons.favorite,
              color: Color(0xFFFF6B9D),
              size: 24,
            ), // Slightly smaller icon
            SizedBox(width: 8),
            Flexible(
              // Allow column to shrink
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$currentHp/$maxHp',
                    style: TextStyle(
                      fontSize: 12, // Slightly smaller font
                      color: Color(0xFF8C8C8C),
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    width: 60, // Reduced width from 80 to 60 to fix overflow
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: hpPercent,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFFFFC0CB), Color(0xFFFF6B9D)],
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            // Years Old Text - Wrapped to handle small screens
            Flexible(
              child: Text(
                '$yearsOld yrs',
                style: TextStyle(fontSize: 10, color: Color(0xFF8C8C8C)),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
