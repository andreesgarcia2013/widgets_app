import 'package:flutter/material.dart';

class AppTutorialScreen extends StatelessWidget {
   static const name='app_tutorial';
  const AppTutorialScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         child: Text('AppTutorialScreen'),
      ),
    );
  }
}