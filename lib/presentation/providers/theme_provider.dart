import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
//Listado de colores inmutable
final colorListProvider = Provider((ref) {
  return colorList;
});

final isDarkModeProvider = StateProvider<bool>((ref) {
  return false;
});


final selectedIndexColorProvider = StateProvider<int>((ref) {
  return 0;
});

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) {
  return ThemeNotifier();
});


class ThemeNotifier extends StateNotifier<AppTheme> {
  //State es una nueva instancia del AppTheme
  ThemeNotifier():super(AppTheme());

  void toggleDarkMode(){
    state=state.copyWith(isDarkMode:!state.isDarkMode);
  }

  void changeColorIndex(int indexColor){
    state=state.copyWith(selectedColor: indexColor);
  }
  
}