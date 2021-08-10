import 'package:deall/consumer/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RetailerDetailPage extends ConsumerStatefulWidget {
  const RetailerDetailPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      RetailerDetailPageState();
}

class RetailerDetailPageState extends ConsumerState<RetailerDetailPage> {
  
  @override
  Widget build(BuildContext context) {
    final index = ref.watch(currentRetailerItemIndex);
    final retailerData = retailerList[index];
    return const Scaffold(


    );
  }
}
