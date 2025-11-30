// import 'package:flutter/material.dart';
// import 'package:my_pet/utils/colors.dart';


// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white, // Background appears white in screen 18
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Column(
//               children: [
//                 // 1. Header
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 10,
//                   ),
//                   child: Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () => Navigator.pop(context),
//                         child: const CircleAvatar(
//                           backgroundColor: AppColors.primaryYellow,
//                           radius: 15,
//                           child: Icon(
//                             Icons.close,
//                             size: 16,
//                             color: Colors.black54,
//                           ),
//                         ),
//                       ),
//                       const Expanded(
//                         child: Center(
//                           child: Text(
//                             "Profile",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black54,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 12,
//                           vertical: 6,
//                         ),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: const Text(
//                           "ID:Aaaa1234  #",
//                           style: TextStyle(fontSize: 10, color: Colors.black54),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 Expanded(
//                   child: SingleChildScrollView(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Edit Button
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 20,
//                               vertical: 8,
//                             ),
//                             decoration: BoxDecoration(
//                               color: AppColors.primaryYellow,
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: const Text(
//                               "Edit",
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black54,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10),

//                         // 2. Main Profile Card
//                         Container(
//                           padding: const EdgeInsets.all(20),
//                           decoration: BoxDecoration(
//                             color: const Color(0xFFD9D9D9),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     width: 80,
//                                     height: 80,
//                                     decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(12),
//                                       border: Border.all(color: Colors.grey),
//                                     ),
//                                   ),
//                                   const SizedBox(width: 15),
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const Text(
//                                           "Owner name: xxxx",
//                                           style: TextStyle(
//                                             fontSize: 12,
//                                             color: Colors.black54,
//                                           ),
//                                         ),
//                                         const Text(
//                                           "Years of love: XX years XX da",
//                                           style: TextStyle(
//                                             fontSize: 12,
//                                             color: Colors.black54,
//                                           ),
//                                         ),
//                                         const Text(
//                                           "Residence: XXXTown",
//                                           style: TextStyle(
//                                             fontSize: 12,
//                                             color: Colors.black54,
//                                           ),
//                                         ),
//                                         const SizedBox(height: 10),
//                                         Row(
//                                           children: const [
//                                             CircleAvatar(
//                                               radius: 12,
//                                               backgroundColor: Colors.white,
//                                               child: Text(
//                                                 "badge",
//                                                 style: TextStyle(fontSize: 6),
//                                               ),
//                                             ),
//                                             SizedBox(width: 5),
//                                             CircleAvatar(
//                                               radius: 12,
//                                               backgroundColor: Colors.white,
//                                               child: Text(
//                                                 "badge",
//                                                 style: TextStyle(fontSize: 6),
//                                               ),
//                                             ),
//                                             SizedBox(width: 5),
//                                             CircleAvatar(
//                                               radius: 12,
//                                               backgroundColor: Colors.white,
//                                               child: Text(
//                                                 "badge",
//                                                 style: TextStyle(fontSize: 6),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 15),
//                               Container(
//                                 width: double.infinity,
//                                 padding: const EdgeInsets.all(10),
//                                 color: const Color(0xFFEEEEEE),
//                                 child: const Text(
//                                   "dummy text dummy text dummy text\ndummy text dummy text dummy text",
//                                   style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(height: 15),
//                               const Text(
//                                 "Breeding status",
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black54,
//                                 ),
//                               ),
//                               const Divider(color: Colors.grey),
//                               const Text(
//                                 "Number of tournament participants XX times",
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: Colors.black54,
//                                 ),
//                               ),
//                               const Text(
//                                 "Number of walks: XX times",
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: Colors.black54,
//                                 ),
//                               ),
//                               const Text(
//                                 "Number of event participants XX times",
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: Colors.black54,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),

//                         const SizedBox(height: 20),
//                         const Text(
//                           "Breeding pets",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black54,
//                           ),
//                         ),
//                         const SizedBox(height: 10),

//                         // 3. Pets List
//                         _buildPetCard(),
//                         const SizedBox(height: 10),
//                         _buildPetCard(),
//                         const SizedBox(height: 100), // Space for bottom nav
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             // Float Button (Friend Request Trigger)
//             Positioned(
//               bottom: 100,
//               left: 20,
//               child: GestureDetector(
//                 onTap: () => _showFriendRequestDialog(context),
//                 child: Container(
//                   padding: const EdgeInsets.all(12),
//                   decoration: const BoxDecoration(
//                     color: AppColors.primaryYellow,
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Icon(Icons.person_add, color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPetCard() {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: const Color(0xFFD9D9D9),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 60,
//             height: 60,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//             ),
//           ),
//           const SizedBox(width: 10),
//           const Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Pet name: xxxx",
//                 style: TextStyle(fontSize: 10, color: Colors.black54),
//               ),
//               Text(
//                 "Type: Chihuahua",
//                 style: TextStyle(fontSize: 10, color: Colors.black54),
//               ),
//               Text(
//                 "Birthday: 2027/07/07",
//                 style: TextStyle(fontSize: 10, color: Colors.black54),
//               ),
//               Text(
//                 "Breeding start date: 2027/07/07",
//                 style: TextStyle(fontSize: 10, color: Colors.black54),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // --- SCREEN 19: FRIEND REQUEST DIALOG ---
//   void _showFriendRequestDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => const _FriendRequestDialog(),
//     );
//   }
// }

// class _FriendRequestDialog extends StatefulWidget {
//   const _FriendRequestDialog();

//   @override
//   State<_FriendRequestDialog> createState() => _FriendRequestDialogState();
// }

// class _FriendRequestDialogState extends State<_FriendRequestDialog> {
//   int _selectedOption = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.transparent,
//       insetPadding: const EdgeInsets.all(20),
//       child: Stack(
//         clipBehavior: Clip.none,
//         alignment: Alignment.topCenter,
//         children: [
//           Container(
//             padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Text(
//                   "To Mr. xxx",
//                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                 ),
//                 const Text(
//                   "Do you want to request a friend?",
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//                 const Text(
//                   "Select message to send",
//                   style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),

//                 _buildRadioOption(0, "nice to meet you! Thank you!"),
//                 _buildRadioOption(1, "Hello. Please approve if you like!"),
//                 _buildRadioOption(2, "Free entry (maximum 200 characters)"),

//                 const SizedBox(height: 10),
//                 Container(
//                   height: 80,
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: const Text(
//                     "dummy text dummy text dummy text...",
//                     style: TextStyle(fontSize: 10, color: Colors.grey),
//                   ),
//                 ),

//                 const SizedBox(height: 20),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: _buildBtn(
//                         "No",
//                         false,
//                         () => Navigator.pop(context),
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: _buildBtn(
//                         "yes",
//                         true,
//                         () => Navigator.pop(context),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             top: -15,
//             left: -5,
//             child: const CircleAvatar(
//               backgroundColor: AppColors.primaryYellow,
//               child: Icon(Icons.close, size: 20, color: Colors.black54),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildRadioOption(int index, String text) {
//     return Row(
//       children: [
//         Radio(
//           value: index,
//           groupValue: _selectedOption,
//           onChanged: (v) => setState(() => _selectedOption = v as int),
//           activeColor: AppColors.primaryYellow,
//         ),
//         Expanded(
//           child: Text(
//             text,
//             style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildBtn(String label, bool isYellow, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 10),
//         decoration: BoxDecoration(
//           color: isYellow ? AppColors.primaryYellow : Colors.grey[300],
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Center(
//           child: Text(
//             label,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.bold,
//               color: isYellow ? Colors.black54 : Colors.grey[600],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:my_pet/screens/profile/edit_profile.dart';
import 'package:my_pet/utils/colors.dart';
// Ensure AppColors is imported or defined as before

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // --- Header ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(backgroundColor: AppColors.primaryYellow, radius: 15, child: Icon(Icons.close, size: 16, color: Colors.black54)),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text("Profile", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54, letterSpacing: 1.0)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: const [
                        Text("ID:Aaaa1234 ", style: TextStyle(fontSize: 10, color: Colors.black54)),
                        Icon(Icons.copy, size: 10, color: Colors.black54) // Representing the copy icon/hash
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Edit Button (Triggers Screen 3) ---
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => showDialog(context: context, builder: (_) => const EditProfileDialog()), // SCREEN 3 TRIGGER
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                          decoration: BoxDecoration(color: AppColors.primaryYellow, borderRadius: BorderRadius.circular(20)),
                          child: const Text("Edit", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // --- Main Profile Card ---
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0E0E0), // Matches grey bg
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Avatar with Edit Bubble (Triggers Screen 4/6)
                              GestureDetector(
                                onTap: () => showDialog(context: context, builder: (_) => const CustomizationDialog()), // SCREEN 4/6 TRIGGER
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      width: 80, height: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.white, 
                                        borderRadius: BorderRadius.circular(15), 
                                        border: Border.all(color: Colors.grey)
                                      ),
                                    ),
                                    Positioned(
                                      bottom: -5,
                                      right: -5,
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundColor: AppColors.primaryYellow,
                                        child: const Text("edit", style: TextStyle(fontSize: 8, color: Colors.black54)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(width: 15),
                              // Stats
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Owner name: xxxx", style: TextStyle(fontSize: 12, color: Colors.black54, height: 1.5)),
                                    const Text("Years of love: XX years XX da", style: TextStyle(fontSize: 12, color: Colors.black54, height: 1.5)),
                                    const Text("Residence: XXXTown", style: TextStyle(fontSize: 12, color: Colors.black54, height: 1.5)),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: const [
                                        _BadgePlaceholder(text: "tournament\nbatch"),
                                        SizedBox(width: 5),
                                        _BadgePlaceholder(text: "tournament\nbatch"),
                                        SizedBox(width: 5),
                                        _BadgePlaceholder(text: "tournament\nbatch"),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          
                          // Description Box
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(color: const Color(0xFFEEEEEE), borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                const Text("dummy text dummy text dummy text dummy text\ndummy text dummy text dummy text dummy text", 
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 10, color: Colors.grey)),
                                const SizedBox(height: 5),
                                const Align(alignment: Alignment.bottomRight, child: Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.grey))
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          
                          // Breeding Status
                          const Text("Breeding status", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54)),
                          const Divider(color: Colors.grey, height: 10, thickness: 1),
                          const SizedBox(height: 5),
                          const Text("Number of tournament participants XX times", style: TextStyle(fontSize: 10, color: Colors.black54, height: 1.5)),
                          const Text("Number of walks: XX times", style: TextStyle(fontSize: 10, color: Colors.black54, height: 1.5)),
                          const Text("Number of event participants XX times", style: TextStyle(fontSize: 10, color: Colors.black54, height: 1.5)),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                    const Text("Breeding pets", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54)),
                    const SizedBox(height: 10),

                    // --- Pets List ---
                    _buildPetCard(),
                    const SizedBox(height: 10),
                    _buildPetCard(),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPetCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(width: 70, height: 70, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10))),
              const Positioned(top: 5, left: 5, child: CircleAvatar(radius: 8, backgroundColor: Colors.white, child: Text("icon", style: TextStyle(fontSize: 4))))
            ],
          ),
          const SizedBox(width: 15),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Pet name: xxxx", style: TextStyle(fontSize: 11, color: Colors.black54, fontWeight: FontWeight.bold, height: 1.5)),
              Text("Type: Chihuahua", style: TextStyle(fontSize: 11, color: Colors.black54, height: 1.5)),
              Text("Birthday: 2027/07/07", style: TextStyle(fontSize: 11, color: Colors.black54, height: 1.5)),
              Text("Breeding start date: 2027/07/07", style: TextStyle(fontSize: 11, color: Colors.black54, height: 1.5)),
            ],
          )
        ],
      ),
    );
  }
}

class _BadgePlaceholder extends StatelessWidget {
  final String text;
  const _BadgePlaceholder({required this.text});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 14,
      backgroundColor: Colors.white,
      child: Text(text, textAlign: TextAlign.center, style: const TextStyle(fontSize: 5, color: Colors.black)),
    );
  }
}