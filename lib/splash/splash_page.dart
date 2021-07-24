import 'package:deall/auth/infrastructure/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: implement splash page
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const Text('this is splash page!'),
          ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.currentUser
                    ?.updateDisplayName(AuthRepository.consumerTypeString);
              },
              child: const Text('become consumer')),
          ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.currentUser
                    ?.updateDisplayName(AuthRepository.retailerTypeString);
              },
              child: const Text('become retailer')),
        ],
      )),
    );
  }
}
