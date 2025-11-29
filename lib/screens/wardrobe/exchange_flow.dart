// ... (Previous ExchangeGiftScreen code remains) ...

// ============================================================================
// SCREEN 37: GIVE A PRESENT
// ============================================================================
import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';

class GivePresentScreen extends StatelessWidget {
  const GivePresentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("give a present", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54)),
                const SizedBox(height: 30),
                
                const Text("<The person to whom you are giving the present>", style: TextStyle(fontSize: 10, color: Colors.black54)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 50, height: 50, decoration: BoxDecoration(border: Border.all(color: Colors.black54), borderRadius: BorderRadius.circular(8))),
                    const SizedBox(width: 10),
                    Container(width: 50, height: 50, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(8))),
                  ],
                ),
                const SizedBox(height: 5),
                const Text("xxxx", style: TextStyle(fontSize: 12)),
                
                const SizedBox(height: 30),
                const Text("<What to give as a present>", style: TextStyle(fontSize: 10, color: Colors.black54)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 60, height: 60, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(8))),
                    const SizedBox(width: 10),
                    Container(width: 60, height: 60, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(8)), child: const Center(child: Text("!", style: TextStyle(color: AppColors.primaryYellow, fontSize: 24, fontWeight: FontWeight.bold)))),
                  ],
                ),
                const Text("<1>", style: TextStyle(fontSize: 10, color: Colors.grey)),
                
                const SizedBox(height: 30),
                const Text("<Message>", style: TextStyle(fontSize: 10, color: Colors.black54)),
                const SizedBox(height: 40),
                
                const Text("Shipping fee: coin\n*XX coins per item", textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: Colors.black54)),
                const SizedBox(height: 20),
                
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(color: AppColors.primaryYellow, borderRadius: BorderRadius.circular(30)),
                    child: const Center(child: Text("give", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54))),
                  ),
                ),
              ],
            ),
          ),
          Positioned(top: -15, left: -10, child: const CircleAvatar(backgroundColor: AppColors.primaryYellow, child: Icon(Icons.close, size: 20, color: Colors.black54))),
          Positioned(top: -15, right: -10, child: const CircleAvatar(backgroundColor: AppColors.primaryYellow, child: Icon(Icons.question_mark, size: 20, color: Colors.black54))),
        ],
      ),
    );
  }
}