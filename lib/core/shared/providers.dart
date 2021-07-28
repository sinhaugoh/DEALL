import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deall/core/infrastructure/image_picking_remote_service.dart';
import 'package:deall/core/infrastructure/image_picking_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);
final firebaseStorageProvider = Provider((ref) => FirebaseStorage.instance);
final imagePickerProvider = Provider((ref) => ImagePicker());

final imagePickingRemoteServiceProvider =
    Provider((ref) => ImagePickingRemoteService(
          ref.watch(imagePickerProvider),
          ref.watch(firebaseStorageProvider),
        ));
final imagePickingRepositoryProvider = Provider((ref) =>
    ImagePickingRepository(ref.watch(imagePickingRemoteServiceProvider),));
