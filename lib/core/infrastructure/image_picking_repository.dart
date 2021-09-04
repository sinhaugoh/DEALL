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

  /// pick image from local gallery (work for android only)
  /// 
  /// if the user cancel the operation, [ImagePickingFailure.imagePicker]
  /// will be returned
  /// 
  /// if [PlatformException] is thrown, [ImagePickingFailure.imagePicker] will be returned
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

  /// upload shop logo to firebase storage
  /// 
  /// return [ImagePickingFailure.noConnection] if no connection
  /// 
  /// return [ImagePickingFailure.server] if firebase exception thrown
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

  /// upload product image to firebase storage with path format:
  /// - ProductImage/{userId}/{file extension string}
  /// 
  /// return [ImagePickingFailure.noConnection] if no connection
  /// 
  /// return [ImagePickingFailure.server] if firebase exception thrown
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
