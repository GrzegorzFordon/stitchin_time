import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'reference_points_provider.g.dart';

@riverpod
class ReferencePoints extends _$ReferencePoints {
  @override
  List<Offset> build() => [Offset(0, 0), Offset(0, 0)];

  void set(List<Offset> offsets) => state = offsets;

  void clear() => state = [Offset(0, 0), Offset(0, 0)];
}
