import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deall/auth/presentation/widget/header.dart';

final splashHasRenderedProvider = StateProvider<bool>((ref) => false);

class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance?.addPostFrameCallback(
        (_) => ref.watch(splashHasRenderedProvider).state = true);
    //TODO: implement splash page
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DeallLogo(48),
          ],
          
        // child: Column(
        //   children: [
        //     const Text('this is splash page!'),
        //     ElevatedButton(
        //         onPressed: () {
        //           FirebaseAuth.instance.currentUser
        //               ?.updateDisplayName(AuthRepository.consumerTypeString);
        //         },
        //         child: const Text('become consumer')),
        //     ElevatedButton(
        //         onPressed: () {
        //           FirebaseAuth.instance.currentUser
        //               ?.updateDisplayName(AuthRepository.retailerTypeString);
        //         },
        //         child: const Text('become retailer')),
        //   ],
        // ),
         ),
        ),
    );
  }
}
