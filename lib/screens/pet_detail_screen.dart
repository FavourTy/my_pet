import 'package:flutter/material.dart';

class PetDetailScreen extends StatelessWidget {
  final String petId;

  const PetDetailScreen({Key? key, required this.petId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pet Details')),
      body: Center(child: Text('Pet ID: $petId')),
    );
  }
}
