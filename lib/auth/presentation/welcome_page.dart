import 'package:auto_route/auto_route.dart';
import 'package:deall/auth/presentation/widget/sign_in_form.dart';
import 'package:deall/core/presentation/const/size_config.dart';
import 'package:deall/core/presentation/const/themedata_swatch_color.dart';
import 'package:deall/core/presentation/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: WelcomeWidget()
            ),
            // Expanded(
            //   flex: 3,
            //   child: SignInForm(),
            // ),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Welcome.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 8.0 * SizeConfig.textMultiplier,
                  fontWeight: FontWeight.w500
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Align(
            child: Text(
              'Late night deals for your supper needs.',
              style: GoogleFonts.archivo(
                textStyle: Theme.of(context).textTheme.subtitle2,
              ),
              textAlign: TextAlign.center,
            )
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
            // child: SignInForm()
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
      // color: Colors.yellow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0 * SizeConfig.heightMultiplier, vertical: 1.0*SizeConfig.heightMultiplier),
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(height: 7*SizeConfig.heightMultiplier),
              child: ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context).push(const SignInRoute());
                },
                child: const Text('Sign-in'),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))
                   )
                 ),
                ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0 * SizeConfig.heightMultiplier, vertical: 1.0*SizeConfig.heightMultiplier),
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(height: 7*SizeConfig.heightMultiplier),
              child: ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context).push(const SignUpRoute());
                },
                child: const Text('Sign-up',style: TextStyle(color: Colors.black)),
                style: ButtonStyle(
                    side: MaterialStateProperty.all(BorderSide(color: Color(0xFFF86B6B))),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      )
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFF7EC)),
                 ),
              ),
            ),
          ),
        Divider(
          // thickness: 2,
          // indent: 4.5 * SizeConfig.heightMultiplier,
          // endIndent: 4.5 * SizeConfig.heightMultiplier,
          height: 18 * SizeConfig.heightMultiplier,
        )
        ],
      ),
    );
  }
}