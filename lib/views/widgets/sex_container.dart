import 'package:flutter/material.dart';

class SexContainer extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final bool showWarning; // Add showWarning property

  const SexContainer({
    super.key,
    required this.icon,
    required this.text,
    required this.isSelected,
    required this.onTap,
    required this.showWarning, //Add showWarning to constructor
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 180,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : const Color(0xFF252a47),
            borderRadius: BorderRadius.circular(10),
            border: showWarning && !isSelected // Add red border if showWarning is true and not selected
                ? Border.all(color: Colors.red, width: 2)
                : null,
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 100,
                color: Colors.white,
              ),
              const SizedBox(height: 16),
              Text(
                text,
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}