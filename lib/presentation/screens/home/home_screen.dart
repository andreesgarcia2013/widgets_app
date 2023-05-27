import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_item.dart';
class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Widgets en flutter'),
      ),
      body: const _HomeView()
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem=appMenuItems[index];
        return _CustomListTile(menuItem: menuItem);
      },);
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors=Theme.of(context).colorScheme;
    return ListTile(
      title: Text(menuItem.title,),
      subtitle: Text(menuItem.subTitle,),
      leading: Icon(menuItem.icon,color: colors.primary,),
      trailing: Icon(Icons.arrow_forward_ios, color: colors.primary),
      onTap: () {
        //TODO: Navegar a otras pantallas
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ButtonsScreen(),));
        context.push(menuItem.link);
      },
    );
  }
}