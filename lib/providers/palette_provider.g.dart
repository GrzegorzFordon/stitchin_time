// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'palette_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Palette)
const paletteProvider = PaletteProvider._();

final class PaletteProvider extends $NotifierProvider<Palette, PaletteModel> {
  const PaletteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paletteProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paletteHash();

  @$internal
  @override
  Palette create() => Palette();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PaletteModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PaletteModel>(value),
    );
  }
}

String _$paletteHash() => r'93c3dfdcb491839b9d87a68fa06c7ac5ca701c77';

abstract class _$Palette extends $Notifier<PaletteModel> {
  PaletteModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<PaletteModel, PaletteModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PaletteModel, PaletteModel>,
              PaletteModel,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
