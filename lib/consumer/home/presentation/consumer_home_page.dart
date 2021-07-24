import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide ConsumerState;


class ConsumerHomePage extends ConsumerWidget {
  const ConsumerHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return const Scaffold(
      body: Center(child: Text('Consumer home page'),),
    );
  }
}
