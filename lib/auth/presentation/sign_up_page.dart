import 'package:auto_route/auto_route.dart';
import 'package:deall/core/presentation/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:deall/auth/presentation/widget/header.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header().HeaderBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select your User Profile.',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: Header().Font(context, 30),
            ),
            SizedBox(height: 37),
            ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).push(const ConsumerSignUpRoute());
              },
              child: const Text('Consumer'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red[300],
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10)
              ),
            ),
            ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).push(const RetailerSignUpRoute());
              },
              child: const Text('Retailer'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.red[300],
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10)
                ),
            ),
          ],
        ),
      ),
    );
  }
}
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: Header().HeaderBar(context),
//       body: Column(
//         children: <Widget>[
//           Container(
//             child: Stack(
//               children: <Widget>[
//                 Container(
//                   padding: EdgeInsets.fromLTRB(15, 50, 0, 0),
//                   child: Text(
//                     'Select your User Profile.',
//                     style: Header().Font(context, 30),
//                   ),
//                   // child: Text(
//                   //   'Are you a consumer or a retailer?',
//                   //   style: TextStyle(
//                   //     fontSize: 30, 
//                   //     fontWeight: FontWeight.bold
//                   //     )
//                   //   ),
//                 ),
//               ],
//             )
//           ),
//           Center(
//             child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                   onPressed: () {
//                     AutoRouter.of(context).push(const ConsumerSignUpRoute());
//                   },
//                   child: const Text('Consumer')
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     AutoRouter.of(context).push(const RetailerSignUpRoute());
//                   },
//                   child: const Text('Retailer')
//               ),
//             ],
//             ),
//           ),
//         ],
//       )
//     );
//   }
// }