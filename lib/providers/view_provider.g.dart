// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(View)
const viewProvider = ViewProvider._();

final class ViewProvider extends $NotifierProvider<View, ViewModel> {
  const ViewProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'viewProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$viewHash();

  @$internal
  @override
  View create() => View();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ViewModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ViewModel>(value),
    );
  }
}

String _$viewHash() => r'e15b1e73d202c7c9b2a282bcac0da087fe2e8950';

abstract class _$View extends $Notifier<ViewModel> {
  ViewModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ViewModel, ViewModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ViewModel, ViewModel>,
              ViewModel,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
