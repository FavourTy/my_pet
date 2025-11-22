import 'package:flutter/material.dart';
import '../models/pet.dart';

class PetDisplay extends StatelessWidget {
  final Pet pet;

  const PetDisplay({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Pet image placeholder
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.pink[100],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.pets,
              size: 100,
              color: Colors.pink[300],
            ),
          ),
          SizedBox(height: 16),
          Text(
            pet.name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          Text(
            pet.currentMood.name,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
