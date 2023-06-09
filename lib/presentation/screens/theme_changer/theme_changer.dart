import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name="changertheme";
  const ThemeChangerScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode=ref.watch(themeNotifierProvider).isDarkMode;
    return  Scaffold(
      appBar: AppBar(
        title: Text('ThemeChanger'),
        actions: [
          IconButton(
            onPressed: (){
              // ref.read(isDarkModeProvider.notifier).update((state) => !state);
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            }, 
            icon: isDarkMode
            ? Icon(Icons.light_mode)
            : Icon(Icons.dark_mode)
          )
        ],
      ),
      body: _ThemeChangerView()
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors=ref.watch(colorListProvider);
    // final int indexColor=ref.watch(selectedIndexColorProvider);
    final int indexColor=ref.watch(themeNotifierProvider).selectedColor;
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color=colors[index];
        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color),),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index,
          groupValue: indexColor, 
          onChanged: (value) {
            //TODO: Notificar el cambio
            // ref.read(selectedIndexColorProvider.notifier).state=index;
            ref.read(themeNotifierProvider.notifier).changeColorIndex(index);
          },
        );
      },
    );
  }
}