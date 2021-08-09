import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:deall/auth/shared/providers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:image_picker/image_picker.dart';

import 'package:deall/core/infrastructure/image_picking_remote_service.dart';
import 'package:deall/core/infrastructure/image_picking_repository.dart';
import 'package:deall/retailer/infrastructure/product_repository.dart';
import 'package:deall/retailer/infrastructure/product_remote_service.dart';

final connectivityProvider = Provider((ref) => Connectivity());
final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);
final internetConnectionCheckerProvider =
    Provider((ref) => InternetConnectionChecker());

final firebaseStorageProvider = Provider((ref) => FirebaseStorage.instance);
final imagePickerProvider = Provider((ref) => ImagePicker());

final imagePickingRemoteServiceProvider =
    Provider((ref) => ImagePickingRemoteService(
          ref.watch(imagePickerProvider),
          ref.watch(firebaseStorageProvider),
        ));
final imagePickingRepositoryProvider = Provider((ref) => ImagePickingRepository(
      ref.watch(imagePickingRemoteServiceProvider),
    ));

// Product providers
final productListRemoteServiceProvider =
    Provider((ref) => ProductListRemoteService(
          ref.watch(firestoreProvider),
          ref.watch(firebaseAuthProvider),
        ));

final productListRepoProvider = Provider(
  (ref) => ProductListRepository(
    ref.watch(productListRemoteServiceProvider),
    ref.watch(firestoreProvider),
  ),
);
