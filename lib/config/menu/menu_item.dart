import 'package:flutter/material.dart';
class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon
  });
}

const appMenuItems=<MenuItem>[
    MenuItem(
      title: 'Botones en flutter',
      subTitle: 'Varios botones', 
      link: '/buttons', 
      icon: Icons.smart_button_outlined
    ),
    MenuItem(
      title: 'Tarjetas',
      subTitle: 'Un contenedor estilizado', 
      link: '/cards', 
      icon: Icons.credit_card
    ),
    MenuItem(
      title: 'ProgressIndicators',
      subTitle: 'Generales y controlados', 
      link: '/progress', 
      icon: Icons.refresh_rounded
    ),
    MenuItem(
      title: 'Snack bar',
      subTitle: 'Snackbars y dialogos', 
      link: '/snackbar', 
      icon: Icons.info
    ),
  ];