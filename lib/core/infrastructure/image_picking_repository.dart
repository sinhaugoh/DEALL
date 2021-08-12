import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:deall/core/application/image_picking_failure.dart';
import 'package:deall/core/infrastructure/image_picking_remote_service.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ImagePickingRepository {
  final ImagePickingRemoteService _imagePickingRemoteService;
  final InternetConnectionChecker _internetConnectionChecker;

  ImagePickingRepository(
      this._imagePickingRemoteService, this._internetConnectionChecker);

  Future<Either<ImagePickingFailure, File>> pickImage() async {
    try {
      final result = await _imagePickingRemoteService.pickImageFromGallery();
      if (result == null) {
        return left(const ImagePickingFailure.imagePicker('Cancelled'));
      } else {
        return right(result);
      }
    } on PlatformException catch (e) {
      return left(ImagePickingFailure.imagePicker(e.code));
    }
  }

  Future<Either<ImagePickingFailure, String>> uploadShopLogoToCloudStorage({
    required String userId,
    required File file,
  }) async {
    if (!await _internetConnectionChecker.hasConnection) {
      return left(const ImagePickingFailure.noConnection());
    }

    try {
      return right(
          await _imagePickingRemoteService.uploadShopLogoToCloudStorage(
        userId: userId,
        file: file,
      ));
    } on FirebaseException catch (e) {
      return left(ImagePickingFailure.server(e.code));
    }
  }

  Future<Either<ImagePickingFailure, String>> uploadProductImageToCloudStorage({
    required String userId,
    required File file,
    required String productId,
  }) async {
    if (!await _internetConnectionChecker.hasConnection) {
      return left(const ImagePickingFailure.noConnection());
    }

    try {
      return right(
          await _imagePickingRemoteService.uploadProductImageToCloudStorage(
        userId: userId,
        productId: productId,
        file: file,
      ));
    } on FirebaseException catch (e) {
      return left(ImagePickingFailure.server(e.code));
    }
  }
}
