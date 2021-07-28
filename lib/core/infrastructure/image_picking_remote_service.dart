import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickingRemoteService {
  final ImagePicker _imagePicker;
  final FirebaseStorage _firebaseStorage;

  static const int compressionQuality = 25;

  ImagePickingRemoteService(this._imagePicker, this._firebaseStorage);

  Future<File?> pickImageFromGallery() async {
    XFile? result = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: compressionQuality,
    );

    if (result == null) {
      return null;
    } else {
      return File(result.path);
    }
  }
}
