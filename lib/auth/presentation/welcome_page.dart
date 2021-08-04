import 'package:auto_route/auto_route.dart';
import 'package:deall/auth/presentation/widget/sign_in_form.dart';
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
            Expanded(
              flex: 4,
              child: Align(
                // alignment: Alignment.bottomLeft,
                child: WelcomeWidget()
              )
            ),
            Expanded(
              flex: 3,
              child: SignInForm(),
            ),
            Expanded(
              flex: 2,
              child: ButtonWidget()
            ),
            
          ],
        ),
      ),
    );
  }
}

class WelcomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: SizeConfig.heightMultiplier*35,
      // width: MediaQuery.of(context).size.width,
      // color: Colors.blue,
      // alignment: Alignment.bottomLeft,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: Align(
              // color: Colors.blue,
              alignment: Alignment.bottomLeft,
              child: Text(
                'Welcome.',
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          // Text(
          //   'Late night deals for your supper needs.',
          //   style: Theme.of(context).textTheme.headline3,
          //   textAlign: TextAlign.left,
          // )
          Expanded(
            flex:1,
            child: Container(
              color: Colors.grey,
              child: Text(
                'test',
                style: Theme.of(context).textTheme.headline3,
              )
            ),
          ),
        ],
      ),
    );
  }
}

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            // flex:2,
            child: Text('test'),
            // SignInForm()
          )
        ],
      )
    );
  }
}

//Container
      // height: SizeConfig.heightMultiplier*35,
      // width: MediaQuery.of(context).size.width,
      // color: Colors.blue,
      // alignment: Alignment.bottomLeft,

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).push(const SignInRoute());
              },
              child: const Text('sign in'),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                    )
                 )
               ),
              ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).push(const SignUpRoute());
              },
              child: const Text('sign up'),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                    )
                 ),
               ),
               
            ),
          ),

        ],
      ),
    );
  }
}