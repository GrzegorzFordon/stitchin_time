// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'references_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(References)
const referencesProvider = ReferencesProvider._();

final class ReferencesProvider
    extends $NotifierProvider<References, ReferencesModel> {
  const ReferencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'referencesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$referencesHash();

  @$internal
  @override
  References create() => References();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReferencesModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReferencesModel>(value),
    );
  }
}

String _$referencesHash() => r'93058e3bdbfbfd9c7bb9ac3a7dc3b0bbd36b20fa';

abstract class _$References extends $Notifier<ReferencesModel> {
  ReferencesModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ReferencesModel, ReferencesModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ReferencesModel, ReferencesModel>,
              ReferencesModel,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
