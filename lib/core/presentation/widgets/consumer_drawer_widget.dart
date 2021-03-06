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
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text(''), 
              accountEmail: Text('Menu'),
            ),
            
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                if (AutoRouter.of(context).current.name != ConsumerHomeRoute.name) {
                  AutoRouter.of(context).popUntilRoot();
                } else {
                  AutoRouter.of(context).pop();
                }
              },
            ),
            //TODO: need to choose which one to display for diff user type
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text("Favourites"),
              onTap: () {
                if (AutoRouter.of(context).current.name != FavouriteRetailerRoute.name) {
                  AutoRouter.of(context).popAndPush(const FavouriteRetailerRoute());
                } else {
                  AutoRouter.of(context).pop();
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Sign Out"),
              onTap: () {
                ref.read(authNotifierProvider.notifier).signOut();
              },
            ),
          ]
      )
    );
  }
}