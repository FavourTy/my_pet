// import 'package:flutter/material.dart';
// import 'package:my_pet/utils/colors.dart';

// // 1. Generic Tabbed Dialog (Handles the Yellow/Grey tabs)
// class TabbedDialog extends StatefulWidget {
//   final String tab1Label;
//   final String tab2Label;
//   final Widget tab1Content;
//   final Widget tab2Content;
//   final IconData? icon;

//   const TabbedDialog({
//     super.key,
//     required this.tab1Label,
//     required this.tab2Label,
//     required this.tab1Content,
//     required this.tab2Content,
//     this.icon,
//   });

//   @override
//   State<TabbedDialog> createState() => _TabbedDialogState();
// }

// class _TabbedDialogState extends State<TabbedDialog> {
//   int _currentTab = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.transparent,
//       insetPadding: const EdgeInsets.all(15),
//       child: Stack(
//         clipBehavior: Clip.none,
//         alignment: Alignment.topCenter,
//         children: [
//           // Main Card
//           Container(
//             width: double.infinity,
//             // Remove top padding because tabs sit flush
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const SizedBox(height: 20), // Space for the floating icon
//                 // Tabs Row
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Row(
//                     children: [
//                       _buildTabButton(0, widget.tab1Label),
//                       _buildTabButton(1, widget.tab2Label),
//                     ],
//                   ),
//                 ),

//                 // Content Area
//                 Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: _currentTab == 0
//                       ? widget.tab1Content
//                       : widget.tab2Content,
//                 ),
//               ],
//             ),
//           ),

//           // Floating Icon (Top Left)
//           Positioned(
//             top: -15,
//             left: 0,
//             child: GestureDetector(
//               onTap: () => Navigator.pop(context),
//               child: Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: const BoxDecoration(
//                   color: AppColors.primaryYellow,
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Icon(Icons.close, color: Colors.black54, size: 20),
//               ),
//             ),
//           ),

//           // Help Icon (Top Right)
//           Positioned(
//             top: -15,
//             right: 0,
//             child: Container(
//               padding: const EdgeInsets.all(8),
//               decoration: const BoxDecoration(
//                 color: AppColors.primaryYellow,
//                 shape: BoxShape.circle,
//               ),
//               child: const Icon(
//                 Icons.question_mark,
//                 color: Colors.black54,
//                 size: 20,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTabButton(int index, String label) {
//     final bool isActive = _currentTab == index;
//     return Expanded(
//       child: GestureDetector(
//         onTap: () => setState(() => _currentTab = index),
//         child: Container(
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           decoration: BoxDecoration(
//             color: isActive ? AppColors.primaryYellow : const Color(0xFFE0E0E0),
//             borderRadius: BorderRadius.only(
//               topLeft: index == 0 ? const Radius.circular(10) : Radius.zero,
//               topRight: index == 1 ? const Radius.circular(10) : Radius.zero,
//             ),
//           ),
//           child: Center(
//             child: Text(
//               label,
//               style: TextStyle(
//                 color: isActive ? Colors.black87 : Colors.grey,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 12,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // 2. Step Counter Widget (Screen 16)
// class StepCounterWidget extends StatelessWidget {
//   const StepCounterWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Circular Progress
//         SizedBox(
//           height: 180,
//           width: 180,
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               SizedBox(
//                 height: 150,
//                 width: 150,
//                 child: CircularProgressIndicator(
//                   value: 0.15, // 1234 / 8000
//                   strokeWidth: 8,
//                   backgroundColor: Colors.grey[300],
//                   valueColor: const AlwaysStoppedAnimation<Color>(
//                     Colors.black54,
//                   ),
//                 ),
//               ),
//               Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: const [
//                   Text(
//                     "today",
//                     style: TextStyle(fontSize: 10, color: Colors.grey),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     "1234 steps",
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black54,
//                     ),
//                   ),
//                   Text(
//                     "/8000",
//                     style: TextStyle(fontSize: 14, color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),

//         // Stats Row
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [_buildStat("123", "m"), _buildStat("123", "Kcal")],
//         ),

//         const SizedBox(height: 20),

//         // Achievement Bar
//         const Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//             "Achievement bonus",
//             style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//           ),
//         ),
//         const SizedBox(height: 5),
//         Stack(
//           children: [
//             Container(
//               height: 8,
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(4),
//               ),
//             ),
//             FractionallySizedBox(
//               widthFactor: 0.6,
//               child: Container(
//                 height: 8,
//                 decoration: BoxDecoration(
//                   color: AppColors.primaryYellow,
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//               ),
//             ),
//           ],
//         ),

//         const SizedBox(height: 20),

//         // Grey Info Box
//         Container(
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: const Color(0xFFE0E0E0),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: const [
//               Text("Points to be earned today", style: TextStyle(fontSize: 10)),
//               Text(
//                 "100 points",
//                 style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//         ),

//         const SizedBox(height: 20),
//         const Text(
//           "<Convert to points>",
//           style: TextStyle(fontSize: 12, color: Colors.grey),
//         ),
//         const Text(
//           "123+100 → 223(+100)",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         CircularActionButton(
//           label: "convert",
//           onTap: () {},
//           isWarning: false,
//         ),
//       ],
//     );
//   }

//   Widget _buildStat(String val, String unit) {
//     return Column(
//       children: [
//         Text(val, style: const TextStyle(fontSize: 20, color: Colors.black54)),
//         Text(unit, style: const TextStyle(fontSize: 12, color: Colors.grey)),
//       ],
//     );
//   }
// }

// // 3. Points Conversion List (Screen 14)
// class PointsListWidget extends StatelessWidget {
//   const PointsListWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Text(
//           "<Current points>",
//           style: TextStyle(fontSize: 12, color: Colors.grey),
//         ),
//         const Text(
//           "12345",
//           style: TextStyle(
//             fontSize: 32,
//             fontWeight: FontWeight.bold,
//             color: Colors.black54,
//           ),
//         ),
//         const Divider(height: 30),
//         const Text(
//           "Convert points to coins",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 14,
//             color: Colors.black54,
//           ),
//         ),
//         const SizedBox(height: 20),

//         _buildConvertRow("10 -> 20"),
//         _buildConvertRow("10 -> 20"),
//         _buildConvertRow("10 -> 20"),
//         _buildConvertRow("10 -> 20"),
//       ],
//     );
//   }

//   Widget _buildConvertRow(String text) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             text,
//             style: const TextStyle(fontSize: 16, color: Colors.black54),
//           ),
//           GestureDetector(
//             onTap: () {},
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//               decoration: BoxDecoration(
//                 color: AppColors.primaryYellow,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: const Text(
//                 "convert",
//                 style: TextStyle(
//                   fontSize: 10,
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

// // 4. Love Years Widget (Screen 12)
// class LoveYearsWidget extends StatelessWidget {
//   const LoveYearsWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(height: 20),
//         const Text(
//           "<Current number of years of love>",
//           style: TextStyle(fontSize: 10, color: Colors.grey),
//         ),
//         const Text(
//           "Thank you for your love",
//           style: TextStyle(fontSize: 10, color: Colors.grey),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "12 years 1 month",
//           style: TextStyle(fontSize: 28, color: Colors.black54),
//         ),
//         const Divider(height: 40),
//         const Text(
//           "<Next love years reward>",
//           style: TextStyle(fontSize: 12, color: Colors.grey),
//         ),
//         const SizedBox(height: 20),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: 60,
//               height: 60,
//               decoration: BoxDecoration(
//                 color: Colors.grey[300],
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             const SizedBox(width: 15),
//             const Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "dummy text dummy text",
//                   style: TextStyle(fontSize: 12, color: Colors.black54),
//                 ),
//                 Text(
//                   "x1",
//                   style: TextStyle(fontSize: 12, color: Colors.black54),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// // 5. HP Info Widget (Screen 13)
// class HPInfoWidget extends StatelessWidget {
//   const HPInfoWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(height: 20),
//         const Text(
//           "<Current HP>",
//           style: TextStyle(fontSize: 12, color: Colors.grey),
//         ),
//         const Text(
//           "123/1000",
//           style: TextStyle(fontSize: 32, color: Colors.black54),
//         ),
//         const Divider(height: 40),
//         const Text(
//           "<HP recovery>",
//           style: TextStyle(fontSize: 12, color: Colors.grey),
//         ),
//         const Text(
//           "123+100 → 223(+100)",
//           style: TextStyle(fontSize: 16, color: Colors.black54),
//         ),
//         const SizedBox(height: 20),

//         // Using the common circular button but overriding size in a row or just mimicking style
//         GestureDetector(
//           onTap: () {},
//           child: Container(
//             width: 150,
//             padding: const EdgeInsets.symmetric(vertical: 12),
//             decoration: BoxDecoration(
//               color: AppColors.primaryYellow,
//               borderRadius: BorderRadius.circular(30),
//             ),
//             child: const Center(
//               child: Text(
//                 "Recover HP",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black54,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// //calling the function in hud

// void _showStepsDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (context) => const TabbedDialog(
//       tab1Label: "number of steps",
//       tab2Label: "points",
//       icon: Icons.close,
//       tab1Content: StepCounterWidget(),
//       tab2Content: PointsListWidget(),
//     ),
//   );
// }

// void _showLoveDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (context) => const TabbedDialog(
//       tab1Label: "years of love",
//       tab2Label: "HP information",
//       icon: Icons.close,
//       tab1Content: LoveYearsWidget(),
//       tab2Content: HPInfoWidget(),
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';

// ============================================================================
// 1. GENERIC TABBED DIALOG WRAPPER (Handles the Yellow/Grey tabs & Close btn)
// ============================================================================
class TabbedDialog extends StatefulWidget {
  final String tab1Label;
  final String tab2Label;
  final Widget tab1Content;
  final Widget tab2Content;

  const TabbedDialog({
    super.key,
    required this.tab1Label,
    required this.tab2Label,
    required this.tab1Content,
    required this.tab2Content,
  });

  @override
  State<TabbedDialog> createState() => _TabbedDialogState();
}

class _TabbedDialogState extends State<TabbedDialog> {
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          // Main Card
          Container(
            width: double.infinity,
            constraints: const BoxConstraints(
              maxHeight: 600,
            ), // Prevent overflow
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 30), // Space for top icons
                // Tabs Row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      _buildTabButton(0, widget.tab1Label),
                      _buildTabButton(1, widget.tab2Label),
                    ],
                  ),
                ),

                // Content Area
                Flexible(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: _currentTab == 0
                        ? widget.tab1Content
                        : widget.tab2Content,
                  ),
                ),
              ],
            ),
          ),

          // Close Icon (Top Left)
          Positioned(
            top: -15,
            left: 0,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: AppColors.primaryYellow,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, color: Colors.black54, size: 20),
              ),
            ),
          ),

          // Help Icon (Top Right)
          Positioned(
            top: -15,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: AppColors.primaryYellow,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.question_mark,
                color: Colors.black54,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(int index, String label) {
    final bool isActive = _currentTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _currentTab = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isActive ? AppColors.primaryYellow : const Color(0xFFE0E0E0),
            borderRadius: BorderRadius.only(
              topLeft: index == 0 ? const Radius.circular(12) : Radius.zero,
              topRight: index == 1 ? const Radius.circular(12) : Radius.zero,
              // bottom corners zero for tab look
            ),
          ),
          child: Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isActive ? Colors.black87 : Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 11, // Slightly smaller for long text
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// 2. SCREEN 16: NUMBER OF STEPS CONTENT
// ============================================================================
class StepCounterWidget extends StatelessWidget {
  const StepCounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Circular Progress (Using Standard Widgets)
        SizedBox(
          height: 200,
          width: 200,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 160,
                width: 160,
                child: CircularProgressIndicator(
                  value: 0.15, // 1234 / 8000
                  strokeWidth: 10,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Colors.black54,
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "today",
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "1234 steps",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    "/8000",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              // "Yesterday>" text
              const Positioned(
                top: 20,
                right: 0,
                child: Text(
                  "Yesterday>",
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),

        // Stats Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [_buildStat("123", "m"), _buildStat("123", "Kcal")],
        ),

        const SizedBox(height: 20),

        // Achievement Bar
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Achievement bonus",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Stack(
              children: [
                Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                  width: 150,
                  height: 10,
                  decoration: BoxDecoration(
                    color: AppColors.primaryYellow,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
            // Bonus circles
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBonusCircle("+50"),
                _buildBonusCircle("+50"),
                _buildBonusCircle("+70"),
              ],
            ),
          ],
        ),

        const SizedBox(height: 20),

        // Grey Info Box
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFE0E0E0),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Points to be earned today", style: TextStyle(fontSize: 10)),
              Text(
                "100 points",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),
        const Divider(),
        const Text(
          "<Convert to points>",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 5),
        const Text(
          "123+100 → 223(+100)",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 15),
        CircularActionButton(label: "convert", onTap: () {}, isWarning: false),
      ],
    );
  }

  Widget _buildStat(String val, String unit) {
    return Column(
      children: [
        Text(val, style: const TextStyle(fontSize: 24, color: Colors.black54)),
        Text(unit, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }

  Widget _buildBonusCircle(String text) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
        color: Color(0xFFE0E0E0),
        shape: BoxShape.circle,
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 8, color: Colors.grey),
      ),
    );
  }
}

// ============================================================================
// 3. SCREEN 14: POINTS CONTENT
// ============================================================================
class PointsListWidget extends StatelessWidget {
  const PointsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "<Current points>",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const Text(
          "12345",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 10),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Convert points to coins",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ),
        const SizedBox(height: 20),

        _buildConvertRow("10 → 20"),
        _buildConvertRow("10 → 20"),
        _buildConvertRow("10 → 20"),
        _buildConvertRow("10 → 20"),
      ],
    );
  }

  Widget _buildConvertRow(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.only(bottom: 15),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 18, color: Colors.black54),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.primaryYellow,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "convert",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// 4. SCREEN 12: YEARS OF LOVE CONTENT
// ============================================================================
class LoveYearsWidget extends StatelessWidget {
  const LoveYearsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          "<Current number of years of love>",
          style: TextStyle(fontSize: 10, color: Colors.grey),
        ),
        const Text(
          "Thank you for your love",
          style: TextStyle(fontSize: 10, color: Colors.grey),
        ),
        const SizedBox(height: 20),
        const Text(
          "12 years 1 month",
          style: TextStyle(fontSize: 32, color: Colors.black54),
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        const Text(
          "<Next love years reward>",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(width: 15),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "dummy text dummy text",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Text(
                  "x1",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

// ============================================================================
// 5. SCREEN 13: HP INFO CONTENT
// ============================================================================
class HPInfoWidget extends StatelessWidget {
  const HPInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          "<Current HP>",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const Text(
          "123/1000",
          style: TextStyle(fontSize: 40, color: Colors.black54),
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        const Text(
          "<HP recovery>",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 10),
        const Text(
          "123+100 → 223(+100)",
          style: TextStyle(fontSize: 20, color: Colors.black54),
        ),
        const SizedBox(height: 30),

        GestureDetector(
          onTap: () {},
          child: Container(
            width: 180,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.primaryYellow,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Center(
              child: Text(
                "Recover HP",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// 6. SCREEN 11: FAQ DETAIL DIALOG (REPEATED FOR COMPLETENESS)
// ============================================================================
class FaqDetailDialog extends StatelessWidget {
  const FaqDetailDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "Frequently asked questions",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "dummy text dummy text dummy text dummy text",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 15),

                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F0F0),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    "dummy text",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                const Divider(height: 30),

                const Text(
                  "dummy text dummy text dummy text\ndummy text dummy text dummy text",
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 30),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F0F0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Was this article helpful?",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(child: _buildBtn("yes", false)),
                          const SizedBox(width: 10),
                          Expanded(child: _buildBtn("No", true)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    "Contact customer support directly",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                const SizedBox(height: 5),
                Center(child: _buildBtn("Inquiry", true, width: 150)),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    "Return to home",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -15,
            left: -10,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: AppColors.primaryYellow,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBtn(String label, bool isYellow, {double? width}) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: isYellow ? AppColors.primaryYellow : Colors.white,
        border: isYellow ? null : Border.all(color: AppColors.primaryYellow),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
