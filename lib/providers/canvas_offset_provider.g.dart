// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'canvas_offset_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CanvasOffset)
const canvasOffsetProvider = CanvasOffsetProvider._();

final class CanvasOffsetProvider
    extends $NotifierProvider<CanvasOffset, Offset> {
  const CanvasOffsetProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'canvasOffsetProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$canvasOffsetHash();

  @$internal
  @override
  CanvasOffset create() => CanvasOffset();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Offset value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Offset>(value),
    );
  }
}

String _$canvasOffsetHash() => r'f39e5031c36a7f377e22c8cb3ce4ea653efc7d00';

abstract class _$CanvasOffset extends $Notifier<Offset> {
  Offset build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Offset, Offset>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Offset, Offset>,
              Offset,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
