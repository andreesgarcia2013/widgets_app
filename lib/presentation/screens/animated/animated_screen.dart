import 'package:flutter/material.dart';
import 'dart:math' show Random;
class AnimatedScreen extends StatefulWidget {
  static const name='animated_screen';
   
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width=50;
  double height=50;
  Color color=Colors.indigo;
  double borderRadius=10.0;

  void changeShape(){
    final random=Random();
    width=random.nextInt(300)+120;
    height=random.nextInt(300) +120;
    color=Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    borderRadius=random.nextInt(100)+20;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.bounceOut,
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius)
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: changeShape,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}