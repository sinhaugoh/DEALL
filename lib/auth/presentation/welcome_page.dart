import 'package:auto_route/auto_route.dart';
import 'package:deall/core/presentation/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deall/core/presentation/const/header.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: Header().headerBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DeallLogo(0.5,0.1),
            const SizedBox(height:12),
            LateNightWidget(),
            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).push(const SignInRoute());
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10)
              ),
              child: const Text('Sign in'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).push(const SignUpRoute());
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10)
              ),
              child: const Text('Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}

class LateNightWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
  final mq = MediaQuery.of(context);

    return Container(
      width: mq.size.width * 0.8,
      height: mq.size.height* 0.05,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
        'Late night deals for your supper needs.',
          style: GoogleFonts.archivo(
            textStyle: Theme.of(context).textTheme.headline4,
            // fontSize: 18,
            fontWeight: FontWeight.w100,
            fontStyle: FontStyle.italic,
          )
        )
      ),
    ); 
  }
}