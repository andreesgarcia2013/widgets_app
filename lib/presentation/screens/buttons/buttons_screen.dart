import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const name='buttons_screen';
  const ButtonsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CardsScreen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_outlined),),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          children: [
            ElevatedButton(onPressed: (){}, child: Text('Elevated Button')),
            const ElevatedButton(onPressed: null, child: Text('Elevated Disabled')),
            ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.access_alarm_outlined), label: Text('Elevated Icon')),
            FilledButton(onPressed: (){}, child: Text('Filled')),
            FilledButton.icon(onPressed: () {}, icon: Icon(Icons.access_time_filled), label: Text('Fill icon')),
            OutlinedButton(onPressed: () {}, child: Text('Outline')),
            OutlinedButton.icon(onPressed: () {}, icon: Icon(Icons.access_time_filled), label: Text('Fill icon')),
            TextButton(onPressed: () {}, child: Text('Outline')),
            TextButton.icon(onPressed: () {}, icon: Icon(Icons.access_time_filled), label: Text('Fill icon')),
            IconButton(onPressed: (){}, 
              icon: Icon(Icons.baby_changing_station),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.amber),
                iconColor: MaterialStatePropertyAll(Colors.red)
              ),
            ),
            const CustomButton()
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors=Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: (){},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text('Hola', style: TextStyle(color: Colors.white),)),
        ),
      ),
    );
  }
}