import 'package:auto_route/auto_route.dart';
import 'package:deall/auth/shared/providers.dart';
import 'package:deall/core/presentation/routes/app_router.gr.dart';
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
          onTap: () {
            if (AutoRouter.of(context).current.name != RetailerHomeRoute.name) {
              AutoRouter.of(context).popUntilRoot();
            } else {
              AutoRouter.of(context).pop();
            }
          },
        ),
        //TODO: need to choose which one to display for diff user type
        ListTile(
          leading: const Text("Favourites"),
          onTap: () {},
        ),
        ListTile(
          leading: const Text("Profile"),
          onTap: () {
            if (AutoRouter.of(context).current.name !=
                RetailerProfileRoute.name) {
              AutoRouter.of(context).popAndPush(const RetailerProfileRoute());
            } else {
              AutoRouter.of(context).pop();
            }
          },
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
