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
            UserAccountsDrawerHeader(
              accountName: Text('Welcome'), 
              accountEmail: Text('email@email.com'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    'https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg',
                    fit: BoxFit.cover,
                  ),
                )
              )
            ),
            
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
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
              leading: Icon(Icons.star),
              title: const Text("Favourites"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: const Text("Profile"),
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
              leading: Icon(Icons.exit_to_app),
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

// child: Column(
//           children: [
//             AppBar(
//               title: const Text("DEALL"),
//             ),
//             ListTile(
//               leading: const Text("Home"),
//               onTap: () {
//                 if (AutoRouter.of(context).current.name != RetailerHomeRoute.name) {
//                   AutoRouter.of(context).popUntilRoot();
//                 } else {
//                   AutoRouter.of(context).pop();
//                 }
//               },
//             ),
//             //TODO: need to choose which one to display for diff user type
//             ListTile(
//               leading: const Text("Favourites"),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: const Text("Profile"),
//               onTap: () {
//                 if (AutoRouter.of(context).current.name !=
//                     RetailerProfileRoute.name) {
//                   AutoRouter.of(context).popAndPush(const RetailerProfileRoute());
//                 } else {
//                   AutoRouter.of(context).pop();
//                 }
//               },
//             ),
//             ListTile(
//               leading: const Text("Sign Out"),
//               onTap: () {
//                 ref.read(authNotifierProvider.notifier).signOut();
//               },
//             ),
//           ],
//         )