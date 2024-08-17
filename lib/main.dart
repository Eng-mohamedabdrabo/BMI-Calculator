import 'package:first_practice/views/result_view.dart';
import 'package:first_practice/views/widgets/age_and_weight_container.dart';
import 'package:first_practice/views/widgets/custom_button.dart';
import 'package:first_practice/views/widgets/height_container.dart';
import 'package:first_practice/views/widgets/sex_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BmiCalculator());
}

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0d1232),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0d1232),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double currentValue = 150;
  double currentHeight =150;
  int selectedIndex = -1;
  int currentWeight = 60;
  int currentAge = 25;
  bool showWarning = false;

  void _onSexContainerTap(int index) {
    setState(() {
      selectedIndex = selectedIndex == index ? -1: index;
      showWarning = false; // Hide warning when a type is selected
    });
  }

  void _resetValues() {
    setState(() {
      currentValue = currentHeight;
      selectedIndex = -1;
      currentWeight = 60;
      currentAge = 25;
      showWarning = false; // Hide warning on reset
    });
  }

  void _checkBMI() {
    if (selectedIndex == -1) {
      setState(() {
        showWarning = true;});
      return;
    }

    // Calculate BMI here
    double heightInMeters = currentValue / 100;
    double bmiResult = currentWeight / (heightInMeters * heightInMeters);

    // Navigate to ResultScreen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(bmiResult: bmiResult),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: _resetValues,
            icon: const Icon(Icons.refresh, color: Colors.white),
            style: IconButton.styleFrom(
              backgroundColor: const Color(0xFF0d1232),
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(16.0),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              children: [
                SexContainer(
                  icon: Icons.male,
                  text: 'MALE',
                  isSelected: selectedIndex == 0,
                  onTap: () => _onSexContainerTap(0),
                  showWarning: showWarning, // Pass showWarning
                ),
                const SizedBox(width: 16),
                SexContainer(
                  icon: Icons.female,
                  text: 'FEMALE',
                  isSelected: selectedIndex == 1,
                  onTap: () => _onSexContainerTap(1),
                  showWarning: showWarning, // Pass showWarning
                ),
              ],
            ),
            if (showWarning) // Show warning message
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: Text(
                    'You must choose your type',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            const SizedBox(height: 16),
            HeightContainer(
              currentHeight: currentValue,
              onChanged: (newValue) => setState(() => currentValue = newValue),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AgeAndWeightContainer(
                  text: 'WEIGHT',
                  value: currentWeight,
                  onChanged: (newValue) =>
                      setState(() => currentWeight = newValue),
                  onReset: _resetValues,
                ),
                AgeAndWeightContainer(
                  text: 'AGE',
                  value: currentAge,
                  onChanged: (newValue) =>setState(() => currentAge = newValue),
                  onReset: _resetValues,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: CustomButton(
                text: 'Check your BMI',
                onPressed: _checkBMI, // Call _checkBMI
                backgroundColor: const Color(0xFFe5005d),
              ),
            ),
          ],
        ),
      ),
    );
  }
}






