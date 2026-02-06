import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'platform_provider.g.dart';

@riverpod
class LastUsedPointerDeviceKindIsTouch extends _$LastUsedPointerDeviceKindIsTouch {
  @override
  bool build() {
    return true;
  }

  void set(PointerDeviceKind value) {
    state = switch (value) {
      PointerDeviceKind.touch => true,
      PointerDeviceKind.invertedStylus => true,
      PointerDeviceKind.stylus => true,
      PointerDeviceKind.mouse => false,
      PointerDeviceKind.trackpad => false,
      PointerDeviceKind.unknown => false,
    };
    log("is touch: $state");
  }
}
