import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_picking_failure.freezed.dart';

@freezed
class ImagePickingFailure with _$ImagePickingFailure {
  const ImagePickingFailure._();
  const factory ImagePickingFailure.noConnection() = NoConnection;
  const factory ImagePickingFailure.imagePicker(String errorMessage) = ImagePicker;
  const factory ImagePickingFailure.server(String errorMessage) = Server;
}