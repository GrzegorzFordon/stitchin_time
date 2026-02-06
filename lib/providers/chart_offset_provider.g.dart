// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_offset_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChartOffset)
const chartOffsetProvider = ChartOffsetProvider._();

final class ChartOffsetProvider extends $NotifierProvider<ChartOffset, Offset> {
  const ChartOffsetProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chartOffsetProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chartOffsetHash();

  @$internal
  @override
  ChartOffset create() => ChartOffset();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Offset value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Offset>(value),
    );
  }
}

String _$chartOffsetHash() => r'27439b8418292393162596f3eb14033e09e6f18a';

abstract class _$ChartOffset extends $Notifier<Offset> {
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
