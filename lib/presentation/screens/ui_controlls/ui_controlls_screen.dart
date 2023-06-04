import 'package:flutter/material.dart';

class UIControllsScreen extends StatelessWidget {
  static const name = 'ui_controlls_screen';
  const UIControllsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('UIControlls'),
        ),
        body: _UIControllsView());
  }
}

class _UIControllsView extends StatefulWidget {
  const _UIControllsView({
    super.key,
  });

  @override
  State<_UIControllsView> createState() => _UIControllsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UIControllsViewState extends State<_UIControllsView> {
  bool isDev = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast=false;
  bool wantsLunch=false;
  bool wantsDinner=false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDev,
          onChanged: (value) {
            setState(() {
              isDev = !isDev;
            });
          },
        ),
        ExpansionTile(
          title: Text('Vehiculo de transporte'),
          subtitle: Text('${selectedTransportation.name}'),
          children: [
            RadioListTile(
              title: const Text('ByCar'),
              subtitle: const Text('Viajar por auto'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.car;
              }),
            ),
            RadioListTile(
              title: const Text('By plane'),
              subtitle: const Text('Viajar por Avion'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.plane;
              }),
            ),
            RadioListTile(
              title: const Text('By barco'),
              subtitle: const Text('Viajar por barco'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.boat;
              }),
            ),
            RadioListTile(
              title: const Text('By submarine'),
              subtitle: const Text('Viajar por submarino'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.submarine;
              }),
            ),
          ],
        ),
      //TODO:Termina expansion

      CheckboxListTile(
        title: const Text('Desayuno?'),
        value: wantsBreakfast, 
        onChanged: (value) => setState(() {
          wantsBreakfast=!wantsBreakfast;
        }),
      ),
      CheckboxListTile(
        title: const Text('Almuerzo?'),
        value: wantsLunch, 
        onChanged: (value) => setState(() {
          wantsLunch=!wantsLunch;
        }),
      ),
      CheckboxListTile(
        title: const Text('Cena?'),
        value: wantsDinner, 
        onChanged: (value) => setState(() {
          wantsDinner=!wantsDinner;
        }),
      ),
      ],
    );
  }
}
