import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:stitchin_time/models/tool_model.dart';
import 'package:stitchin_time/providers/app_state_provider.dart';
import 'package:stitchin_time/providers/canvas_offset_provider.dart';
import 'package:stitchin_time/providers/canvas_provider.dart';
import 'package:stitchin_time/providers/palette_provider.dart';
import 'package:stitchin_time/providers/pattern_provider.dart';
import 'package:stitchin_time/providers/platform_provider.dart';
import 'package:stitchin_time/providers/tool_provider.dart';

class EditShortcuts extends ConsumerWidget {
  const EditShortcuts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerHover: (event) => ref.read(lastUsedPointerDeviceKindIsTouchProvider.notifier).set(event.kind),
      onPointerSignal: (event) {
        ref.read(lastUsedPointerDeviceKindIsTouchProvider.notifier).set(event.kind);

        log(event.toString());
        if (event is PointerScrollEvent) {
          ref.read(canvasProvider.notifier).zoomStepped(-event.scrollDelta.dy.sign.toInt());
        }
      },
      child: CallbackShortcuts(
        bindings: {
          const SingleActivator(LogicalKeyboardKey.digit1): () => ref.read(toolProvider.notifier).set(ToolType.brush),
          const SingleActivator(LogicalKeyboardKey.digit2): () => ref.read(toolProvider.notifier).set(ToolType.line),
          const SingleActivator(LogicalKeyboardKey.digit3): () => ref.read(toolProvider.notifier).set(ToolType.square),
          const SingleActivator(LogicalKeyboardKey.digit4): () => ref.read(toolProvider.notifier).set(ToolType.select),
          const SingleActivator(LogicalKeyboardKey.digit5): () => ref.read(toolProvider.notifier).set(ToolType.stamp),
          const SingleActivator(LogicalKeyboardKey.digit6): () => ref.read(toolProvider.notifier).set(ToolType.pan),
          const SingleActivator(LogicalKeyboardKey.digit7): () => ref.read(toolProvider.notifier).set(ToolType.fill),

          const SingleActivator(LogicalKeyboardKey.digit1, shift: true): () =>
              ref.read(paletteProvider.notifier).setActiveIndex(1),
          const SingleActivator(LogicalKeyboardKey.digit2, shift: true): () =>
              ref.read(paletteProvider.notifier).setActiveIndex(2),
          const SingleActivator(LogicalKeyboardKey.digit3, shift: true): () =>
              ref.read(paletteProvider.notifier).setActiveIndex(3),

          const SingleActivator(LogicalKeyboardKey.keyE): () => ref.read(canvasProvider.notifier).toggleEraser(),
          const SingleActivator(LogicalKeyboardKey.keyR): () => ref.read(canvasOffsetProvider.notifier).reset(),
          const SingleActivator(LogicalKeyboardKey.keyS): () => ref.read(canvasProvider.notifier).toggleSettings(),

          const SingleActivator(LogicalKeyboardKey.backspace): () => ref.read(patternProvider.notifier).undo(),
          const SingleActivator(LogicalKeyboardKey.keyZ, control: true): () =>
              ref.read(patternProvider.notifier).undo(),
          const SingleActivator(LogicalKeyboardKey.keyY, control: true): () =>
              ref.read(patternProvider.notifier).redo(),

          const SingleActivator(LogicalKeyboardKey.tab): () =>
              ref.read(appStateProvider.notifier).set(AppStateType.chart),
        },

        child: Focus(
          focusNode: FocusNode(),
          autofocus: true,
          child: OverflowBox(maxHeight: double.infinity, maxWidth: double.infinity),
        ),
      ),
    );
  }
}
