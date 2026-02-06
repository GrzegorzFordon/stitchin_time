import 'package:flutter/gestures.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'canvas_offset_provider.g.dart';

@riverpod
class CanvasOffset extends _$CanvasOffset {
  @override
  Offset build() => Offset.zero;

  void add(Offset offset) => state += offset;
  void reset() => state = Offset.zero;
}

