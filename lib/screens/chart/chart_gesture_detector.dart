
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stitchin_time/providers/chart_offset_provider.dart';
import 'package:stitchin_time/providers/view_provider.dart';

class ChartGestureDetector extends HookConsumerWidget {
  const ChartGestureDetector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<double> cachedPrevScale = useState(1.0);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      onScaleUpdate: (details) => _onScaleUpdate(details, cachedPrevScale, ref),
      onScaleEnd: (details) => _onScaleEnd(details, ref),
    );
  }

  void _onScaleUpdate(
    ScaleUpdateDetails details,
    ValueNotifier<double> cachedPrevScale,
    WidgetRef ref,
  ) {
    double delta = details.scale - cachedPrevScale.value;
    cachedPrevScale.value = details.scale;
    var focalPointDeltaAdjusted = Offset(
      details.focalPointDelta.dx,
      details.focalPointDelta.dy * 0.2,
    );

    ref.read(chartOffsetProvider.notifier).add(focalPointDeltaAdjusted);
    if (details.scale == 1.0) return;
    ref.read(viewProvider.notifier).zoom(delta);
  }

  void _onScaleEnd(ScaleEndDetails details, WidgetRef ref) {
    ref.read(chartOffsetProvider.notifier).set(Offset(0, 0));
  }
}
