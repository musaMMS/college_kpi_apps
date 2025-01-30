import 'package:flutter/material.dart';

class CGPACalculator extends StatefulWidget {
  @override
  _CGPACalculatorState createState() => _CGPACalculatorState();
}

class _CGPACalculatorState extends State<CGPACalculator> with SingleTickerProviderStateMixin {
  final List<TextEditingController> _controllers = List.generate(8, (index) => TextEditingController());
  String _cgpaResult = '';

  // Animation Controller
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Animation duration
      vsync: this,
    )..repeat(reverse: true); // Repeat the animation in reverse

    // Define the color animation (between blue and red)
    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(_controller);

    // Define the size animation (between 20 and 30)
    _sizeAnimation = Tween<double>(
      begin: 20.0,
      end: 30.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when not needed
    super.dispose();
  }

  void _calculateCGPA() {
    double total = 0.0;
    int validSubjects = 0;

    for (var controller in _controllers) {
      double grade = double.tryParse(controller.text) ?? -1.0;
      if (grade >= 0.0 && grade <= 4.0) {
        total += grade;
        validSubjects++;
      }
    }

    if (validSubjects > 0) {
      double cgpa = total / validSubjects;
      setState(() {
        _cgpaResult = 'CGPA: ${cgpa.toStringAsFixed(2)}';
      });
    } else {
      setState(() {
        _cgpaResult = 'Invalid Input';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Text(
              'CGPA Calculator',
              style: TextStyle(
                color: _colorAnimation.value, // Animated color
                fontSize: _sizeAnimation.value, // Animated size
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                children: List.generate(8, (index) {
                  return TextField(
                    controller: _controllers[index],
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'Semester ${index + 1}',
                      border: OutlineInputBorder(),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateCGPA,
              child: Text('Calculate CGPA'),
            ),
            SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _cgpaResult,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}