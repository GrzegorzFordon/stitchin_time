// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overpaint_pattern_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OverpaintPattern)
const overpaintPatternProvider = OverpaintPatternProvider._();

final class OverpaintPatternProvider
    extends $NotifierProvider<OverpaintPattern, PatternModel> {
  const OverpaintPatternProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'overpaintPatternProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$overpaintPatternHash();

  @$internal
  @override
  OverpaintPattern create() => OverpaintPattern();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PatternModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PatternModel>(value),
    );
  }
}

String _$overpaintPatternHash() => r'71c62b3f7dc1cd91861c71c2ab071c3c276399a0';

abstract class _$OverpaintPattern extends $Notifier<PatternModel> {
  PatternModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<PatternModel, PatternModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PatternModel, PatternModel>,
              PatternModel,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
