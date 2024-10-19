import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sensors_plus/sensors_plus.dart'; // For sensor data access

class ParallaxView extends StatefulWidget {
  final Widget backgroundContent;
  final Widget? middleContent;
  final Widget? foregroundContent;
  final Alignment backgroundAlignment;
  final Alignment middleAlignment;
  final Alignment foregroundAlignment;
  final double movementIntensityMultiplier;

  const ParallaxView({
    Key? key,
    required this.backgroundContent,
    this.middleContent,
    this.foregroundContent,
    this.backgroundAlignment = Alignment.center,
    this.middleAlignment = Alignment.center,
    this.foregroundAlignment = Alignment.center,
    this.movementIntensityMultiplier = 20.0,
  }) : super(key: key);

  @override
  _ParallaxViewState createState() => _ParallaxViewState();
}

class _ParallaxViewState extends State<ParallaxView> {
  double _roll = 0.0;
  double _pitch = 0.5; // Initial vertical offset

  @override
  void initState() {
    super.initState();
    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _roll = event.y.clamp(-0.5, 0.5) * widget.movementIntensityMultiplier;
        _pitch = (_pitch + event.x).clamp(0.0, 1.0) * widget.movementIntensityMultiplier;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Layer
        Positioned.fill(
          child: Transform.translate(
            offset: Offset(_roll, _pitch), // Use calculated offsets
            child: widget.backgroundContent,
          ),
        ),

        // Middle Layer (Optional)
        if (widget.middleContent != null)
          Positioned.fill(
            child: Align(
              alignment: widget.middleAlignment,
              child: widget.middleContent!,
            ),
          ),

        // Foreground Layer (Optional)
        if (widget.foregroundContent != null)
          Positioned.fill(
            child: Transform.translate(
              offset: Offset(-_roll, -_pitch), // Opposite direction for depth
              child: widget.foregroundContent!,
            ),
          ),
      ],
    );
  }
}
