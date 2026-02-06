import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chart_offset_provider.g.dart';

@riverpod
class ChartOffset extends _$ChartOffset {
  @override
  Offset build() => Offset(0, 0);

  void set(Offset offset) => state = offset;
  void add(Offset offset) => state += offset;
}
