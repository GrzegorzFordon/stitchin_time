// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(History)
const historyProvider = HistoryProvider._();

final class HistoryProvider extends $NotifierProvider<History, HistoryModel> {
  const HistoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'historyProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$historyHash();

  @$internal
  @override
  History create() => History();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HistoryModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HistoryModel>(value),
    );
  }
}

String _$historyHash() => r'75335cd20ef1ae54de7df5b7faf2a58174764bd5';

abstract class _$History extends $Notifier<HistoryModel> {
  HistoryModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<HistoryModel, HistoryModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<HistoryModel, HistoryModel>,
              HistoryModel,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
