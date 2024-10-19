import 'package:bitbot/utils/parallax_sensors_bg.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: const Center(
            child: Text(
          'Parallax effect',
          style: TextStyle(color: Colors.blue),
        )),
      ),
      body: Parallax(
        sensor: ParallaxSensor.gyroscope,
        layers: [
          Layer(
            sensitivity: 1,
            image: const AssetImage('assets/images/bg_galaxy.jpg'),
            preventCrop: true,
          ),
          Layer(
              sensitivity: 7,
              image: const AssetImage('assets/images/nebula.png'),
              imageHeight: 200,
              imageWidth: MediaQuery.of(context).size.width * 2,
              preventCrop: true,
              opacity: 0.1
              ),
          Layer(
              sensitivity: 12,
              image: const AssetImage('assets/images/stars2.png'),
              preventCrop: true,
              opacity: 0.2),
          Layer(
            sensitivity: 24,
            image: const AssetImage('assets/images/fg_landscape_night.png'),
            preventCrop: true,
            imageFit: BoxFit.fitWidth
            //opacity: 1
            
            //imageHeight: 150,
            //imageWidth: double.infinity,
            //imageFit: BoxFit.fitHeight,
            //offset: const Offset(0, -490)
              ),
              ],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 150),
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0
                    )
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Milk Way Galaxy',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('The Milky Way is the galaxy that includes the Solar System, with the name describing the galaxy\'s appearance from Earth: a hazy band of light seen in the night sky formed from stars that cannot be individually distinguished by the naked eye',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                         ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        // [
        //   Layer(
        //     sensitivity: 1,
        //     image: AssetImage('assets/images/bg_galaxy.jpg'),
        //     preventCrop: true,
        //     imageBlurValue: 1,
        //   ),
        //   Layer(
        //       sensitivity: 7,
        //       image: const AssetImage('assets/images/nebula.png'),
        //       preventCrop: true,
        //       opacity: 0.7),
        //   Layer(
        //       sensitivity: 10,
        //       image: const AssetImage('assets/images/stars2.png'),
        //       preventCrop: true,
        //       opacity: 0.7),
        //   Layer(
        //     sensitivity: 7,
        //     image: AssetImage('assets/images/fg_landscape_night.png'),
        //     imageHeight: 200,
            
        //     //imageFit: BoxFit.fitHeight,
        // ),
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 120),
      //     child: Container(
      //       height: MediaQuery.of(context).size.height / 2,
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(20),
      //         border: Border.all(
      //           color: Colors.white,
      //           width: 2.0
      //         )
      //       ),
      //       child: const Padding(
      //         padding: EdgeInsets.all(18.0),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text('Milk Way Galaxy',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 20
      //               ),
      //             ),
      //             SizedBox(
      //               height: 10,
      //             ),
      //             Text('The Milky Way is the galaxy that includes the Solar System, with the name describing the galaxy\'s appearance from Earth: a hazy band of light seen in the night sky formed from stars that cannot be individually distinguished by the naked eye',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 18
      //              ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      ),
    );
  }
}

// class ParallaxEffectScreen extends StatefulWidget {
//   @override
//   _ParallaxEffectScreenState createState() => _ParallaxEffectScreenState();
// }

// class _ParallaxEffectScreenState extends State<ParallaxEffectScreen> {
//   double _x = 0.0;
//   double _y = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     gyroscopeEvents.listen((GyroscopeEvent event) {
//       setState(() {
//         _x = (_x + event.x).clamp(-10.0, 10.0);
//         _y = (_y + event.y).clamp(-10.0, 10.0);
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background Layer
//           Positioned.fill(
//             child: Transform.translate(
//               offset: Offset(-_x * 2, -_y * 2),
//               child: Image.asset(
//                 'assets/images/sky.jpg',
//                 fit: BoxFit.cover,
//                 //width: MediaQuery.of(context).size.width * 2,
//                 //height: MediaQuery.of(context).size.height,
//               ),
//             ),
//           ),
//           // Middle Layer
//           Center(
//             child: Container(
//                decoration: BoxDecoration(
//               border: Border.all(
//                 color: Colors.white
//               ),
//               borderRadius: BorderRadius.circular(20)
//             ),
//               child: const Padding(
//                 padding: EdgeInsets.all(18.0),
//                 child: Text(
//                   'Your Text Here',
//                   style: TextStyle(color: Colors.white, fontSize: 24),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           ),
//           Positioned.fill(
//             child: Transform.translate(
//               offset: Offset(_x * 4, _y * 4),
//               child: Image.asset(
//                 'assets/images/sky_tr.png',
//                 fit: BoxFit.cover,
//                 //width: double.infinity,
//                 //height: 100,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
