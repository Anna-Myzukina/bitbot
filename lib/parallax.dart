import 'package:flutter/material.dart';
// Add sensor dependency here, if you're using it for movement

class ParallaxScreen extends StatefulWidget {
  @override
  _ParallaxScreenState createState() => _ParallaxScreenState();
}

class _ParallaxScreenState extends State<ParallaxScreen> {
  final ScrollController _scrollController = ScrollController();

  // You'd replace these with values from your Sensor Manager
  double _backgroundXOffset = 0;
  double _foregroundXOffset = 0; 

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    // Set up your Sensor Manager listener here if needed
  }

  void _onScroll() {
    setState(() {
      _backgroundXOffset = -_scrollController.offset / 2;
      _foregroundXOffset = _scrollController.offset;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            controller: _scrollController,
            children: <Widget>[
              // Background Layer
              Transform.translate(
                offset: Offset(_backgroundXOffset, 0),
                child: Image.asset(
                  'assets/images/sky.jpg',
                  fit: BoxFit.cover,
                ),
              ),
          
              // Middle Layer (Content)
              Container(
                color: Colors.transparent,
                height: 200, 
                child: Center(
                  child: Text('Your Content Here'))),
          
              // Foreground Layer
              Transform.translate(
                offset: Offset(_foregroundXOffset, 0),
                child: Image.asset(
                  'assets/images/forest.jpg',
                  fit: BoxFit.cover,
                ),
              ),
          
              // Add more content to make the ListView scrollable
              // ...
            ],
          ),
        ],
      ),
    );
  }
}