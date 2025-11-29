import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart'; // For CircularActionButton

class CookingScreen extends StatefulWidget {
  const CookingScreen({super.key});

  @override
  State<CookingScreen> createState() => _CookingScreenState();
}

class _CookingScreenState extends State<CookingScreen> {
  int _step = 1; 
  // 1=Select, 2=Amount, 3=Complete (Screen 19)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_step < 3)
                    GestureDetector(
                      onTap: () => _step == 1 ? Navigator.pop(context) : setState(() => _step--),
                      child: const CircleAvatar(backgroundColor: AppColors.primaryYellow, radius: 15, child: Icon(Icons.close, size: 16, color: Colors.white)),
                    )
                  else 
                    const SizedBox(width: 30), // Empty space to balance
                    
                  Text(_step == 1 ? "make a meal" : _step == 2 ? "Selected ingredients" : "", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54)),
                  
                  if (_step < 3)
                    const CircleAvatar(backgroundColor: AppColors.primaryYellow, radius: 15, child: Icon(Icons.question_mark, size: 16, color: Colors.white))
                  else
                    const SizedBox(width: 30),
                ],
              ),
            ),

            Expanded(
              child: _step == 1 
                  ? _buildSelectionStep() 
                  : _step == 2 
                      ? _buildAmountStep() 
                      : _buildCompletedStep(), // Screen 19
            ),
          ],
        ),
      ),
    );
  }

  // ... (Previous _buildSelectionStep and _buildAmountStep code remains here) ...
  // I am including placeholders for them so the file is complete.

  Widget _buildSelectionStep() {
    return Center(
      child: CircularActionButton(
        label: "Next", 
        onTap: () => setState(() => _step = 2)
      )
    ); 
  }

  Widget _buildAmountStep() {
    return Center(
      child: CircularActionButton(
        label: "Cook", 
        onTap: () => setState(() => _step = 3)
      )
    );
  }

  // --- SCREEN 19: COMPLETED SCREEN ---
  Widget _buildCompletedStep() {
    return Column(
      children: [
        // Top Summary of Ingredients
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSmallIngredient("Part 1"),
              _buildSmallIngredient("Part 2"),
              _buildSmallIngredient("Part 3"),
            ],
          ),
        ),
        
        const Spacer(),
        
        // Big Title
        Container(
          width: double.infinity,
          color: Colors.grey,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: const Center(
            child: Text(
              "! Completed!", 
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)
            ),
          ),
        ),
        
        const Spacer(),

        // Food Image
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20, offset: const Offset(0, 10))],
            image: const DecorationImage(
              image: NetworkImage('https://images.unsplash.com/photo-1585502829137-6118f97e40cc?q=80&w=400'), // Dog food bowl
              fit: BoxFit.cover,
            ),
          ),
        ),
        
        const Spacer(),

        // Give Button
        GestureDetector(
          onTap: () => Navigator.pop(context), // Go back to main screen (Screen 20)
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            decoration: BoxDecoration(
              color: AppColors.primaryYellow.withOpacity(0.5), // Pale yellow
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              "I'll give it to you now",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),
        ),
        
        const SizedBox(height: 20),

        // Warning Text
        const Text(
          "With storage",
          style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Text(
          "Best before date",
          style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildSmallIngredient(String label) {
    return Column(
      children: [
        Container(
          width: 50, height: 50,
          decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(8)),
          child: const Icon(Icons.fastfood, size: 20, color: Colors.grey),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          color: AppColors.primaryYellow,
          child: Text(label, style: const TextStyle(fontSize: 8)),
        )
      ],
    );
  }
}