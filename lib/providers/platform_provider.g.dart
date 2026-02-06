// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LastUsedPointerDeviceKindIsTouch)
const lastUsedPointerDeviceKindIsTouchProvider =
    LastUsedPointerDeviceKindIsTouchProvider._();

final class LastUsedPointerDeviceKindIsTouchProvider
    extends $NotifierProvider<LastUsedPointerDeviceKindIsTouch, bool> {
  const LastUsedPointerDeviceKindIsTouchProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lastUsedPointerDeviceKindIsTouchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lastUsedPointerDeviceKindIsTouchHash();

  @$internal
  @override
  LastUsedPointerDeviceKindIsTouch create() =>
      LastUsedPointerDeviceKindIsTouch();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$lastUsedPointerDeviceKindIsTouchHash() =>
    r'2bd8a2488ac4d0657e5e447c59d1f78093cc1211';

abstract class _$LastUsedPointerDeviceKindIsTouch extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
