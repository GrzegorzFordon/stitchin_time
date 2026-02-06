import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stitchin_time/models/pan_data_model.dart';

part 'pan_data_provider.g.dart';

@riverpod
class PanData extends _$PanData {
  @override
  PanDataModel build() => PanDataModel();

  void set(PanDataModel model) => state = model;
}
