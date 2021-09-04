import 'package:auto_route/auto_route.dart';
import 'package:deall/consumer/presentation/widgets/custom_card.dart';
import 'package:deall/core/presentation/routes/app_router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:deall/consumer/shared/providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RetailerItem extends ConsumerWidget {
  const RetailerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final retailerData = ref.watch(currentRetailerItem);
    final mq = MediaQuery.of(context);
    return GestureDetector(
      onTap: () => AutoRouter.of(context)
      .push(ConsumerProductListRoute(retailerData: retailerData)),
      child: Container(
        // color: Colors.tealAccent,
        padding: EdgeInsets.only(
          left: mq.size.width * 0.05,
          right: mq.size.width * 0.05,
          top: mq.size.width * 0.03,
        ),
        height: mq.size.height * 0.2,
        width: mq.size.width * 0.9,
        child: CustomCard(retailerData: retailerData)
      ),
    );
  }
}