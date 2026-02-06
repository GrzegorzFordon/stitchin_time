// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_block_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChartBlock)
const chartBlockProvider = ChartBlockProvider._();

final class ChartBlockProvider
    extends $NotifierProvider<ChartBlock, GridSelectionModel> {
  const ChartBlockProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chartBlockProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chartBlockHash();

  @$internal
  @override
  ChartBlock create() => ChartBlock();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GridSelectionModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GridSelectionModel>(value),
    );
  }
}

String _$chartBlockHash() => r'fb4fd64d0beac46f2e00798e9d3700e1a538c934';

abstract class _$ChartBlock extends $Notifier<GridSelectionModel> {
  GridSelectionModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<GridSelectionModel, GridSelectionModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GridSelectionModel, GridSelectionModel>,
              GridSelectionModel,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
