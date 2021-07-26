import 'package:auto_route/auto_route.dart';
import 'package:deall/core/presentation/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up as'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context).push(const ConsumerSignUpRoute());
                },
                child: const Text('Consumer')),
            ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context).push(const RetailerSignUpRoute());
                },
                child: const Text('Retailer')),
          ],
        ),
      ),
    );
  }
}
