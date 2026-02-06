// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppState)
const appStateProvider = AppStateProvider._();

final class AppStateProvider extends $NotifierProvider<AppState, AppStateType> {
  const AppStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appStateHash();

  @$internal
  @override
  AppState create() => AppState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppStateType value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppStateType>(value),
    );
  }
}

String _$appStateHash() => r'f52e33d5bfb6da1026095ff161ae5807f90786fa';

abstract class _$AppState extends $Notifier<AppStateType> {
  AppStateType build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AppStateType, AppStateType>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppStateType, AppStateType>,
              AppStateType,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
