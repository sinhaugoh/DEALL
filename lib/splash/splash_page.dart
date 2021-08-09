import 'package:deall/core/presentation/const/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashHasRenderedProvider = StateProvider<bool>((ref) => false);

class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance?.addPostFrameCallback(
        (_) => ref.watch(splashHasRenderedProvider).state = true);
    //TODO: implement splash page
    //Initialize layout and orientation settings
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return const Scaffold(
              backgroundColor: Color(0xFFF86B6B),
            );
          }
        );
      }
    );
  }
}


        // child: Text('test'),
        // child: Image.asset(
        //   Images.logoIconNoBorder,
        //   fit: BoxFit.scaleDown,
        // ),
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