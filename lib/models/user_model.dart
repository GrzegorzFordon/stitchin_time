import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stitchin_time/models/project_model.dart';
import 'package:stitchin_time/models/reference_model.dart';

part 'user_model.g.dart';
part 'user_model.freezed.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    @Default({}) Map<String, ProjectModel> projects,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
