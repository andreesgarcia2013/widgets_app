import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name='counter_screen';
  const CounterScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clickCounter=ref.watch(counterProvider);
    final isDarkMode=ref.watch(isDarkModeProvider);
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Counter screen'),
        actions: [
          IconButton(
            onPressed: (){
            ref.read(isDarkModeProvider.notifier).update((state) => !state);
            }, 
            icon: isDarkMode
            ? Icon(Icons.dark_mode)
            : Icon(Icons.light_mode)
          )
        ],
      ),
      body:  Center(
         child: Text('Valor: $clickCounter', style: TextStyle(fontSize: 25),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ref.read(counterProvider.notifier).update((state) => state+1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}