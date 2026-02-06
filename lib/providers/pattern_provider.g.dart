// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pattern_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Pattern)
const patternProvider = PatternProvider._();

final class PatternProvider extends $NotifierProvider<Pattern, PatternModel> {
  const PatternProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'patternProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$patternHash();

  @$internal
  @override
  Pattern create() => Pattern();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PatternModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PatternModel>(value),
    );
  }
}

String _$patternHash() => r'f14a9a9ae6d69ac0ead22660bc638070e8610e43';

abstract class _$Pattern extends $Notifier<PatternModel> {
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
