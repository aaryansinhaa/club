import 'package:club/aboutdart.dart';
import 'package:flutter/material.dart';

class FlutterAdvantagesScreen extends StatefulWidget {
  @override
  _FlutterAdvantagesScreenState createState() =>
      _FlutterAdvantagesScreenState();
}

class _FlutterAdvantagesScreenState extends State<FlutterAdvantagesScreen>
    with SingleTickerProviderStateMixin {
  List<String> advantages = [
    'Single Codebase: With Flutter, you can write code once and deploy it on multiple platforms including iOS, Android, Web, and Desktop. This reduces development time and costs.',
    'Hot Reload: Flutter offers hot reload feature which allows you to quickly see the effect of your changes without restarting the app. This speeds up the development process significantly.',
    'Rich UI Experience: Flutter provides a rich set of pre-designed widgets along with the flexibility to create custom widgets. This allows you to build beautiful and highly customized user interfaces.',
  ];

  int currentIndex = 0;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
    _displayNextAdvantage();
  }

  void _displayNextAdvantage() {
    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        if (currentIndex < advantages.length - 1) {
          currentIndex++;
        } else {
          currentIndex = 0;
        }
        _controller.reset();
        _controller.forward();
      });
      _displayNextAdvantage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Advantages'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF64B5F6), Color(0xFF1976D2)],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: FadeTransition(
              opacity: _animation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Advantage ${currentIndex + 1}',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    advantages[currentIndex],
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DartInfoScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Let\'s Get Started with Flutter!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: FlutterAdvantagesScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
