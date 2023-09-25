// side_menu.dart
import 'package:flutter/material.dart';


class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/');
            },
          ),
          ListTile(
            title: const Text('Login'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/login');
            },
          ),
        ],
      ),
    );
  }
}
