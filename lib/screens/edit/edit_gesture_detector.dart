import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stitchin_time/models/canvas_model.dart';
import 'package:stitchin_time/providers/canvas_offset_provider.dart';
import 'package:stitchin_time/providers/canvas_provider.dart';

class EditScreenGestureDetector extends HookConsumerWidget {
  final Widget child;
  const EditScreenGestureDetector({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<double> cachedPrevScale = useState(1.0);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      dragStartBehavior: DragStartBehavior.down,
      onScaleUpdate: (details) => _mobileZoom(details, ref, cachedPrevScale, context),
      child: child,
    );
  }

  void _mobileZoom(
    ScaleUpdateDetails details,
    WidgetRef ref,
    ValueNotifier<double> cachedPrevScale,
    BuildContext context,
  ) {
    double delta = details.scale - cachedPrevScale.value;
    cachedPrevScale.value = details.scale;

    ref.read(canvasOffsetProvider.notifier).add(details.focalPointDelta);
    if (details.scale == 1.0) return;
    if (details.pointerCount < 2) return;

    ref.read(canvasProvider.notifier).zoomRange(delta);
    _adjustOffsetForZoom(context, details, delta, ref);
  }

  void _adjustOffsetForZoom(BuildContext context, ScaleUpdateDetails details, double delta, WidgetRef ref) {
    Offset canvasOffset = ref.watch(canvasOffsetProvider);
    CanvasModel canvasModel = ref.watch(canvasProvider);
    if (canvasModel.zoomInfo.zoomValue >= 1.5 || canvasModel.zoomInfo.zoomValue <= 0.2) return;
    Size size = context.size!;
    Offset halfSize = Offset(size.width * 0.5, size.height * 0.5);
    canvasOffset += halfSize;

    Offset localFocalPoint = details.localFocalPoint;

    Offset difference = (canvasOffset - localFocalPoint) * delta / canvasModel.zoomInfo.zoomValue;

    if (details.scale == 1.0) return;
    ref.read(canvasOffsetProvider.notifier).add(difference);
  }
}
