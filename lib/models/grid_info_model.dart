import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'grid_info_model.freezed.dart';
part 'grid_info_model.g.dart';

@freezed
abstract class GridInfoModel with _$GridInfoModel {
  const GridInfoModel._();
  const factory GridInfoModel({
    @Default(20) int rows,
    @Default(20) int columns,
    @Default(30) int cellWidth,
    @Default(30) int cellHeight,
    @Default(CellWidthType.square) CellWidthType cellWidthType,
    @Default(10) int highlightDelta,
    @Default(true) bool isChangedAtEnd,
  }) = _GridInfoModel;

  double getWidth() {
    return cellWidth * getCellRatio() * columns * 1.0;
  }

  double getHeight() {
    return cellHeight * rows * 1.0;
  }

  Offset getCenter() {
    double dx = getWidth() * 0.5;
    double dy = getHeight() * 0.5;
    return Offset(dx, dy);
  }

  bool isCellWithinCanvas((int, int) cell) {
    bool isNotNegative = cell.$1 >= 0 && cell.$2 >= 0;
    bool isNotBeyond = cell.$1 < columns && cell.$2 < rows;
    return isNotNegative && isNotBeyond;
  }

  double getCellRatio() => switch (cellWidthType) {
    CellWidthType.square => 1.0,
    CellWidthType.tall => 0.8,
    CellWidthType.wide => 1.2,
  };

  factory GridInfoModel.fromJson(Map<String, dynamic> json) => _$GridInfoModelFromJson(json);
}

enum CellWidthType { tall, square, wide }
