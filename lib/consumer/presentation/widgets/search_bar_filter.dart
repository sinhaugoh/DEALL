import 'package:deall/consumer/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBarWithFilterButton extends ConsumerWidget {
  final TextEditingController textEditingController;
  const SearchBarWithFilterButton({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mq = MediaQuery.of(context);
    return Container(
      height: mq.size.height * 0.1,
      child: TextField(
        controller: textEditingController,
        onSubmitted:
            ref.read(retailerListNotifierProvider.notifier).searchWithTerm,
      ),
    );
  }
}
