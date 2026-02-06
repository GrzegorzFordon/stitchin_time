import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stitchin_time/models/reference_model.dart';

part 'references_model.g.dart';
part 'references_model.freezed.dart';

@freezed
abstract class ReferencesModel with _$ReferencesModel {
  const factory ReferencesModel({
    @Default("defaultValue") String uuid,
    @Default([]) List<ReferenceModel> references,
    @Default(0) int activeIndex,
    @Default(ReferenceModel()) ReferenceModel cachedRefData,
  }) = _ReferencesModel;

  factory ReferencesModel.fromJson(Map<String, dynamic> json) => _$ReferencesModelFromJson(json);
}
