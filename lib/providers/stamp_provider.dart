import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stitchin_time/models/pattern_model.dart';

part 'stamp_provider.g.dart';

@riverpod
class Stamp extends _$Stamp {
  @override
  PatternModel build() => PatternModel();

  void set(PatternModel model) => state = model;
}
