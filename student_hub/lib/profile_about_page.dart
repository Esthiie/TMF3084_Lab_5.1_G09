import 'package:flutter/material.dart';

class ProfileAboutPage extends StatelessWidget {
  const ProfileAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Layered Profile Header using Stack widget
          SizedBox(
            height: 220,
            child: Stack(
              children: [
                Container(
                  height: 150,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Developer Info',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 90,
                  left: MediaQuery.of(context).size.width / 2 - 50,
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 46,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.group, size: 50, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Team 09',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Software Engineering (UNIMAS)',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 12),
          const Text(
            'Developers:',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(height: 6),
          // Team members list with matric numbers
          const Text('Daiyanti (103756)', style: TextStyle(fontSize: 16)),
          const Text('Estherne (104062)', style: TextStyle(fontSize: 16)),
          const Text('Norasyikin (105436)', style: TextStyle(fontSize: 16)),
          const Text('Reselda (106131)', style: TextStyle(fontSize: 16)),
          const Text('Vanessa (106615)', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 20),
          // App Information Card
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'App Information',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Divider(),
                    Text('System Name: StudentHub'),
                    Text('Version: v1.0.0 (Lab 5 Release)'),
                    Text('Framework: Flutter & Material 3'),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}