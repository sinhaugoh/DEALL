import 'package:flutter/material.dart';

class ConsumerDrawer extends StatelessWidget {
  const ConsumerDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        AppBar(
          title: const Text("DEALL"),
        ),
        ListTile(
          leading: const Text("Home"),
          onTap: () {},
        ),
        ListTile(
          leading: const Text("Favourites"),
          onTap: () {},
        ),
        ListTile(
          leading: const Text("Sign Out"),
          onTap: () {},
        ),
      ],
    ));
  }
}
