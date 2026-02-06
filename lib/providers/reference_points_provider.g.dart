// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference_points_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReferencePoints)
const referencePointsProvider = ReferencePointsProvider._();

final class ReferencePointsProvider
    extends $NotifierProvider<ReferencePoints, List<Offset>> {
  const ReferencePointsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'referencePointsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$referencePointsHash();

  @$internal
  @override
  ReferencePoints create() => ReferencePoints();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Offset> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Offset>>(value),
    );
  }
}

String _$referencePointsHash() => r'8eaf64dc4150541e194f9190612b453152314eac';

abstract class _$ReferencePoints extends $Notifier<List<Offset>> {
  List<Offset> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Offset>, List<Offset>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Offset>, List<Offset>>,
              List<Offset>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
