import 'dart:math';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stitchin_time/models/palette_model.dart';
import 'package:stitchin_time/models/project_model.dart';
import 'package:stitchin_time/models/swatch_model.dart';
import 'package:stitchin_time/providers/project_provider.dart';
part 'palette_provider.g.dart';

@riverpod
class Palette extends _$Palette {
  @override
  PaletteModel build() {
    ProjectModel projectModel = ref.watch(projectProvider);
    return projectModel.palette;
  }

  void setActiveIndex(int newIndex) {
    state = state.copyWith(activeSwatchIndex: newIndex.clamp(1, state.swatches.length - 1));
    ref.read(projectProvider.notifier).updateProject(palette: state);
  }

  void setSwatchAtIndex(Color color, int index) {
    HSVColor hsvColor = HSVColor.fromColor(color);
    state = state.copyWith(
      swatches: state.swatches.toList()
        ..[index] = SwatchModel(hue: hsvColor.hue, sat: hsvColor.saturation, val: hsvColor.value),
    );

    ref.read(projectProvider.notifier).updateProject(palette: state);
  }

  void addNewSwatch() {
    state = state.copyWith(swatches: state.swatches.toList()..add(SwatchModel(hue: Random().nextDouble() * 360)));
    ref.read(projectProvider.notifier).updateProject(palette: state);
  }

  void removeSwatchAtIndex(int index) {
    state = state.copyWith(swatches: state.swatches.toList()..removeAt(index));
    if (index == state.activeSwatchIndex) state = state.copyWith(activeSwatchIndex: state.activeSwatchIndex - 1);
    ref.read(projectProvider.notifier).updateProject(palette: state);
  }

  Color getActiveColor() => state.swatches[state.activeSwatchIndex].getColor();
}
