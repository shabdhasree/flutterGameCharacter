import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CharactersScreen(),
    );
  }
}

class CharactersScreen extends StatefulWidget {
  @override
  _CharactersScreenState createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  int _currentIndex = 0;

  // List of manually inputted names with avatar data
  final List<Map<String, dynamic>> _cards = [
    {'id': 1, 'name': 'Alice', 'level': 'Level 5', 'avatar': 'assets/alice.jpeg'},
    {'id': 2, 'name': 'Bob', 'level': 'Level 7', 'avatar': 'assets/bob.jpg'},
    {'id': 3, 'name': 'Charlie', 'level': 'Level 3', 'avatar': 'assets/charlie.jpg'},
    {'id': 4, 'name': 'David', 'level': 'Level 8', 'avatar': 'assets/david.png'},
    {'id': 5, 'name': 'Eva', 'level': 'Level 4', 'avatar': 'assets/eva.jpg'},
    {'id': 6, 'name': 'Frank', 'level': 'Level 6', 'avatar': 'assets/frank.jpg'},
    {'id': 7, 'name': 'Grace', 'level': 'Level 9', 'avatar': 'assets/grace.jpg'},
    {'id': 8, 'name': 'Hank', 'level': 'Level 2', 'avatar': 'assets/hank.jpg'},
    {'id': 9, 'name': 'Ivy', 'level': 'Level 10', 'avatar': 'assets/ivy.jpg'},
    {'id': 10, 'name': 'Jack', 'level': 'Level 1', 'avatar': 'assets/jack.jpg'},
  ];

  // Function to navigate to the previous card
  void _previousCard() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      }
    });
  }

  // Function to navigate to the next card
  void _nextCard() {
    setState(() {
      if (_currentIndex < _cards.length - 1) {
        _currentIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize:30,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.grey[800],
            
      ),
      backgroundColor: Colors.black,
      body:   
      Padding(
       
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Expanded widget allows card to take up more space
            Expanded(
              child: Center(
                child: Card(
                  color: Colors.grey[800],
                  shape: RoundedRectangleBorder(
                    
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0), // Increase padding for a bigger card
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(_cards[_currentIndex]['avatar']),         
                          ),
                        SizedBox(height: 30),
                        Text(
                          _cards[_currentIndex]['name'],
                          style: const TextStyle(
                            fontSize: 28, // Larger text for name
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          _cards[_currentIndex]['level'],
                          style: TextStyle(fontSize: 20,
                          color: Colors.white
                          ),
                          
                        ),
                        SizedBox(height: 10),
                        Text(
                          'ID: ${_cards[_currentIndex]['id']}',
                          style: TextStyle(fontSize: 18,
                          color: Colors.white,
                          
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Positioned buttons at the bottom of the screen
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _previousCard,
                  child: Text('Previous'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: TextStyle(fontSize: 18),
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.amber,
                  ),
                ),
                ElevatedButton(
                  onPressed: _nextCard,
                  child: Text('Next'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: TextStyle(fontSize: 18),
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.amber,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Add space between buttons and bottom of screen
          ],
        ),
      ),
    );
  }
}
