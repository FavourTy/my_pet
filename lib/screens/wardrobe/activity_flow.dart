import 'package:flutter/material.dart';

import 'package:my_pet/utils/colors.dart';
import 'package:my_pet/widgets/activit.dart';

// ============================================================================
// SCREEN 25: PETS IN THE ROOM
// ============================================================================
void showPetsInRoomDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(15),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
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
                    "pets in the room",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Header Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Number of possessions 1/3",
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryYellow,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.swap_horiz,
                            size: 12,
                            color: Colors.black54,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Entry procedure",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Pet Grid
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    PetGridCard(label: "XX-chan"),
                    PetGridCard(label: "welcome", isWelcome: true),
                    PetGridCard(label: "welcome", isWelcome: true),
                  ],
                ),

                const SizedBox(height: 40),

                // Moving House Section
                const Text(
                  "moving house",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: PetGridCard(label: "", isAdd: true),
                ),
              ],
            ),
          ),

          Positioned(
            top: -15,
            left: 0,
            child: _buildCircleBtn(Icons.close, () => Navigator.pop(context)),
          ),
          Positioned(
            top: -15,
            right: 0,
            child: _buildCircleBtn(Icons.question_mark, () {}),
          ),
        ],
      ),
    ),
  );
}

// ============================================================================
// SCREEN 27: COIN CONFIRMATION
// ============================================================================
void showCoinConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "using 10000 coins",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Would you like to increase the gauge by one?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: _buildGreyBtn(
                        "Cancel",
                        () => Navigator.pop(context),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildYellowBtn(
                        "OK",
                        () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: -15,
            left: -10,
            child: _buildCircleBtn(Icons.close, () => Navigator.pop(context)),
          ),
          Positioned(
            top: -15,
            right: -10,
            child: _buildCircleBtn(Icons.question_mark, () {}),
          ),
        ],
      ),
    ),
  );
}

// ============================================================================
// SCREEN 28: WALKING COURSE SELECTION
// ============================================================================
void showWalkingCourseDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(10), // Max width
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: double.infinity,
            height: 700,
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Choose a walking course",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Things to bring
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Things to bring for a walk",
                        style: TextStyle(fontSize: 10, color: Colors.black54),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryYellow,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          "Edit",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      BringItemSlot(),
                      SizedBox(width: 10),
                      BringItemSlot(),
                      SizedBox(width: 10),
                      BringItemSlot(),
                    ],
                  ),

                  const SizedBox(height: 20),
                  const Text(
                    "Walking course",
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),

                  CourseButton(
                    label: "Around the house",
                    onTap: () => _goToWalkingMode(context),
                  ),
                  CourseButton(
                    label: "dog run",
                    onTap: () => _goToWalkingMode(context),
                  ),
                  CourseButton(
                    label: "park",
                    onTap: () => _goToWalkingMode(context),
                  ),
                  CourseButton(
                    label: "Petribu Street",
                    onTap: () => _goToWalkingMode(context),
                  ),

                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      "<List of outings>",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // --- COMPLEX GRID FROM SCREEN 28 ---
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CourseButton(
                          topLabel: "event venue",
                          label: "Free",
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CourseButton(
                          label: "Paid users only",
                          blueLabel:
                              "Ticket after paying\nEvent only for people who...",
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      "Event venues for each breed of dog",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 5),
                  CourseButton(
                    label: "seasonal events",
                    subLabel: "glamping",
                    onTap: () {},
                  ),

                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CourseButton(
                          topLabel: "training facility",
                          label: "Paid users only",
                          subLabel: "rhythm game\nfrisbee, hurdles",
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CourseButton(
                          topLabel: "trimming",
                          label: "Free",
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CourseButton(
                          topLabel: "super",
                          label: "super",
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CourseButton(
                          topLabel: "VIP",
                          label: "secret room",
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -15,
            left: 0,
            child: _buildCircleBtn(Icons.close, () => Navigator.pop(context)),
          ),
          Positioned(
            top: -15,
            right: 0,
            child: _buildCircleBtn(Icons.question_mark, () {}),
          ),
        ],
      ),
    ),
  );
}

void _goToWalkingMode(BuildContext context) {
  Navigator.pop(context);
  Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const WalkingScreen()),
  );
}

// ============================================================================
// SCREEN 29: WALKING MODE (3D)
// ============================================================================
class WalkingScreen extends StatelessWidget {
  const WalkingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. 3D Model / Background
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1518717758536-85ae29035b6d?q=80&w=2000', // Dog walking path
              fit: BoxFit.cover,
            ),
          ),

          // 2. Top HUD
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatBadge(Icons.favorite, "123/1000"),
                _buildStatBadge(Icons.confirmation_number, "12345"),
                _buildStatBadge(Icons.monetization_on, "12345"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatBadge(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 12, color: Colors.grey),
          const SizedBox(width: 4),
          Text(text, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        ],
      ),
    );
  }
}

// ============================================================================
// SCREEN 30 & 31: TOURNAMENTS
// ============================================================================
void showTournamentDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(15),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Choose a tournament to participate in",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 20),

                CompetitionButton(
                  label: "cooking competition",
                  onTap: () => _showTournamentInfo(context),
                ),
                CompetitionButton(
                  label: "time race competition",
                  onTap: () => _showTournamentInfo(context),
                ),
                CompetitionButton(
                  label: "frisbee tournament",
                  onTap: () => _showTournamentInfo(context),
                ),
                CompetitionButton(
                  label: "Photo competition",
                  onTap: () => _showTournamentInfo(context),
                ),
              ],
            ),
          ),
          Positioned(
            top: -15,
            left: 0,
            child: _buildCircleBtn(Icons.close, () => Navigator.pop(context)),
          ),
          Positioned(
            top: -15,
            right: 0,
            child: _buildCircleBtn(Icons.question_mark, () {}),
          ),
        ],
      ),
    ),
  );
}

void _showTournamentInfo(BuildContext context) {
  Navigator.pop(context); // Close selection
  Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const TournamentInfoScreen()),
  );
}

class TournamentInfoScreen extends StatelessWidget {
  const TournamentInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Competing with nutritional value and decoration\nSubmit your dish (image? Dishes you made?)",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                SizedBox(height: 40),
                Text(
                  "Don't you keep the ones you can cook?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// --- HELPERS ---
Widget _buildCircleBtn(IconData icon, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: AppColors.primaryYellow,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 20, color: Colors.black54),
    ),
  );
}

Widget _buildYellowBtn(String label, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryYellow,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
    ),
  );
}

Widget _buildGreyBtn(String label, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
    ),
  );
}
