import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
   static const name='progress_screen';
  const ProgressScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('progress Indicator'),
      ),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
       child: Column(
        children: const [
          SizedBox(height: 30,),
          Text('Circular progress indicator'),
          SizedBox(height: 10,),
          CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.black26,),
          SizedBox(height: 20,),
          Text('Circular y linear controlado'),
          SizedBox(height: 10,),
          _ControllerProgressIndicator()
        ],
       )
    );
  }
}

class _ControllerProgressIndicator extends StatelessWidget {
  const _ControllerProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return (value*2)/100;
      } ).takeWhile((value) => value<100),
      builder: (context, snapshot) {
        final progressValue=snapshot.data??0;

        return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(value: progressValue, strokeWidth: 2, backgroundColor: Colors.black26,),
            SizedBox(width: 20,),
            Expanded(child: LinearProgressIndicator(value: progressValue,))
          ],
        ),
      );
      },
    );
  }
}