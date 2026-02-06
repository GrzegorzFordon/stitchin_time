import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class Theme extends _$Theme {
  @override
  ThemeData build() {
    return ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: Colors.orange,
        dynamicSchemeVariant: DynamicSchemeVariant.values[7],
      ),
    );
  }

  void set({Color? seedColor, Brightness? brightness, DynamicSchemeVariant? dynamicSchemeVariant}) {
    state = ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        brightness: brightness ?? state.brightness,
        seedColor: seedColor ?? Colors.orange,
        dynamicSchemeVariant: dynamicSchemeVariant ?? DynamicSchemeVariant.values[7],
      ),
    );
  }
}
