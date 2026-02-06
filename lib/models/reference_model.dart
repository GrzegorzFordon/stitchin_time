import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:ui' as ui;

part 'reference_model.g.dart';
part 'reference_model.freezed.dart';

@freezed
abstract class ReferenceModel with _$ReferenceModel {
  const factory ReferenceModel({
    @Default(0.0) double posX,
    @Default(0.0) double posY,
    @Default(1.0) double scale,
    @Default(0.5) double opacity,
    @Default(0) double rotAngle,
    @Default("") String base64encodedImageString,
    @BytesConverter() Uint8List? bytes,
    @ImageConverter() ui.Image? refImg,
  }) = _ReferenceModel;

  factory ReferenceModel.fromJson(Map<String, dynamic> json) => _$ReferenceModelFromJson(json);
}

class BytesConverter implements JsonConverter<Uint8List?, dynamic> {
  const BytesConverter();

  @override
  fromJson(json) {
    return null;
  }

  @override
  toJson(object) {}
}

class ImageConverter implements JsonConverter<ui.Image?, dynamic> {
  const ImageConverter();
  @override
  fromJson(json) {
    return null;
  }

  @override
  toJson(object) {}
}
