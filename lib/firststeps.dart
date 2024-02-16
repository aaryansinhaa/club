import 'package:club/thankyou.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FirstStepsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'First Steps in Dart & Flutter',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'First Steps in Dart:',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Dart is a versatile and powerful programming language designed for building web, mobile, and desktop applications. Here are some first steps to get started with Dart:',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            _buildStep(
              title: 'Learn the Basics',
              description:
                  'Start by learning the basic syntax, data types, control structures, and functions in Dart. You can find resources and tutorials online or refer to the official Dart documentation.',
            ),
            _buildStep(
              title: 'Setup Your Environment',
              description:
                  'Install the Dart SDK and set up your development environment. You can use editors like Visual Studio Code or IntelliJ IDEA with Dart plugins.',
            ),
            _buildStep(
              title: 'Explore Dart Packages',
              description:
                  'Explore the Dart package ecosystem to find libraries and packages that can help you build your applications more efficiently.',
            ),
            const SizedBox(height: 30),
            const Text(
              'First Steps in Flutter:',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Flutter is Google’s UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase. Here are some first steps to get started with Flutter:',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            _buildStep(
              title: 'Install Flutter',
              description:
                  'Install the Flutter SDK and set up your development environment. You can follow the installation instructions provided in the official Flutter documentation.',
            ),
            _buildStep(
              title: 'Create Your First Flutter App',
              description:
                  'Create a new Flutter project and run it on your device or emulator. Experiment with Flutter widgets and explore the Flutter framework.',
            ),
            _buildStep(
              title: 'Learn Flutter Widgets',
              description:
                  'Learn about Flutter widgets and how to use them to build user interfaces. Refer to the Flutter documentation and sample code for guidance.',
            ),
            const SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _launchURL('https://dart.dev/'),
                  child: const Text('Dart Documentation'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () => _launchURL('https://flutter.dev/'),
                  child: const Text('Flutter Documentation'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ThankYouScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Finish Session',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep({required String title, required String description}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: FirstStepsScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
