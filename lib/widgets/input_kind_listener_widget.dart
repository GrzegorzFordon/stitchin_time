import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stitchin_time/providers/platform_provider.dart';

class InputKindListenerWidget extends ConsumerWidget {
  const InputKindListenerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (event) => ref.read(lastUsedPointerDeviceKindIsTouchProvider.notifier).set(event.kind),
      child: OverflowBox(
        maxWidth: double.infinity,
        maxHeight: double.infinity,
        child: Container(height: 1000, width: 1000, color: Colors.green.withAlpha(0)),
      ),
    );
  }
}
