import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stitchin_time/providers/app_state_provider.dart';
import 'package:stitchin_time/providers/chart_block_provider.dart';
import 'package:stitchin_time/providers/platform_provider.dart';
import 'package:stitchin_time/providers/view_provider.dart';

class ChartShortcuts extends ConsumerWidget {
  const ChartShortcuts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerSignal: (event) {
        ref.read(lastUsedPointerDeviceKindIsTouchProvider.notifier).set(event.kind);

        if (event is PointerScrollEvent) {
          ref.read(lastUsedPointerDeviceKindIsTouchProvider.notifier).set(event.kind);
          ref.read(viewProvider.notifier).zoomStepped(-event.scrollDelta.dy.sign.toInt());
        }
      },
      child: CallbackShortcuts(
        bindings: {
          const SingleActivator(LogicalKeyboardKey.space): () => ref.read(chartBlockProvider.notifier).advance(),
          const SingleActivator(LogicalKeyboardKey.keyS): () => ref.read(viewProvider.notifier).toggleSettings(),
          const SingleActivator(LogicalKeyboardKey.tab): () =>
              ref.read(appStateProvider.notifier).set(AppStateType.edit),
        },
        child: Focus(
          autofocus: true,
          child: OverflowBox(maxWidth: double.infinity, maxHeight: double.infinity),
        ),
      ),
    );
  }
}
