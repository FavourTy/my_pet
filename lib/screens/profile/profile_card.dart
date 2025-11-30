import 'package:flutter/material.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 480,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2)
        ],
      ),
      child: Column(
        children: [
          // Top Image Area (Pet Image)
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.lightGreen[100], // Placeholder for the 3D pet scene
              child: Stack(
                alignment: Alignment.center,
                children: [
           
                  const Icon(Icons.pets, size: 100, color: Colors.white54), 
                  Positioned(
                    right: 20, top: 40,
                    child: Icon(Icons.music_note, color: Colors.blue[300]),
                  )
                ],
              ),
            ),
          ),
          
          // Bottom Info Area (Dark Grey)
          Expanded(
            flex: 1,
            child: Container(
              color: const Color(0xFF555555), // Dark grey
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  // Avatar/Icon square
                  Container(
                    width: 50, height: 50,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                  ),
                  const SizedBox(width: 12),
                  
                  // Text Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("lively island logo", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                        SizedBox(height: 5),
                        Text("Owner name: xxxx", style: TextStyle(color: Colors.white70, fontSize: 10)),
                        Text("ID:Aaaa1234", style: TextStyle(color: Colors.white70, fontSize: 10)),
                      ],
                    ),
                  ),
                  
                  // QR Code
                  Container(
                    width: 50, height: 50,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                    child: const Icon(Icons.qr_code_2, color: Colors.black),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}