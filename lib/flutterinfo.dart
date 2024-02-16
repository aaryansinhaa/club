import 'package:club/whyflutter.dart';
import 'package:flutter/material.dart';

class FlutterInfoScreen extends StatefulWidget {
  @override
  _FlutterInfoScreenState createState() => _FlutterInfoScreenState();
}

class _FlutterInfoScreenState extends State<FlutterInfoScreen> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    // Delay the visibility of content to create an entrance animation effect
    Future.delayed(const Duration(milliseconds: 0), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Session'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _isVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 00),
          curve: Curves.easeInOut,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF005792), Color(0xFF00A8CC)],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'What is Flutter?',
                  style: TextStyle(
                      fontSize: 24,
                      /*fontWeight: FontWeight.bold,*/
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                const FlutterLogo(
                  size: 100, /*colors: Colors.white*/
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    'Flutter is Google’s UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase. It uses the Dart programming language, which is easy to learn and offers many features for building modern, reactive UIs.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FlutterAdvantagesScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'But Why should I Learn it?',
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
    );
  }
}
