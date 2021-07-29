import 'package:deall/auth/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConsumerDrawer extends ConsumerWidget {
  const ConsumerDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          onTap: () {
            ref.read(authNotifierProvider.notifier).signOut();
          },
        ),
      ],
    ));
  }
}
