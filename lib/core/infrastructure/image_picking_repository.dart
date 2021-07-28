import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:deall/core/application/image_picking_failure.dart';
import 'package:deall/core/infrastructure/image_picking_remote_service.dart';
import 'package:flutter/services.dart';

class ImagePickingRepository {
  final ImagePickingRemoteService _imagePickingRemoteService;

  ImagePickingRepository(this._imagePickingRemoteService);

  Future<Either<ImagePickingFailure, File>> pickImage() async {
    try {
      final result = await _imagePickingRemoteService.pickImageFromGallery();
      if(result == null) {
        return left(const ImagePickingFailure.imagePicker('Cancelled'));
      } else {
        return right(result);
      }
    } on PlatformException catch(e) {
      return left(ImagePickingFailure.imagePicker(e.code));
    }
  }

  Future<Either<ImagePickingFailure, String>> uploadShopLogoToCloudStorage ({
    required String userId,
    required File file,
  }) async {
    try {
      return right(await _imagePickingRemoteService.uploadShopLogoToCloudStorage(userId: userId, file: file,));
    } on FirebaseException catch(e) {
      return left(ImagePickingFailure.server(e.code));
    }
  }
}