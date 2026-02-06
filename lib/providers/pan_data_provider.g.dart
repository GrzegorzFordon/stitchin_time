// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pan_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PanData)
const panDataProvider = PanDataProvider._();

final class PanDataProvider extends $NotifierProvider<PanData, PanDataModel> {
  const PanDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'panDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$panDataHash();

  @$internal
  @override
  PanData create() => PanData();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PanDataModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PanDataModel>(value),
    );
  }
}

String _$panDataHash() => r'b601204c8a1467f20bdb48d0d935f2531e186ef9';

abstract class _$PanData extends $Notifier<PanDataModel> {
  PanDataModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<PanDataModel, PanDataModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PanDataModel, PanDataModel>,
              PanDataModel,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
