import 'package:auto_route/auto_route.dart';
import 'package:deall/core/presentation/const/size_config.dart';
import 'package:deall/core/presentation/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            WelcomeWidget(),
            ButtonWidget()
            
          ],
        ),
      ),
    );
  }
}

class WelcomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Flexible(
          //   flex: 1,
            Padding(
              //error here
              
              padding: EdgeInsets.only(top: 10 * SizeConfig.heightMultiplier),
        //     //   child: Align(
        //     //     alignment: Alignment.bottomLeft,
        //         // child: FittedBox(
        //           child: Container(
        //             color: Colors.grey,
        //             child: Text(
        //               'Welcome.',
        //               style: Theme.of(context).textTheme.headline2,
        //               textAlign: TextAlign.left,
        //             ),
        //           ),
        //         // )
        //     //   ),
          //   )
          )
        ],
      )
    );
  }
}

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

          ElevatedButton(
            onPressed: () {
              AutoRouter.of(context).push(const SignInRoute());
            },
            child: const Text('sign in'),
          ),

          ElevatedButton(
            onPressed: () {
              AutoRouter.of(context).push(const SignUpRoute());
            },
            child: const Text('sign up'),
          ),

        ],
      ),
    );
  }
}