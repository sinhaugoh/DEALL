import 'package:auto_route/auto_route.dart';
import 'package:deall/core/presentation/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:deall/auth/presentation/widget/header.dart';
import 'package:deall/auth/presentation/widget/email_text_field.dart';


class WelcomePage extends ConsumerWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: Header().HeaderBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DeallLogo(48),
            SizedBox(height: 12),
            LateNightWidget(),
            SizedBox(height: 15),

            // EmailTextField(
            //   errorText: ref.watch(signInFormNotifierProvider
            //           .select((state) => state.showErrorMessage))
            //       ? ref.watch(signInFormNotifierProvider
            //           .select((state) => state.emailErrorMessage))
            //       : null,
            //   onChanged:
            //       ref.read(signInFormNotifierProvider.notifier).emailChanged,
            // ),

            ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).push(const SignInRoute());
              },
              child: const Text('Sign in'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red[300],
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10)
              ),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).push(const SignUpRoute());
              },
              child: const Text('Sign up'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red[300],
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10)
              ),            
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

class LateNightWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Text(
      'Late night deals for your supper needs.',
        style: GoogleFonts.archivo(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 18,
          fontWeight: FontWeight.w100,
          fontStyle: FontStyle.italic,
        )
      );
  }
}
