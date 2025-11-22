import 'package:flutter/material.dart';

class StatusBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 26,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF555555), Color(0xFF454545)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
