import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

class ImagePickingRemoteService {
  final ImagePicker _imagePicker;
  final FirebaseStorage _firebaseStorage;

  static const int compressionQuality = 25;
  static const String shopLogoDir = 'ShopLogo';
  static const String productImageDir = 'ProductImage';

  ImagePickingRemoteService(this._imagePicker, this._firebaseStorage);

  Future<File?> pickImageFromGallery() async {
    final XFile? result = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: compressionQuality,
    );

    if (result == null) {
      return null;
    } else {
      return File(result.path);
    }
  }

  Future<String> uploadShopLogoToCloudStorage({
    required String userId,
    required File file,
  }) async {
    final String extension = p.extension(file.path);
    final String storagePath = '$shopLogoDir/$userId$extension';
    return _uploadImageToDBBasedOnPath(path: storagePath, file: file);
  }

  Future<String> uploadProductImageToCloudStorage({
    required String userId,
    required String productId,
    required File file,
  }) async {
    final String extension = p.extension(file.path);
    final String storagePath = '$productImageDir/$userId/$productId$extension';
    return _uploadImageToDBBasedOnPath(path: storagePath, file: file);
  }

  Future<String> _uploadImageToDBBasedOnPath({
    required String path,
    required File file,
  }) async {
    final Reference ref = _firebaseStorage.ref(path);
    final UploadTask result = ref.putFile(file);
    await result;
    return ref.getDownloadURL();
  }
}
