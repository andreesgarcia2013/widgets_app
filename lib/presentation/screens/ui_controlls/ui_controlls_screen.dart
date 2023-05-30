import 'package:flutter/material.dart';

class UIControllsScreen extends StatelessWidget {
   static const name='ui_controlls_screen';
  const UIControllsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
         child: Text('UIControllsScreen'),
      ),
    );
  }
}