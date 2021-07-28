import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:deall/consumer/application/retailer_list_notifier.dart';
import 'package:deall/consumer/infrastructure/retailer_list_remote_service.dart';
import 'package:deall/consumer/infrastructure/retailer_list_repository.dart';
import 'package:deall/consumer/application/retailer_list_state.dart';

final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);
final internetConnectionCheckerProvider = Provider((ref) => InternetConnectionChecker());

final retailerListRemoteServiceProvider = Provider((ref) => RetailerListRemoteService(ref.watch(firestoreProvider)));

final retailerListRepoProvider = Provider((ref) => RetailerListRepository(ref.watch(retailerListRemoteServiceProvider)));

final retailerListNotifierProvider = StateNotifierProvider<RetailerListNotifier, RetailerListState>(
        (ref) => RetailerListNotifier(ref.watch(retailerListRepoProvider)));


