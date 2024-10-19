import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class ParallaxWidget extends StatefulWidget {
  final String imageUrl; // The image to apply parallax to
  final double intensity; // Adjust the intensity of the effect

  const ParallaxWidget({
    Key? key,
    required this.imageUrl,
    this.intensity = 0.5, // Default intensity
  }) : super(key: key);

  @override
  _ParallaxWidgetState createState() => _ParallaxWidgetState();
}

class _ParallaxWidgetState extends State<ParallaxWidget> {
  AccelerometerEvent? _accelerometerEvent;
  GyroscopeEvent? _gyroscopeEvent;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _accelerometerEvent = event;
      });
    });
    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeEvent = event;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Calculate the offset based on accelerometer or gyroscope data
    Offset offset = Offset.zero;
    if (_accelerometerEvent != null) {
      offset = Offset(
        -_accelerometerEvent!.x * widget.intensity,
        _accelerometerEvent!.y * widget.intensity,
      );
    } else if (_gyroscopeEvent != null) {
      // Adjust the calculation based on your gyroscope data
      offset = Offset(
        -_gyroscopeEvent!.y * widget.intensity,
        _gyroscopeEvent!.x * widget.intensity,
      );
    }

    return Container(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          Center(
            child: Transform.translate(
              offset: offset,
              child: Image.asset(
                widget.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
