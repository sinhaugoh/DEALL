import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deall/consumer/home/application/retailer_list_notifier.dart';
import 'package:deall/consumer/home/infrastructure/retailer_list_remote_service.dart';
import 'package:deall/consumer/home/infrastructure/retailer_list_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);

final retailerListRemoteServiceProvider =
    Provider((ref) => RetailerListRemoteService(ref.watch(firestoreProvider)));
final retailerListRepo = Provider((ref) =>
    RetailerListRepository(ref.watch(retailerListRemoteServiceProvider)));

final retailerListNotifierProvider =
    StateNotifierProvider<RetailerListNotifier, RetailerListState>(
        (ref) => RetailerListNotifier(ref.watch(retailerListRepo)));
