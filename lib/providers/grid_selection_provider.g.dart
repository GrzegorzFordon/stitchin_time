// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grid_selection_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GridSelection)
const gridSelectionProvider = GridSelectionProvider._();

final class GridSelectionProvider
    extends $NotifierProvider<GridSelection, GridSelectionModel> {
  const GridSelectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gridSelectionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gridSelectionHash();

  @$internal
  @override
  GridSelection create() => GridSelection();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GridSelectionModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GridSelectionModel>(value),
    );
  }
}

String _$gridSelectionHash() => r'5d2b170e14635524b45adc0457f5524f518075b0';

abstract class _$GridSelection extends $Notifier<GridSelectionModel> {
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
