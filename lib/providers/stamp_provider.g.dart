// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stamp_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Stamp)
const stampProvider = StampProvider._();

final class StampProvider extends $NotifierProvider<Stamp, PatternModel> {
  const StampProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stampProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stampHash();

  @$internal
  @override
  Stamp create() => Stamp();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PatternModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PatternModel>(value),
    );
  }
}

String _$stampHash() => r'9473fc174515e35c4c60e702c33352d4b1b33f1b';

abstract class _$Stamp extends $Notifier<PatternModel> {
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
