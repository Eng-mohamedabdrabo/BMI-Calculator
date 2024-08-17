import 'package:flutter/material.dart';

class AgeAndWeightContainer extends StatefulWidget {
  const AgeAndWeightContainer({super.key, required this.text, required this.value, required this.onChanged, required this.onReset});
  final String text;
  final int value;
  final ValueChanged<int> onChanged;
  final VoidCallback onReset;

  @override
  State<AgeAndWeightContainer> createState() => _AgeAndWeightContainerState();
}

class _AgeAndWeightContainerState extends State<AgeAndWeightContainer> {
  late int num;

  @override
  void initState() {
    super.initState();
    num = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF252a47),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(26),
        child: Column(
          children: [
            Text(
              widget.text,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
                color: Color(0xFFa6abc9),
              ),
            ),
            Text(
              num.toString(),
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                IconButton(
                  onPressed: () => setState(() => num++),
                  icon: const Icon(Icons.add, color: Colors.white),
                  style: IconButton.styleFrom(
                    backgroundColor: const Color(0xFF0d1232),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(16.0),
                  ),
                ),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () => setState(() => num--),
                  icon: const Icon(Icons.remove, color: Colors.white),
                  style: IconButton.styleFrom(
                    backgroundColor: const Color(0xFF0d1232),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(16.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant AgeAndWeightContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value == widget.value) {
      setState(() {
        num = widget.value;
      });
    }
  }
}