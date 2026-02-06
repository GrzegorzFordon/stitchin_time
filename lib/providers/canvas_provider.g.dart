// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'canvas_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Canvas)
const canvasProvider = CanvasProvider._();

final class CanvasProvider extends $NotifierProvider<Canvas, CanvasModel> {
  const CanvasProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'canvasProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$canvasHash();

  @$internal
  @override
  Canvas create() => Canvas();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CanvasModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CanvasModel>(value),
    );
  }
}

String _$canvasHash() => r'6e2fe6f287873207ffdadaff82e370d9ed0b842f';

abstract class _$Canvas extends $Notifier<CanvasModel> {
  CanvasModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CanvasModel, CanvasModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CanvasModel, CanvasModel>,
              CanvasModel,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
