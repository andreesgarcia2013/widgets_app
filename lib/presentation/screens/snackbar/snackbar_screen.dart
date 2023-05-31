import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
   static const name='scnackbar_screen';
  const SnackbarScreen({Key? key}) : super(key: key);
  void showCustomSnackbar(BuildContext context){
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar=SnackBar(
      content: const Text('HolaMundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {},),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context){
    showDialog(context: context,
    barrierDismissible: false, 
      builder: (context) => AlertDialog(
        title: Text('Estas seguro'),
        content: Text('Cillum consequat tempor ad occaecat duis sint consectetur aliqua velit fugiat et officia fugiat.'),
        actions: [
          TextButton(onPressed: (){
            context.pop();
          }, child: Text('close')),
          FilledButton(onPressed: (){
            context.pop();
          }, child: Text('Aceptar'))
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snackbar y dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(onPressed: (){
              showAboutDialog(context: context,
                children: [
                  Text('Ea pariatur quis cillum nulla aliquip exercitation dolore exercitation non proident.')
                ]
              );
            }, child: Text('Licencias')),
            FilledButton.tonal(onPressed: ()=>openDialog(context), child: Text('Mostrar dialogo'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: ()=> showCustomSnackbar(context),
      icon: const Icon(Icons.remove_red_eye),
      label: const Text('Mostrar snackbar')),
       
    );
  }
}