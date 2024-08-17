import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double bmiResult;

  const ResultScreen({super.key, required this.bmiResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text('BMI Result', style: const TextStyle(fontSize: 24,
          color: Colors.white
      ),),
    ),
      body: Center(
        child: Text(
          "Your BMI is: ${bmiResult.toStringAsFixed(2)}",
          style: const TextStyle(fontSize: 24,
              color: Colors.white
          ),
        ),
      ),
    );
  }
}