import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class ParallaxEffectScreen extends StatefulWidget {
  @override
  _ParallaxEffectScreenState createState() => _ParallaxEffectScreenState();
}

class _ParallaxEffectScreenState extends State<ParallaxEffectScreen> {
  double _x = 0.0;
  double _y = 0.0;

  @override
  void initState() {
    super.initState();
    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _x += event.x * 0.02;
        _y += event.y * 0.02;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildParallaxLayer(Alignment(-_x * 0.5, -_y * 0.5), 'assets/images/forest.jpg', Colors.transparent),
          _buildParallaxLayer(Alignment(0.0, 0.0), 'assets/images/forest.jpg', Colors.transparent),
          _buildParallaxLayer(Alignment(_x * 0.5, _y * 0.5), 'assets/images/sky.jpg', Colors.transparent),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Your Text Here',
              style: TextStyle(color: Colors.white, fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParallaxLayer(Alignment alignment, String assetPath, Color color) {
    return Align(
      alignment: alignment,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          image: DecorationImage(
            image: AssetImage(assetPath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
