import 'package:flutter/material.dart';

class HeightContainer extends StatelessWidget {
  final double currentHeight;
  final ValueChanged<double> onChanged;

  const HeightContainer(
      {super.key, required this.currentHeight, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF252a47),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'HEIGHT',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: Color(0xFFa6abc9),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                currentHeight.round().toString(),
                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'cm',
                style: TextStyle(fontSize: 18, color: Color(0xFFa6abc9)),
              ),
            ],
          ),
          Slider(
            value: currentHeight,
            min: 100,
            max: 220,
            divisions: 120,
            activeColor: Colors.pink,
            inactiveColor: Colors.grey,
            thumbColor: Colors.pink,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}